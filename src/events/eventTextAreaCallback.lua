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
        elseif key == "addHotel" then
            local land = lands[tonumber(value)]
            land:addHotel()
        end
    end
end
