function eventNewGame()
    
    if gameStarted then
        --parsing the map's xml and getting the land points
        local mapDom = parseXml(map, true)
        local cloudId = tostring(tfm.enum.ground.cloud)
        for _, o in next, path(mapDom, "Z", "S", "S") do
            --getting normal land points
            if o.attribute.lua and o.attribute.T == cloudId then
                points[tonumber(o.attribute.lua)] = {x = o.attribute.X, y = o.attribute.Y}
            elseif o.attribute.lua then  --getting house points
                local landId, houseId = o.attribute.lua:match("^(%d+)0(%d)$")
                landId = tonumber(landId)
                houseId = tonumber(houseId)
                if not housePoints[landId] then
                    housePoints[landId] = {[houseId] = {
                        x = o.attribute.X,
                        y = o.attribute.Y,
                        w = o.attribute.L,
                        h = o.attribute.H
                    }}
                else
                    housePoints[landId][houseId] = {
                        x = o.attribute.X,
                        y = o.attribute.Y,
                        w = o.attribute.L,
                        h = o.attribute.H
                    }
                end
            end
        end

        --initializing the players
        for name, player in next, tfm.get.room.playerList do
            players[name] = Player(name)
            --tfm.exec.killPlayer(name)
        end

        --initializing lands and cards
        initLands()
        initCards()

        --giving the turn to the first player
        changeTurn()
   
    else
        for _, _ in next, tfm.get.room.playerList do
            totalPlayers = totalPlayers + 1
        end
        if totalPlayers >= 2 then
            tfm.exec.chatMessage("Starting the game in 10 seconds...")
            Timer("start game", function()
                gameStarted = true
                tfm.exec.newGame(map)
                setUI()
                --todo: set this 10 seconds
            end, 4000, false)
        end
    end

end
