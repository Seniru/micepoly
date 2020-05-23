--[[ Trade class ]]--
local Trade = {}
Trade.__index = Trade
Trade.__tostring = function(self)
    return table.tostring(self)
end

Trade.trades = {}
Trade.handshakes = {}

setmetatable(Trade, {
    __call = function (cls, name)
        return cls.new(name)
    end,
})

function Trade.new(id, party1, party2)
    print("new trade")
    local self = setmetatable({}, Trade)
    self.id = id

    self.party1 = {
        name = party1, lands = {}, teleporters = {}, utilities = {}, hasJailFreeCommu = false, hasJailFreeChance = false, money = 0, submitted = false
    }
    self.party2 = {
        name = party2, lands = {}, teleporters = {}, utilities = {}, hasJailFreeCommu = false, hasJailFreeChance = false, money = 0, submitted = false
    }

    players[party1].tradeID = id
    players[party2].tradeID = id
    Trade.trades[id] = self
    return self
end

function Trade:updateInterface()
    print("[trade] updte interface")
    local p1Name, p2Name = self.party1.name, self.party2.name
    local player1, player2 = players[p1Name], players[p2Name]
    local p1Txt, p2Txt = "[" .. p1Name .. "]\n", "[" .. p2Name .. "]\n"
    local col = lands[2].color
    for id, land in next, lands do
        if not land.isSpecial then
            if land.color ~= col then
                col = land.color
                p1Txt = p1Txt .. "\n" ..col
                p2Txt = p2Txt .. "\n" .. col
            end
            -- todo: create another string to displayed to the other party so that they can't add lands to the trade 
            local p1Owns = not not (player1.ownedLands[col] and player1.ownedLands[col][id])
            local p2Owns = not not (player2.ownedLands[col] and player2.ownedLands[col][id])
            local p1Added = p1Owns and self.party1.lands[id]
            local p2Added = p2Owns and self.party2.lands[id]
            if p1Added then print(id) end
            p1Txt = p1Txt .. (p1Owns and "<VP><a href='event:trade-addLand:" .. id .. "'>" or "<N2>") .. (p1Added and "<b><T>" or "") .. land.name .. (p1Added and "</T></b>" or "") .. (p1Owns and "</a></VP>" or "</N2>") .. ", "
            p2Txt = p2Txt .. (p2Owns and "<VP><a href='event:trade-addLand:" .. id .. "'>" or "<N2>") .. (p2Added and "<b><T>" or "") .. land.name .. (p2Added and "</T></b>" or "") .. (p2Owns and "</a></VP>" or "</N2>") .. ", "
        end
    end

    --[[local p1CardTxt = p1Name .. 
        (player1.hasJailFreeChance and "<a href='event:trade-addJailFreeChance:" .. id .."'>" or "<N2>") .. 
        "Get out of jail free (chance)" ..
        (player1.hasJailFreeChance and "</a>" or "</N2>") .. " | " .. 
        (player1.hasJailFreeCommu and "<a href='event:trade-addJailFreeCommu:" .. id .."'>" or "<N2>") .. 
        "Get out of jail free (commu)" ..
        (player1.hasJailFreeChance and "</a>" or "</N2>")

    local p2CardTxt = p2Name .. 
        (player2.hasJailFreeChance and "<a href='event:trade-addJailFreeChance:" .. id .."'>" or "<N2>") .. 
        "Get out of jail free (chance)" ..
        (player2.hasJailFreeChance and "</a>" or "</N2>") .. " | " .. 
        (player2.hasJailFreeCommu and "<a href='event:trade-addJailFreeCommu:" .. id .."'>" or "<N2>") .. 
        "Get out of jail free (commu)" ..
        (player2.hasJailFreeChance and "</a>" or "</N2>")]]

    for _, player in next, ({self.party1.name, self.party2.name}) do
        ui.updateTextArea(200, player == p1Name and p1Txt or p2Txt, player)
        ui.updateTextArea(201, player == p1Name and p2Txt or p1Txt, player)
        --[[if players[player].hasJailFreeCards.chance then
            ui.addTextArea(206, "<a href='event:trade-addJailFreeChance" .. self.id .. "'> [ + ] </a>", p1Name, player == p1Name and 100 or 500, 300, 50, 50, nil, nil, 0.5, true)
        end]]
    end
end

function Trade:addLand(player, landId, add)
    print("[trade] add land")
    add = add == nil and true or add
    local party = player == self.party1.name and 1 or 2
    self["party" .. party].lands[landId] = add and true or nil
    print(table.tostring(self))
    self.party1.submitted = false
    self.party2.submitted = false
    self:updateInterface()
end

function Trade:addMoney(player, amount)
    local playerObj = players[player]
    if not amount then
        tfm.exec.chatMessage("<R>Please specify a valid number!", player)
    elseif amount > playerObj.money then
        tfm.exec.chatMessage("<R>Not enough money for that action!", player)
    else
        local party = player == self.party1.name and 1 or 2
        self["party" .. party].money = amount
        ui.updateTextArea(204, "<a href='event:trade-addMoney:" .. self.id .. "'>Money: $" .. amount .. "</a>", player)
        ui.updateTextArea(205, "<a href='event:trade-addMoney:" .. self.id .. "'>Money: $" .. amount .. "</a>", player == self.party1.name and self.party2.name or self.party1.name)
    end
end

function Trade:close(closedBy)
    print("[trade] close")
    if closedBy then
        tfm.exec.chatMessage("You cancelled the trade!", closedBy)
        tfm.exec.chatMessage("The trade has been cancelled by " .. closedBy, self.party1.name == closeBy and self.party2.name or self.party1.name)
    end
    handleCloseBtn(200, self.party1.name)
    handleCloseBtn(200, self.party2.name)
    players[self.party1.name].tradeID = nil
    players[self.party2.name].tradeID = nil
    Trade.trades[self.id] = nil
    self = nil
end

function Trade:submit(submittedBy)
    print("[trade] submit")
    local party = submittedBy == self.party1.name and 1 or 2
    self["party" .. party].submitted = true
    if self.party1.submitted and self.party2.submitted then
        -- both parties submitted, start the transaction
        for party, partyData in next, ({self.party1, self.party2}) do
            local partyName = partyData.name
            local otherName = partyName == self.party1.name and self.party2.name or self.party1.name
            -- exchanging lands
            for landID, _ in next, partyData.lands do
                lands[landID]:removeOwner()
                lands[landID]:setOwner(otherName, 0)
            end
            -- exchanging money
            players[partyName]:addMoney(-(partyData.money))
            players[otherName]:addMoney(partyData.money)
        end
        self:close()
    end
end
