function eventNewPlayer(name)
    totalPlayers = totalPlayers + 1
    if gameStarted then
        displayLands(name)
    elseif not gameStarted and totalPlayers >= 2 then
        tfm.exec.chatMessage("Starting the game in 10 seconds...")
        Timer("start game", function()
            gameStarted = true
            tfm.exec.newGame(map)
        end, 10000, false)
    end
end
