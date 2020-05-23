function eventPopupAnswer(id, name, answer)
    if id >= 300 and id <= 350 then -- unmortgage popup on trade
        local landID = id - 300
            local land = lands[landID]
            print(land.name)
        if answer == "yes" then
            land:mortgage(false)
        else
            players[name]:addMoney(-(land.price / 2 * 0.1))
        end
    elseif id == 400 then -- cash transaction popup
        print("cash transaction")
        Trade.trades[players[name].tradeID]:addMoney(name, tonumber(answer))
    elseif id >= 100000 then -- trade agreements/handshakes
        print("trade handshake")
        local tradeId = id - 100000
        local party1 = Trade.handshakes[tradeId]
        local party2 = name
        startTrade(party1, party2)
    end
end