--disabling unwanted room settings
tfm.exec.disableAutoNewGame()
tfm.exec.disableAutoTimeLeft()

--game variables
local points

function main()
    points = {}
    tfm.exec.newGame(map)
end
