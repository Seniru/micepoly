function eventNewGame()
    
    --parsing the map's xml and getting the land points
    local mapDom = parseXml(map, true)
    for _, o in next, path(mapDom, "Z", "S", "S") do
        if o.attribute.lua then
            points[tonumber(o.attribute.lua)] = {x = o.attribute.X, y = o.attribute.Y}
        end
    end

    --initializing the players
    for name, player in next, tfm.get.room.playerList do
        players[name] = Player(name) 
    end

    --initializing the lands
    initLands()

end
