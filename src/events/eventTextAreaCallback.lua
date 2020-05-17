function eventTextAreaCallback(id, name, evt)
    if evt == "roll" and name == currentPlayer then
        handleDice(name, math.random(1,6), math.random(1, 6))
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
    elseif evt == "incomeTaxFull" then
        players[name]:addMoney(-2000)
        handleCloseBtn(14000, name)
    elseif evt == "incomeTax10%" then
        local player = players[name]
        local tax = player:getTotalWorth() * 0.1
        player:addMoney(-tax)
        tfm.exec.chatMessage("Paid tax of worth " .. tax, name)
        handleCloseBtn(14000, name)
        --complex events
    elseif evt == "pay-prison" then
        players[name]:jailFree(evt)
    elseif evt == "jail-free-chance" then
        players[name]:jailFree(evt)
    elseif evt == "jail-free-comm" then
        players[name]:jailFree(evt)
    elseif evt:find("^.+:.+$") then
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
        elseif key == "mortgage" then
            local land = lands[tonumber(value)]
            land:mortgage(true)
            showLandInfo(land.landIndex, name)
        elseif key == "unmortgage" then
            local land = lands[tonumber(value)]
            land:mortgage(false)
            showLandInfo(land.landIndex, name)
        elseif key == "trade-cancel" then
            Trade.trades[value]:cancel(name)
        end
    end
end
