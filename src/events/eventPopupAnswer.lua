function eventPopupAnswer(id, name, answer)
    if id >= 100000 then -- trade agreements/handshakes
        print("trade handshake")
        local tradeId = id - 100000
        local party1 = Trade.handshakes[tradeId]
        local party2 = name
        startTrade(party1, party2)
    end
end