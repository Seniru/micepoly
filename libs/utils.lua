function split(s, delimiter)
    result = {};
    for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
        table.insert(result, match);
    end
    return result;
end

function shuffle(tbl)
    math.randomseed(os.time())
    for i = 1, #tbl do
        local j = math.random(i)
        tbl[i], tbl[j] = tbl[j], tbl[i]
    end
end

function getNext(tbl, current)
    return next(tbl, current) or next(tbl)
end

function table.tostring(tbl, depth)
    local res = "{"
    for k, v in next, tbl do
        if type(v) == "table" then
            if depth == nil or depth > 0 then
                res = res .. (type(k) == "number" and "" or k .. ": ") .. table.tostring(v, depth and depth - 1 or nil) .. ", "
            else
                res = res .. k .. ": {...}, "
            end
        else
            res = res .. (type(k) == "number" and "" or k .. ":") .. tostring(v) .. ", "
        end
    end
    return res:sub(1, res:len() - 2) .. "}"
end
