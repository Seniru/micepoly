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

    for _, player in next, ({self.party1.name, self.party2.name}) do
        ui.updateTextArea(200, player == p1Name and p1Txt or p2Txt, player)
        ui.updateTextArea(201, player == p1Name and p2Txt or p1Txt, player)
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

function Trade:cancel(cancelledBy)
    print("[trade] cancel")
    tfm.exec.chatMessage("You cancelled the trade!", cancelledBy)
    tfm.exec.chatMessage("The trade has been cancelled by " .. cancelledBy, self.party1.name == cancelledBy and self.party2.name or self.party1.name)
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
        tfm.exec.chatMessage("both submitted, but it was a troll!")
    end
end
