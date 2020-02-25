--disabling unwanted room settings
tfm.exec.disableAutoNewGame()
tfm.exec.disableAutoTimeLeft()
tfm.exec.disableAfkDeath()
tfm.exec.disableAutoShaman()
tfm.exec.disableMortCommand()

function initLands()

    --[[ configuring the lands
        format: name, price, group (color), landIndex, landRent, house1Rent, house2Rent,
        house3Rent, house4Rent, hotelRent, buildCost
    ]]
    lands[1] = Land("Go", nil, nil, 1, nil, nil, nil, nil, nil, nil, nil, true)
    lands[2] = Land("Buffy`s Residence", 600, "purple", 2, 20, 100, 300, 900, 1600, 2500, 500)
    lands[3] = Land("Community Chest", nil, nil, 3, nil, nil, nil, nil, nil, nil, nil, true)
    lands[4] = Land("Transformice Museum", 600, "purple", 4, 40, 200, 600, 1800, 3200, 4500, 500)
    lands[5] = Land("Income Tax", nil, nil, 5, nil, nil, nil, nil, nil, nil, nil, true)
    lands[6] = Land("Shaman`s Teleporter", 2000, "teleporter", 6, 250, 500, 1000, 2000)
    lands[7] = Land("801 Town", 1000, "light blue", 7, 60, 300, 900, 2700, 4000, 5500, 500)
    lands[8] = Land("Chance", nil, nil, 8, nil, nil, nil, nil, nil, nil, nil, true)
    lands[9] = Land("Grim`s Mansion", 1000, "light blue", 9, 60, 300, 900, 2700, 4000, 5500, 500)
    lands[10] = Land("Nuremberg", 1200, "light blue", 10, 80, 400, 1000, 3000, 4500, 6000, 500)
    lands[11] = Land("Jail", nil, nil, 11, nil, nil, nil, nil, nil, nil, nil, true)
    lands[12] = Land("Jingle`s abode", 1400, "magenta", 12, 100, 500, 1500, 4500, 6250, 7500, 1000)
    lands[13] = Land("Cheese factory", 1500, "factory", 13, 4, 10, nil, nil, nil, nil, nil, true)
    lands[14] = Land("Salvador", 1400, "magenta", 14, 100, 500, 1500, 4500, 6250, 7500, 1000)
    lands[15] = Land("Charlotte`s Tree Stump", 1600, "magenta", 15, 120, 600, 1800, 5000, 7000, 9000, 1000)
    lands[16] = Land("Cheese Hole Teleporter", 2000, "teleporter", 16, 250, 500, 1000, 2000)
    lands[17] = Land("King Fromagnus`s Castle", 1800, "orange", 17, 140, 700, 2000, 5500, 7500, 9500, 1000)
    lands[18] = Land("Community Chest", nil, nil, 18, nil, nil, nil, nil, nil, nil, nil, true)
    lands[19] = Land("Land of Dream", 1800, "orange", 19, 140, 700, 2000, 5500, 7500, 9500, 1000)
    lands[20] = Land("Garden of Roses", 2000, "orange", 20, 160, 80, 2200, 6000, 8000, 10000, 1000)
    lands[21] = Land("Free Parking", nil, nil, 21, nil, nil, nil, nil, nil, nil, nil, true)
    lands[22] = Land("Ol` Souris", 2200, "red", 22, 180, 900, 2500, 7000, 8750, 10000, 1500)
    lands[23] = Land("Chance", nil, nil, 23, nil, nil, nil, nil, nil, nil, nil, true)
    lands[24] = Land("Cheze Gustave", 2200, "red", 24, 180, 900, 2500, 7000, 8750, 10000, 1500)
    lands[25] = Land("Konomouse", 2400, "red", 25, 200, 1000, 3000, 7500, 9250, 11000, 1500)
    lands[26] = Land("Elisah`s Teleporter", 2000, "teleporter", 26, 250, 500, 1000, 2000)
    lands[27] = Land("Kürbisses-Nacht Streets", 2600, "yellow", 27, 220, 1100, 3300, 8000, 9750, 11500, 1500)
    lands[28] = Land("Kürbisses-Nacht Attic", 2600, "yellow", 28, 220, 1100, 3300, 8000, 9750, 11500, 1500)
    lands[29] = Land("Fraises Factory", 1500, "factory", 29, 4, 10, nil, nil, nil, nil, nil, true)
    lands[30] = Land("Kürbisses-Nacht Graveyard", 2800, "yellow", 30, 240, 1200, 3600, 8500, 10250, 12000, 1500)
    lands[31] = Land("Go to Jail", nil, nil, 31, nil, nil, nil, nil, nil, nil, nil, true)
    lands[32] = Land("Amazonia", 3000, "green", 32, 260, 1300, 3900, 9000, 11000, 12750, 2000)
    lands[33] = Land("Antic Jungle", 3000, "green", 33, 1300, 3900, 9000, 11000, 12750, 2000)
    lands[34] = Land("Community Chest", nil, nil, 34, nil, nil, nil, nil, nil, nil, nil, true)
    lands[35] = Land("Crystal Jungle", 3000, "green", 35, 280, 1500, 4500, 10000, 12000, 14000, 2000)
    lands[36] = Land("Portal Teleporter", 2000, "teleporter", 36, 250, 500, 1000, 2000)
    lands[37] = Land("Chance", nil, nil, 37, nil, nil, nil, nil, nil, nil, nil, true)
    lands[38] = Land("Haunted Library", 3500, "dark blue", 38, 350, 1750, 5000, 11000, 13000, 15000, 2000)
    lands[39] = Land("Super Tax", nil, nil, 39, nil, nil, nil, nil, nil, nil, nil, true)
    lands[40] = Land("Temple", 4000, "dark blue", 40, 500, 2000, 6000, 14000, 17000, 20000, 2000)
    
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
