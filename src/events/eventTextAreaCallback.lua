function eventTextAreaCallback(id, name, evt)
    if evt == "roll" and name == current then
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
        changeTurn()
        print(tostring(players[name]))
    end
end
