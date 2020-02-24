--disabling unwanted room settings
tfm.exec.disableAutoNewGame()
tfm.exec.disableAutoTimeLeft()
tfm.exec.disableAfkDeath()

--game variables
local points, players

function main()
    points = {}
    players = {}
    tfm.exec.newGame(map)
end
