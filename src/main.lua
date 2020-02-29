--disabling unwanted room settings
tfm.exec.disableAutoNewGame()
tfm.exec.disableAutoTimeLeft()
tfm.exec.disableAfkDeath()
tfm.exec.disableAutoShaman()
tfm.exec.disableMortCommand()

function initCards()
    
    chances = {
        Chance:new(1, "Do nothing", "This card is just a test", function(player) 
            print("Do nothing " .. player.name)
        end)
    }

    communityChests = {
        CommunityChest:new(1, "Do nothing", "This card is just a test", function(player) 
            print("Do nothing " .. player.name)
        end)
    }

end

function initLands()

    --[[ configuring the lands
        format: name, price, group (color), landIndex, landRent, house1Rent, house2Rent,
        house3Rent, house4Rent, hotelRent, buildCost
    ]]
    --Land {"name", 0, "red", landRent = 1, house1Rent = 10, house2Rent = 10, house3Rent = 100, house4Rent = 1000, hotelRent = 1000, buildCost = 10000, isSpecial = true}
    lands[1] = Land{1, "Go", isSpecial = true}
    lands[2] = Land{2, "Buffy`s Residence", price = 600, color = "purple", landRent = 20, house1Rent = 100, house2Rent = 300, house3Rent = 900, house4Rent = 1600, hotelRent = 2500, buildCost = 500}
    lands[3] = Land{3, "Community Chest", isSpecial = true}
    lands[4] = Land{4, "Transformice Museum", price = 600, color = "purple", landRent = 40, house1Rent = 200, house2Rent = 600, house3Rent = 1800, house4Rent = 3200, hotelRent = 4500, buildCost = 500}
    lands[5] = Land{5, "Income Tax", isSpecial = true}
    lands[6] = Land{6, "Shaman`s Teleporter", price = 2000, color = "teleporter", landRent = 250, house1Rent = 500, house2Rent = 1000, house3Rent = 2000}
    lands[7] = Land{7, "801 Town", price = 1000, color = "light blue", landRent =  60, house1Rent = 300, house2Rent = 900, house3Rent = 2700, house4Rent = 4000, hotelRent = 5500, buildCost = 500}
    lands[8] = Land{8, "Chance", isSpecial = true}
    lands[9] = Land{9, "Grim`s Mansion", price = 1000, color = "light blue", landRent = 60, house1Rent = 300, house2Rent = 900, house3Rent = 2700, house4Rent = 4000, hotelRent = 5500, buildCost = 500}
    lands[10] = Land{10, "Nuremberg", price = 1200, color = "light blue", landRent = 80, house1Rent = 400, house2Rent = 1000, house3Rent = 3000, house4Rent = 4500, hotelRent = 6000, buildCost = 500}
    lands[11] = Land{11, "Jail", isSpecial = true}
    lands[12] = Land{12, "Jingle`s abode", price = 1400, color = "magenta", landRent = 100, house1Rent = 500, house2Rent = 1500, house3Rent = 4500, house4Rent = 6250, hotelRent = 7500, buildCost = 1000}
    lands[13] = Land{13, "Cheese factory", price = 1500, color = "factory", landRent = 4, house1Rent = 10, isSpecial = true}
    lands[14] = Land{14, "Salvador", price = 1400, color =  "magenta", landRent = 100, house1Rent =  500, house2Rent =  1500, house3Rent = 4500, house4Rent =  6250, hotelRent = 7500, buildCost = 1000}
    lands[15] = Land{15, "Charlotte`s Tree Stump", price = 1600, color = "magenta", landRent = 120, house1Rent = 600, house2Rent = 1800, house3Rent = 5000, house4Rent = 7000, hotelRent = 9000, buildCost = 1000}
    lands[16] = Land{16, "Cheese Hole Teleporter", price = 2000, color = "teleporter", landRent = 250, house1Rent = 500, house2Rent = 1000, house3Rent = 2000}
    lands[17] = Land{17, "King Fromagnus`s Castle", price = 1800, color = "orange", landRent = 140, house1Rent = 700, house2Rent = 2000, house3Rent = 5500, house4Rent = 7500, hotelRent = 9500, buildCost = 1000}
    lands[18] = Land{18, "Community Chest", isSpecial = true}
    lands[19] = Land{19, "Land of Dream", price = 1800, color = "orange", landRent = 140, house1Rent = 700, house2Rent = 2000, house3Rent = 5500, house4Rent = 7500, hotelRent = 9500, buildCost = 1000}
    lands[20] = Land{20, "Garden of Roses", price = 2000, color = "orange", landRent = 160, house1Rent = 80, house2Rent = 2200, house3Rent = 6000, house4Rent = 8000, hotelRent = 10000, buildCost = 1000}
    lands[21] = Land{21, "Free Parking", isSpecial = true}
    lands[22] = Land{22, "Ol` Souris", price = 2200, color = "red", landRent = 180, house1Rent = 900, house2Rent = 2500, house3Rent = 7000, house4Rent = 8750, hotelRent = 10000, buildCost = 1500}
    lands[23] = Land{23, "Chance", isSpecial = true}
    lands[24] = Land{24, "Cheze Gustave", price = 2200, color = "red", landRent = 180, house1Rent = 900, house2Rent = 2500, house3Rent = 7000, house4Rent = 8750, hotelRent = 10000, buildCost = 1500}
    lands[25] = Land{25, "Konomouse", price = 2400, color = "red", landRent = 200, house1Rent = 1000, house2Rent = 3000, house3Rent = 7500, house4Rent = 9250, hotelRent = 11000, buildCost = 1500}
    lands[26] = Land{26, "Elisah`s Teleporter", price = 2000, color = "teleporter", landRent = 250, house1Rent = 500, house2Rent = 1000, house3Rent = 2000}
    lands[27] = Land{27, "Kürbisses-Nacht Streets", price = 2600, color = "yellow", landRent = 220, house1Rent = 1100, house2Rent = 3300, house3Rent = 8000, house4Rent = 9750, hotelRent = 11500, buildCost = 1500}
    lands[28] = Land{28, "Kürbisses-Nacht Attic", price = 2600, color = "yellow", landRent = 220, house1Rent = 1100, house2Rent = 3300, house3Rent = 8000, house4Rent = 9750, hotelRent = 11500, buildCost = 1500}
    lands[29] = Land{29, "Fraises Factory", price = 1500, color = "factory", landRent = 4, house1Rent = 10, isSpecial = true}
    lands[30] = Land{30, "Kürbisses-Nacht Graveyard", price = 2800, color = "yellow", landRent = 240, house1Rent = 1200, house2Rent = 3600, house3Rent = 8500, house4Rent = 10250, hotelRent = 12000, buildCost = 1500}
    lands[31] = Land{31, "Go to Jail", isSpecial = true}
    lands[32] = Land{32, "Amazonia", price = 3000, color = "green", landRent = 260, house1Rent = 1300, house2Rent = 3900, house3Rent = 9000, house4Rent = 11000, hotelRent = 12750, buildCost = 2000}
    lands[33] = Land{33, "Antic Jungle", price = 3000, color = "green", landRent = 260, house1Rent = 1300, house2Rent = 3900, house3Rent = 9000, house4Rent = 11000, hotelRent = 12750, buildCost = 2000}
    lands[34] = Land{34, "Community Chest", isSpecial = true}
    lands[35] = Land{35, "Crystal Jungle", price = 3000, color = "green", landRent = 280, house1Rent = 1500, house2Rent = 4500, house3Rent = 10000, house4Rent = 12000, hotelRent = 14000, buildCost = 2000}
    lands[36] = Land{36, "Portal Teleporter", price = 2000, color = "teleporter", landRent = 250, house1Rent = 500, house2Rent = 1000, house3Rent = 2000}
    lands[37] = Land{37, "Chance", isSpecial = true}
    lands[38] = Land{38, "Haunted Library", price = 3500, color = "dark blue", landRent = 350, house1Rent = 1750, house2Rent = 5000, house3Rent = 11000, house4Rent = 13000, hotelRent = 15000, buildCost = 2000}
    lands[39] = Land{39, "Super Tax", isSpecial = true}
    lands[40] = Land{40, "Temple", price = 4000, color = "dark blue", landRent = 500, house1Rent = 2000, house2Rent = 6000, house3Rent = 14000, house4Rent = 17000, hotelRent = 20000, buildCost = 2000}
    
    --overriding the behaviours of special lands
    lands[3].onLand = function(self, player)
        --community chest
        communityChests[1]:action(player)
    end

    lands[8].onLand = function(self, player)
        chances[1]:action(player)
    end

    lands[18].onLand = function(self, player)
        communityChests[1]:action(player)
    end

    displayLands()
    
end

function displayLands(target)
    for id, land in next, lands do
        ui.addTextArea(1000 + id, "<a href='event:land:" .. id .. "'><b>" .. land.name .. "</b></a>", target, land.locX - 20, land.locY - 10, 60, 30, nil, nil, 0, true)
    end
end

function getNext(current)
    return next(players, current) or next(players)
end

function changeTurn()
    local curr = current
    local next = getNext(curr)
    print(next)
    ui.updateTextArea(12, "<N2>Roll!</N2>", curr)
    ui.updateTextArea(12, "<a href='event:roll'>Roll!</a>", next)
    current = next
end

function setUI(target)
    -- dice 1
    ui.addTextArea(10, "-", target, 700, 50, 50, 50, nil, nil, 1, true)
    -- dice 2
    ui.addTextArea(11, "-", target, 780, 50, 50, 50, nil, nil, 1, true)
    -- roll button
    ui.addTextArea(12, "<N2>Roll!</N2>", target, 720, 120, 200, 30, nil, nil, 1, true)
end

function showLandInfo(id, target)
    local land = lands[id]
    local res = land.name ..
        "\nPrice: " .. (land.price or "0")..
        "\nOwner:" .. (land.owner or "NA")
    
    ui.addTextArea(10000, res, target, 100, 100, 100, 100, nil, nil, 1, true)
end

function main()
    tfm.exec.newGame(lobby)
end
