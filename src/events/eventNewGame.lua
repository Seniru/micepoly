function eventNewGame()
    
    if gameStarted then
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
