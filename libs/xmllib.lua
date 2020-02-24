--[[ Makinit's XML library ]]--
local _ = "Makinit's XML library"
local namePattern = "[%a_:][%w%.%-_:]*"
function parseXml(xml, fast)
    if not fast then
        xml = string.gsub(xml, "<!%[CDATA%[(.-)%]%]>", xmlEscape) -- replace CDATA with escaped text
        xml = string.gsub(xml, "<%?.-%?>", "") -- remove processing instructions
        xml = string.gsub(xml, "<!%-%-.-%-%->", "") -- remove comments
        xml = string.gsub(xml, "<!.->", "")
    end
    local root = {}
    local parents = {}
    local element = root
    for closing, name, attributes, empty, text in string.gmatch(xml, "<(/?)(" .. namePattern .. ")(.-)(/?)>%s*([^<]*)%s*") do
        if closing == "/" then
            local parent = parents[element]
            if parent and name == element.name then
                element = parent
            end
        else
            local child = {name = name, attribute = {}}
            table.insert(element, child)
            parents[child] = element
            if empty ~= "/" then
                element = child
            end
            for name, value in string.gmatch(attributes, "(" .. namePattern .. ")%s*=%s*\"(.-)\"") do
                child.attribute[name] = fast and value or xmlUnescape(value)
            end
        end
        if text ~= "" then
            local child = {text = fast and text or xmlUnescape(text)}
            table.insert(element, child)
            parents[child] = element
        end
    end
    return root[1]
end

function generateXml(element, fast)
    if element.name then
        local xml = "<" .. element.name
        for name, value in pairs(element.attribute) do
            xml = xml .. " " .. name .. "=\"" .. (fast and tostring(value) or xmlEscape(tostring(value))) .. "\""
        end
        if #element == 0 then
            xml = xml .. " />"
        else
            xml = xml .. ">"
            for i, child in ipairs(element) do
                xml = xml .. generateXml(child, fast)
            end
            xml = xml .. "</" .. element.name .. ">"
        end
        return xml
    elseif element.text then
        return fast and tostring(element.text) or xmlEscape(tostring(element.text))
    end
end

function path(nodes, ...)
    nodes = {nodes}
    for i, name in ipairs(arg) do
        local match = {}
        for i, node in ipairs(nodes) do
            for i, child in ipairs(node) do
                if child.name == name then
                    table.insert(match, child)
                end
            end
        end
        nodes = match
    end
    return nodes
end

--(un)escape functions
local escapeCache = {}
function xmlEscape(s)
    local r = escapeCache[s ]
    if not r then    
        local g = string.gsub
        r = g(s, "&", "&amp;")
        r = g(r, "\"", "&quot;")
        r = g(r, "'", "&apos;")
        r = g(r, "<", "&lt;")
        r = g(r, ">", "&gt;")
        escapeCache[s ] = r
    end
    return r
end
local unescapeCache = {}
function xmlUnescape(s)
    local r = unescapeCache[s ]
    if not r then
        local g = string.gsub
        r = g(s, "&quot;", "\"")
        r = g(r, "&apos;", "'")
        r = g(r, "&lt;", "<")
        r = g(r, "&gt;", ">")
        r = g(r, "&#(%d%d?%d?%d?);", dec2char)
        r = g(r, "&#x(%x%x?%x?%x?);", hex2char)
        r = g(r, "&amp;", "&")
        unescapeCache[s ] = r
    end
    return r
end
function dec2char(code)
    code = tonumber(code)
    return string.char(code > 255 and 0 or code)
end
function hex2char(code)
    code = tonumber(code, 16)
    return string.char(code > 255 and 0 or code)
end
