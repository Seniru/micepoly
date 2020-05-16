--disabling unwanted room settings
tfm.exec.disableAutoNewGame()
tfm.exec.disableAutoTimeLeft()
tfm.exec.disableAfkDeath()
tfm.exec.disableAutoShaman()
tfm.exec.disableMortCommand()

tfm.exec.setRoomMaxPlayers(15)

function initCards()

    chances = {
        Chance:new(1, "Speeding fine!", "Pay $150", function(player) 
            player:addMoney(-150)
        end),
        Chance:new(2, "Go back 3 spaces", "", function(player, land)
            player:goTo((land.landIndex - 3) < 1 and 40 - land.landIndex - 3 or land.landIndex - 3)
        end),
        Chance:new(3, "Chance", "Bank pays you dividend of $500", function(player)
            player:addMoney(500)
        end),
        Chance:new(4, "Drunk in Charge", "Fine $200", function(player)
            player:addMoney(-200)
        end),
        Chance:new(5, "Collect $1000", "You have won a fanart competition", function(player)
            player:addMoney(1000)
        end),
        Chance:new(6, "Receive $1500", "Your building loan has matured", function(player)
            player:addMoney(1500)
        end),
        Chance:new(7, "You were assessed for street repairs", "\t$400 per house\n\t$1150 per hotel", function(player)
            --todo: implementing this after supporting houses
            player:addMoney(0)
        end),
        Chance:new(8, "Take a trip to Elisah`s teleporter station", "Collect $2000 if you pass `GO`!", function(player, land)
            -- check if a player has to pass GO to move to Elisa's teleporter
            if land.landIndex > 26 then
                player:addMoney(2000)
            end
            player:goTo(26) -- going to elisah's teleporter station
        end),
        Chance:new(9, "Pay school fees", "Pay school fees of $1500", function(player)
            player:addMoney(-1500)
        end),
        Chance:new(10, "Visit to King Fromagnus`s Castle", "Collect $2000 if you pass `GO`!", function(player, land)
            -- check if a player has to pass Go to move to the castle
            if land.landIndex > 17 then
                player:addMoney(2000)
            end
            player:goTo(17) -- going to king fromagnus's castle
        end),
        Chance:new(11, "Make general repairs on all of your houses", "\t$250 for each houses\n\t$1000 for each hotel", function(player)
            --todo: implement this after supporting houses
            print("Not implemented")
        end),
        Chance:new(12, "Go to Jail!", "Move directly to jail. Do not pass GO. Do not collect $2000", function(player)
            player:goToJail()
        end),
        Chance:new(13, "Advance to Buffy`s Residence", "", function(player)
            player:goTo(2) -- Going to buffy's residence
        end),
        Chance:new(14, "Advance to Chez Gustave!", "", function(player)
            player:goTo(24) -- Going to cheze gustave
        end),
        Chance:new(15, "Troll!", "", function(player)
            tfm.exec.chatMessage("Troll :P", player.name)
        end),
        Chance:new(16, "Hunger!", "Pay $50 to eat and prevent you from dying!", function(player)
            player:addMoney(-50)
        end),
        Chance:new(17, "$50 Reward!", "Like our post in forum!", function(player)
            --todo: add the forum link
            tfm.exec.chatMessage("Like our post in forum\nLink: https://123456.com", player.name)
            player:addMoney(50)
        end),
        Chance:new(18, "AFK Death", "Pay $20 to revive!", function(player)
            player:addMoney(-20)
        end),
        Chance:new(19, "It`s Money!", "Every player get $500", function()
            for name, player in next, players do
                player:addMoney(500)
            end
            tfm.exec.chatMessage("You got $500 as a gift!")
        end),
        Chance:new(20, "It`s your birthday!", "Collect $200 from each player", function(player)
            tfm.exec.chatMessage("It's " .. player.name .. "'s Birthday! Give him a present of $200")
            for _, p in next, players do
                p:addMoney(-200)
                player:addMoney(200)
            end
        end),
        Chance:new(22, "Pay $2000", "Pay $2000 for your utility bills", function(player)
            player:addMoney(-2000)
        end),
        Chance:new(23, "You won a lottery!", "Collect $2500", function(player)
            player:addMoney(2500)
        end),
        Chance:new(24, "Get out of Jail free", "This card may be kept until needed or sold.", function(player, land)
            table.remove(chances, jailFreeChanceId)
            currentChance = (jailFreeChanceId + 1 > #chances) and 1 or jailFreeChanceId + 1
            player.hasJailFreeCards["chance"] = true
        end)
        --todo: Add the get out of the jail card after implementing the jail and related featuress
    }

    communityChests = {
        CommunityChest:new(1, "Receive $250", "Receive interest on 7% preference shares of $250", function(player) 
            player:addMoney(250)
        end),
        CommunityChest:new(2, "Collect $1000", "You have won 2nd price in a fashion squad competition", function(player)
            player:addMoney(250)
        end),
        CommunityChest:new(3, "Pay $1000", "Pay your insurance premium of $1000", function(player)
            player:addMoney(-1000)
        end),
        CommunityChest:new(4, "Collect $200", "Income tax refund", function(player)
            player:addMoney(-200)
        end),
        CommunityChest:new(5, "Collect $2000", "Bank error in your favour", function(player)
            player:addMoney(2000)
        end),
        CommunityChest:new(6, "Pay $1000", "Pay $1000 to the hospital", function(player)
            player:addMoney(-1000)
        end),
        CommunityChest:new(7, "Go to Jail!", "Move directly to jail. Do not pass GO. Do not collect $2000", function(player)
            player:goToJail()
        end),
        CommunityChest:new(8, "It`s your birthday!", "Collect $100 from each player", function(player)
            tfm.exec.chatMessage("It's " .. player.name .. "'s Birthday! Give him a present of $200")
            for _, p in next, players do
                p:addMoney(-200)
                player:addMoney(200)
            end
        end),
        CommunityChest:new(9, "Trick or Treat?", "Pay a fine of $100 or take a chance", function(player)
            --todo: implement this correctly
            tfm.exec.chatMessage("Not implemented correclty! No effect because of that", player.name)
        end),
        CommunityChest:new(10, "You inherit $1000", "", function(player)
            player:addMoney(1000)
        end),
        CommunityChest:new(11, "Pay $500", "Doctor`s fee", function(player)
            player:addMoney(-500)
        end),
        CommunityChest:new(12, "Receive $500", "From Sale of stock you got $500", function(player)
            player:addMoney(500)
        end),
        CommunityChest:new(13, "Go back to Transformice Museum", "", function(player)
            player:goTo(4) -- Going to Transformice Museum
        end),
        CommunityChest:new(14, "Annuity matures", "Collect $1000", function(player)
            player:addMoney(1000)
        end),
        CommunityChest:new(15, "Receive $500", "<i>Powered by Shaman</i>", function(player)
            player:addMoney(500)
        end),
        CommunityChest:new(16, "Error occured in game!", "You received $1500", function(player)
            player:addMoney(1500)
            tfm.exec.chatMessage("Don't forget to report actual bugs to the developer.\n<LINK HERE>", player.name)
        end),
        CommunityChest:new(17, "Trollol!", "", function(player)
            tfm.exec.chatMessage("Trollol!!!", player.name)
        end),
        CommunityChest:new(18, "Pay $500", "Pay bank loan interest of $500", function(player)
            player:addMoney(-500)
        end),
        CommunityChest:new(19, "Cheef's food!", "You got $250 for free", function(player)
            player:addMoney(-250)
        end),
        CommunityChest:new(20, "Receive $1000", "Part time job salary", function(player)
            player:addMoney(1000)
        end),
        CommunityChest:new(21, "Pay 500", "General repairs in your house", function(player)
            player:addMoney(-500)
        end),
        CommunityChest:new(22, "Cheese farming event!", "You farmed $250 in 1 hour", function(player)
            player:addMoney(250)
        end),
        CommunityChest:new(23, "Go back 5 spaces", "", function(player, land)
            player:goTo((land.landIndex - 5) < 1 and 40 - land.landIndex - 5 or land.landIndex - 5)
        end),
        CommunityChest:new(24, "Let`s gamble!", "Place your bet", function(player)
            --todo: implement this
            tfm.exec.chatMessage("Not implemented!", player.name)
        end),
        CommunityChest:new(25, "Get out of Jail free", "This card may be kept until needed or sold.", function(player)
            table.remove(communityChests, jailFreeCommId)
            currentChance = (jailFreeCommId + 1 > #communityChests) and 1 or jailFreeCommId + 1
            player.hasJailFreeCards["community chest"] = true
        end)
        --todo: Add the get out of the jail card after implementing the jail and related featuress
    }

    --shuffling the cards
    shuffle(chances)
    shuffle(communityChests)
    
    --getting the indexes of jail free cards
    do

        for id, chance in next, chances do
            if chance.header == "Get out of Jail free" then
                jailFreeChanceId = id
            end
        end

        for id, commChest in next,  communityChests do
            if commChest.header == "Get out of Jail free" then
                jailFreeCommId = id
            end
        end

    end

end

function initLands()

    --[[ configuring the lands
        format: name, price, group (color), landIndex, landRent, house1Rent, house2Rent,
        house3Rent, house4Rent, hotelRent, buildCost
    ]]
    --Land {"name", 0, "red", landRent = 1, houseRents = {10, 10, 100, 1000, hotelRent = 1000, buildCost = 10000, isSpecial = true}
    lands[1] = Land{1, "Go", isSpecial = true}
    lands[2] = Land{2, "Buffy`s Residence", price = 600, color = "purple", landRent = 20, houseRents = {100, 300, 900, 1600}, hotelRent = 2500, buildCost = 500}
    lands[3] = Land{3, "Community Chest", isSpecial = true}
    lands[4] = Land{4, "Transformice Museum", price = 600, color = "purple", landRent = 40, houseRents = {200, 600, 1800, 3200}, hotelRent = 4500, buildCost = 500}
    lands[5] = Land{5, "Income Tax", isSpecial = true}
    lands[6] = Land{6, "Shaman`s Teleporter", price = 2000, color = "teleporter", landRent = 250, houseRents = {500, 1000, 2000}}
    lands[7] = Land{7, "801 Town", price = 1000, color = "light blue", landRent =  60, houseRents = {300, 900, 2700, 4000}, hotelRent = 5500, buildCost = 500}
    lands[8] = Land{8, "Chance", isSpecial = true}
    lands[9] = Land{9, "Grim`s Mansion", price = 1000, color = "light blue", landRent = 60, houseRents = {300, 900, 2700, 4000}, hotelRent = 5500, buildCost = 500}
    lands[10] = Land{10, "Nuremberg", price = 1200, color = "light blue", landRent = 80, houseRents = {400, 1000, 3000, 4500}, hotelRent = 6000, buildCost = 500}
    lands[11] = Land{11, "Jail", isSpecial = true}
    lands[12] = Land{12, "Jingle`s abode", price = 1400, color = "magenta", landRent = 100, houseRents = {500, 1500, 4500, 6250}, hotelRent = 7500, buildCost = 1000}
    lands[13] = Land{13, "Cheese factory", price = 1500, color = "factory", landRent = 4, houseRents = {10}, isSpecial = true}
    lands[14] = Land{14, "Salvador", price = 1400, color =  "magenta", landRent = 100, houseRents = { 500,  1500, 4500,  6250}, hotelRent = 7500, buildCost = 1000}
    lands[15] = Land{15, "Charlotte`s Tree Stump", price = 1600, color = "magenta", landRent = 120, houseRents = {600, 1800, 5000, 7000}, hotelRent = 9000, buildCost = 1000}
    lands[16] = Land{16, "Cheese Hole Teleporter", price = 2000, color = "teleporter", landRent = 250, houseRents = {500, 1000, 2000}}
    lands[17] = Land{17, "King Fromagnus`s Castle", price = 1800, color = "orange", landRent = 140, houseRents = {700, 2000, 5500, 7500}, hotelRent = 9500, buildCost = 1000}
    lands[18] = Land{18, "Community Chest", isSpecial = true}
    lands[19] = Land{19, "Land of Dream", price = 1800, color = "orange", landRent = 140, houseRents = {700, 2000, 5500, 7500}, hotelRent = 9500, buildCost = 1000}
    lands[20] = Land{20, "Garden of Roses", price = 2000, color = "orange", landRent = 160, houseRents = {80, 2200, 6000, 8000}, hotelRent = 10000, buildCost = 1000}
    lands[21] = Land{21, "Free Parking", isSpecial = true}
    lands[22] = Land{22, "Ol` Souris", price = 2200, color = "red", landRent = 180, houseRents = {900, 2500, 7000, 8750}, hotelRent = 10000, buildCost = 1500}
    lands[23] = Land{23, "Chance", isSpecial = true}
    lands[24] = Land{24, "Cheze Gustave", price = 2200, color = "red", landRent = 180, houseRents = {900, 2500, 7000, 8750}, hotelRent = 10000, buildCost = 1500}
    lands[25] = Land{25, "Konomouse", price = 2400, color = "red", landRent = 200, houseRents = {1000, 3000, 7500, 9250}, hotelRent = 11000, buildCost = 1500}
    lands[26] = Land{26, "Elisah`s Teleporter", price = 2000, color = "teleporter", landRent = 250, houseRents = {500, 1000, 2000}}
    lands[27] = Land{27, "Kürbisses-Nacht Streets", price = 2600, color = "yellow", landRent = 220, houseRents = {1100, 3300, 8000, 9750}, hotelRent = 11500, buildCost = 1500}
    lands[28] = Land{28, "Kürbisses-Nacht Attic", price = 2600, color = "yellow", landRent = 220, houseRents = {1100, 3300, 8000, 9750}, hotelRent = 11500, buildCost = 1500}
    lands[29] = Land{29, "Fraises Factory", price = 1500, color = "factory", landRent = 4, houseRents = {10}, isSpecial = true}
    lands[30] = Land{30, "Kürbisses-Nacht Graveyard", price = 2800, color = "yellow", landRent = 240, houseRents = {1200, 3600, 8500, 10250}, hotelRent = 12000, buildCost = 1500}
    lands[31] = Land{31, "Go to Jail", isSpecial = true}
    lands[32] = Land{32, "Amazonia", price = 3000, color = "green", landRent = 260, houseRents = {1300, 3900, 9000, 11000}, hotelRent = 12750, buildCost = 2000}
    lands[33] = Land{33, "Antic Jungle", price = 3000, color = "green", landRent = 260, houseRents = {1300, 3900, 9000, 11000}, hotelRent = 12750, buildCost = 2000}
    lands[34] = Land{34, "Community Chest", isSpecial = true}
    lands[35] = Land{35, "Crystal Jungle", price = 3000, color = "green", landRent = 280, houseRents = {1500, 4500, 10000, 12000}, hotelRent = 14000, buildCost = 2000}
    lands[36] = Land{36, "Portal Teleporter", price = 2000, color = "teleporter", landRent = 250, houseRents = {500, 1000, 2000}}
    lands[37] = Land{37, "Chance", isSpecial = true}
    lands[38] = Land{38, "Haunted Library", price = 3500, color = "dark blue", landRent = 350, houseRents = {1750, 5000, 11000, 13000}, hotelRent = 15000, buildCost = 2000}
    lands[39] = Land{39, "Super Tax", isSpecial = true}
    lands[40] = Land{40, "Temple", price = 4000, color = "dark blue", landRent = 500, houseRents = {2000, 6000, 14000, 17000}, hotelRent = 20000, buildCost = 2000}
    
    local chanceFn = function(land, player)
        local curr = currentChance
        local success, nextC = pcall(getNext, chances, curr)
        if not success then
            nextC = 1
        end
        ui.addTextArea(12000, "Chance: " .. chances[nextC].header .. "<br>" .. chances[nextC].description, player.name, 200, 200, 200, 50, nil, nil, 1, true)
        chances[nextC]:action(player, land)
        currentChance = nextC
    end

    local commChestFn = function(land, player)
        local curr = currentCommunitychest
        local success, nextC = pcall(getNext, communityChests, curr)
        if not success then
            nextC = 1
        end
        ui.addTextArea(12000, "Community Chest: " .. communityChests[nextC].header .. "<br>" .. communityChests[nextC].description, player.name, 200, 200, 200, 50, nil, nil, 1, true)
        communityChests[nextC]:action(player, land)
        currentCommunitychest = nextC
    end
    
    --overriding the behaviours of special lands

    lands[3].onLand = function(self, player) --community chest
        commChestFn(self, player)
    end

    lands[8].onLand = function(self, player) --chance
        chanceFn(self, player)
    end

    lands[18].onLand = function(self, player) --community chest
        commChestFn(self, player)
    end

    lands[23].onLand = function(self, player) --chance
        chanceFn(self, player)
    end

    lands[34].onLand = function(self, player) --community chest
        commChestFn(self, player)
    end

    lands[37].onLand = function(self, player) --chance
        chanceFn(self, player)
    end

    lands[5].onLand = function(self, player) -- income tax
        ui.addTextArea(14000, "Income Tax<br>Pay 2000 or 10% of your total worth", player.name, 300, 200, 200, 100, nil, nil, 1, true)
        ui.addTextArea(14001, "<a href='event:incomeTaxFull'>Pay 2000</a>", player.name, 300, 320, 90, 30, nil, nil, 1, true)
        ui.addTextArea(14002, "<a href='event:incomeTax10%'>Pay 10%</a>", player.name, 410, 320, 90, 30, nil, nil, 1, true)
    end

    lands[39].onLand = function(self, player) -- super tax
        tfm.exec.chatMessage("Super Tax! Pay $1000", player.name)
        player:addMoney(-1000)
    end

    lands[31].onLand = function(self, player)
        player:goToJail()
    end

    displayLands()
    
end

function displayLands(target)
    for id, land in next, lands do
        ui.addTextArea(1000 + id, "<a href='event:land:" .. id .. "'><b>" .. land.name .. "</b></a>", target, land.locX - 20, land.locY - 10, 60, 30, nil, nil, 0, false)
    end
end

function changeTurn()
    local curr = currentPlayer
    local nextP = getNext(players, currentPlayer)
    ui.updateTextArea(12, "<N2>Roll!</N2>", curr)
    if not players[nextP].isInJail then
        ui.updateTextArea(12, "<a href='event:roll'>Roll!</a>", nextP)
    else
        ui.addTextArea(15000, "You are in Jail\nPay $500, Use jail card or roll doubles in your next three turns", nextP, 300, 100, 100, 100, nil, nil, 1, true)
        ui.addTextArea(15001, "<a href='event:pay-prison'>Pay $500</a>", nextP, 300, 200, 50, 30, nil, nil, 1, true)
        ui.addTextArea(15002, "<a href='event:roll'>Roll!</a>", nextP, 400, 200, 50, 30, nil, nil, 1, true)
        ui.addTextArea(15003, "<a href='event:jail-free-chance'>Use Jail Chance</a>", nextP, 500, 200, 50, 30, nil, nil, 1, true)
        ui.addTextArea(15004, "<a href='event:jail-free-comm'>Use Jail community</a>", nextP, 550, 200, 50, 30, nil, nil, 1, true)
    end
    currentPlayer = nextP
end

function setUI(target)
    -- dice 1
    ui.addTextArea(10, "-", target, 700, 50, 50, 50, nil, nil, 1, true)
    -- dice 2
    ui.addTextArea(11, "-", target, 780, 50, 50, 50, nil, nil, 1, true)
    -- roll button
    ui.addTextArea(12, "<N2>Roll!</N2>", target, 720, 120, 200, 30, nil, nil, 1, true)
    -- stats
    ui.addTextArea(13, "Money: $15000", target, 780, 200, 100, 50, nil, nil, 1, true)
end

function showLandInfo(id, target)
    local land = lands[id]
    local res = closeBtn .. land.name

    if land.isSpecial then
        --todo
    else    
        if land.color == "factory" then
            --todo
        elseif land.color == "teleporter" then
            --todo
        else
            res = res .. " <i>(" .. land.color .. ")</i>" ..
            "\nPrice: " .. (land.price or "0") ..
            "\nOwner:" .. (land.owner or "NA") ..
                "\nLand rent: " .. (land.landRent or "NA") ..
                "\nWith 1 house: " .. (land.houseRents[1] or "NA") ..
                "\nWith 2 houses: " .. (land.houseRents[2] or "NA") ..
                "\nWith 3 houses: " .. (land.houseRents[3] or "NA") ..
                "\nWith 4 houses: " .. (land.houseRents[4] or "NA") ..
                "\nHotel rent: " .. (land.hotelRent or "NA") ..
                "\n<i>Mortgaged: " .. tostring(land.isMortgaged)
            end
    end
    
    ui.addTextArea(10000, res, target, 280, 100, 300, 200, nil, nil, 1, true)
    --adding extra control buttons for land owners
    if land.owner == target then
        --todo: support the functionality of the buttons
        ui.addTextArea(10001, land:canBuild("house") and ("<a href='event:addHouse:" .. land.landIndex .. "'>Add houses</a>") or "<N2>Add houses</N2>", target, 280, 330, 60, 40, nil, nil, 1, true)
        ui.addTextArea(10002, land:canBuild("hotel") and ("<a href='event:addHotel:" .. land.landIndex .. "'>Add hotel</a>") or "<N2>Add hotel</N2>", target, 340, 330, 60, 40, nil, nil, 1, true)
        ui.addTextArea(10003, (not land.isMortgaged) and ("<a href='event:mortgage:" .. land.landIndex .. "'>Mortgage</a>") or ("<a href='event:unmortgage:" .. land.landIndex .."'>Unmortgage</a>"), target, 400, 330, 60, 40, nil, nil, 1, true)
        ui.addTextArea(10004, "Sell", target, 460, 330, 60, 40, nil, nil, 1, true)
        ui.addTextArea(10005, land:canBreak() and ("<a href='event:breakHouse:" .. land.landIndex .. "'>Sell houses</a>") or "<N2>Sell houses</N2>", target, 500, 330, 60, 40, nil, nil, 1, true)
    end
end

function auctionLand(landId, bid, bidder, newInstance)
    local land = lands[landId]
    if not auctions and newInstance then
        auctions = {
            landId = landId,
            highest = bid,
            highestBidder = bidder,
            bidders = {},
            totalBidders = totalPlayers,
            currentBidder = bidder
        }
        for name, _ in next, players do
            auctions.bidders[name] = 1
        end
    elseif auctions and not newInstance then
        ui.removeTextArea(13000)
        auctions.highest = bid
        auctions.highestBidder = bidder
        auctions.currentBidder = getNext(auctions.bidders, auctions.currentBidder)
        auctions.bidders[auctions.currentBidder] = auctions.highest + 1
    else
        tfm.exec.chatMessage("An auction is ongoing, try again later!", bidder)
    end
    ui.addTextArea(13000, "Auctioning " .. land.name .."!\nPlace your bid\n" .. auctions.highest + 1 .. " <a href='event:increaseBid'>[ + ]</a>\n<a href='event:bid'>[ Bid ]</a> <a href='event:fold'>[ Fold ]</a>", auctions.currentBidder, 100, 100, 100, 100, nil, nil, 1, true)
end

function startTrade(party1, party2)
    print(table.tostring(players[party1].ownedLands))
    print(table.tostring(players[party2].ownedLands))
    tfm.exec.chatMessage(party2 .. " accepted the trade invitation!", party1)
    local tradeId = party1 .. "," .. party2

    local trade = Trade.new(tradeId, party1, party2)

    for _, player in next, ({party1, party2}) do
        local landTxt = ""
        for cat, lands in next, players[player].ownedLands do
            landTxt = landTxt .. cat .. "\n\n"
            for id, name in next, lands do
                if id ~= "_lands" then
                    landTxt = landTxt .. name .. "(" .. id .. ")"
                end
            end
        end
        ui.addTextArea(200, "My lands [" .. player .. "]\n" .. landTxt, player, 100, 100, 300, 300, nil, nil, 1, true)
        ui.addTextArea(201, "<a href='event:trade-submit:" .. tradeId .. "'>Submit</a>", player, 450, 150, 100, 100, nil, nil, 1, true)
    end
end

function handleDice(name, die1, die2)
    --todo: refactor this function
    local total = die1 + die2
    ui.updateTextArea(10, die1)
    ui.updateTextArea(11, die2)

    if players[name].isInJail then
        if die1 == die2 then
            players[name].doubles = players[name].doubles + 1
            if players[name].doubles == 3 then
                players[name].doubles = 0
                players[name].isInJail = false
                players[name].current = 11 + die1 + die2
                players[name]:goTo(11 + die1 + die2)
                handleCloseBtn(15000, name)
            end
        else
            players[name].doubles = 0
            changeTurn()
            handleCloseBtn(15000, name)
        end
    else
        players[name].current = players[name].current + total
        --giving salary after passing one round
        if players[name].current > 40 then
            players[name].current = players[name].current - 40
            players[name]:addMoney(2000)
        end

        if die1 == die2 then
            players[name].doubles = players[name].doubles + 1
            if players[name].doubles == 3 then
                return players[name]:goToJail()
            end
            players[name]:goTo(players[name].current, true)
        else
            players[name].doubles = 0
            players[name]:goTo(players[name].current)
        end
    end
end

function handleCloseBtn(id, name)
    local closeSequence = {
        [10000] = {10000, 10001, 10002, 10003, 10004, 10005},
        [11002] = {11000, 11001, 11002},
        [14000] = {14000, 14001, 14002},
        [15000] = {15000, 15001, 15002, 15003, 15004}
    }
    if closeSequence[id] then
        for _, id in next, closeSequence[id] do
            ui.removeTextArea(id, name)
        end
    else
        ui.removeTextArea(id, name)
    end
end

function main()
    tfm.exec.newGame(lobby)
end

function eventChatCommand(name, cmd) -- test
    if cmd:sub(1, 1) == "g" then
        players[name]:goTo(tonumber(cmd:sub(2)))
    elseif cmd:sub(1, 1) == "r" then
        handleDice(name, tonumber(cmd:sub(2, 2)), tonumber(cmd:sub(3, 3)))
    elseif cmd == "t" then
        -- trade start
        local party1 = name
        local party2 = "Overforyou#9290"
        Trade.handshakes[#Trade.handshakes + 1] = party1
        ui.addPopup(100000 + #Trade.handshakes, 1, party1 .. " wants to trade with you no.\nAccept?", party2, nil, nil, nil, true)
    elseif cmd == "test" then
        print(table.tostring(players[name]))
    end
end