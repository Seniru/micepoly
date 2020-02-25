--disabling unwanted room settings
tfm.exec.disableAutoNewGame()
tfm.exec.disableAutoTimeLeft()
tfm.exec.disableAfkDeath()
tfm.exec.disableAutoShaman()
tfm.exec.disableMortCommand()

function initLands()

    -- configuring the lands
    lands[1] = Land("Go", nil, nil, 1, true)
    lands[2] = Land("Buffy`s Residence", 600, "purple", 2)
    lands[3] = Land("Community Chest", nil, nil, 3, true)
    lands[4] = Land("Transformice Museum", 600, "purple", 4)
    lands[5] = Land("Income Tax", nil, nil, 5, true)
    lands[6] = Land("Shaman`s Teleporter", 2000, "teleporter", 6)
    lands[7] = Land("801 Town", 1000, "light blue", 7)
    lands[8] = Land("Chance", nil, nil, 8, true)
    lands[9] = Land("Grim`s Mansion", 1000, "light blue", 9)
    lands[10] = Land("Nuremberg", 1200, "light blue", 10)
    lands[11] = Land("Jail", nil, nil, 11, true)
    lands[12] = Land("Jingle`s abode", 1400, "magenta", 12)
    lands[13] = Land("Cheese factory", 1500, "factory", 13)
    lands[14] = Land("Salvador", 1400, "magenta", 14)
    lands[15] = Land("Charlotte`s Tree Stump", 1600, "magenta", 15)
    lands[16] = Land("Cheese Hole Teleporter", 2000, "teleporter", 16)
    lands[17] = Land("King Fromagnus`s Castle", 1800, "orange", 17)
    lands[18] = Land("Community Chest", nil, nil, 18, true)
    lands[19] = Land("Land of Dream", 1800, "orange", 19)
    lands[20] = Land("Garden of Roses", 2000, "orange", 20)
    lands[21] = Land("Free Parking", nil, nil, 21, true)
    lands[22] = Land("Ol` Souris", 2200, "red", 22)
    lands[23] = Land("Chance", nil, nil, 23, true)
    lands[24] = Land("Cheze Gustave", 2200, "red", 24)
    lands[25] = Land("Konomouse", 2400, "red", 25)
    lands[26] = Land("Elisah`s Teleporter", 2000, "teleporter", 26)
    lands[27] = Land("Kürbisses-Nacht Streets", 2600, "yellow", 27)
    lands[28] = Land("Kürbisses-Nacht Attic", 2600, "yellow", 28)
    lands[29] = Land("Fraises Factory", 1500, "factory", 29)
    lands[30] = Land("Kürbisses-Nacht Graveyard", 2800, "yellow", 30)
    lands[31] = Land("Go to Jail", nil, nil, 31, true)
    lands[32] = Land("Amazonia", 3000, "green", 32)
    lands[33] = Land("Antic Jungle", 3000, "green", 33)
    lands[34] = Land("Community Chest", nil, nil, 34, true)
    lands[35] = Land("Crystal Jungle", 3000, "green", 35)
    lands[36] = Land("Portal Teleporter", 2000, "teleporter", 36)
    lands[37] = Land("Chance", nil, nil, 37, true)
    lands[38] = Land("Haunted Library", 3500, "dark blue", 38)
    lands[39] = Land("Super Tax", nil, nil, 39, true)
    lands[40] = Land("Temple", 4000, "dark blue", 40)
    
    --overriding the behaviours of special lands
    lands[1].onLand = function(self, player)
        player.money = player.money + 2000
    end
    
    displayLands()
    
end

function displayLands(target)
    for id, land in next, lands do
        ui.addTextArea(1000 + id, "<b>" .. land.name .. "</b>", target, land.locX - 20, land.locY - 10, 60, 30, nil, nil, 0, true)
    end
end

function main()
    tfm.exec.newGame(lobby)
end
