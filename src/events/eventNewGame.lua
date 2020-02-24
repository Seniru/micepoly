function eventNewGame()
    local mapDom = parseXml(map, true)
    for _, o in next, path(mapDom, "Z", "S", "S") do
        if o.attribute.lua then
            points[tonumber(o.attribute.lua)] = {x = o.attribute.X, y = o.attribute.Y}
        end
    end
end
