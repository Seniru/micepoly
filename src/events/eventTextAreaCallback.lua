function eventTextAreaCallback(id, name, evt)
    --dice rolling event
    if evt == "roll" and name == currentPlayer then
        local die1 = math.random(1, 6)
        local die2 = math.random(1, 6)
        local total = die1 + die2
        ui.updateTextArea(10, die1)
        ui.updateTextArea(11, die2)
        players[name].current = players[name].current + total
        if players[name].current > 40 then
            players[name].current = players[name].current - 40
            players[name]:addMoney(2000)
        end
        players[name]:goTo(players[name].current)
        print(tostring(players[name]))
    elseif evt == "close" then
        handleCloseBtn(id, name)
    elseif evt == "increaseBid" then
        auctions.bidders[name] = auctions.bidders[name] + 1
        ui.updateTextArea(13000, "Auctioning " .. lands[auctions.landId].name .."!\nPlace your bid\n" .. auctions.bidders[name] .. " <a href='event:increaseBid'>[ + ]</a>\n<a href='event:bid'>[ Bid ]</a> <a href='event:fold'>[ Fold ]</a>", name)
    elseif evt == "bid" then
        auctionLand(auctions.landId, auctions.bidders[name], name)
    elseif evt == "fold" then
        auctions.bidders[name] = nil
        auctions.totalBidders = auctions.totalBidders - 1
        if auctions.totalBidders == 1 then
            lands[auctions.landId]:setOwner(auctions.highestBidder, auctions.highest)
            auctions = nil
        end
        ui.removeTextArea(id)
        --complex events
    elseif evt:find("^%w+:%w+$") then
        local key, value = table.unpack(split(evt, ":"))
        --land info display event
        if key == "land" then
            showLandInfo(tonumber(value), name)
        --buy land evet
        elseif key == "buy" then
            lands[tonumber(value)]:setOwner(name)
            ui.removeTextArea(11000, name)
            ui.removeTextArea(11001, name)
            ui.removeTextArea(11002, name)
            changeTurn()
        elseif key == "addHouse" then
            local land = lands[tonumber(value)]
            if land.houses < 4 then
                land:addHouse()
            end
            showLandInfo(land.landIndex, name)
        elseif key == "addHotel" then
            local land = lands[tonumber(value)]
            land:addHotel()
            showLandInfo(land.landIndex, name)
        elseif key == "auction" then
            handleCloseBtn(id, name)
            auctionLand(tonumber(value), 0, name, true)
        elseif key == "breakHouse" then
            local land = lands[tonumber(value)]
            land:removeBuildings()
            players[land.owner]:addMoney(land.buildCost / 2)
            showLandInfo(land.landIndex, name)
        end
    end
end
