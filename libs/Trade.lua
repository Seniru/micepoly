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
    local self = setmetatable({}, Trade)
    self.id = id
    self.party1 = {
        name = party1, lands = {}, teleporters = {}, utilities = {}, hasJailFreeCommu = false, hasJailFreeChance = false, money = 0
    }
    self.party2 = {
        name = party2, lands = {}, teleporters = {}, utilities = {}, hasJailFreeCommu = false, hasJailFreeChance = false, money = 0
    }
    players[party1].tradeID = id
    players[party2].tradeID = id
    Trade.trades[id] = self
    return self
end


function Trade:addLand(player, landId, add)
    add = add == nil and true or add
    local party = player == self.party1.name and 1 or 2
    self["party" .. party].lands[landId] = add and true or nil
    print(table.tostring(self))
end

function Trade:cancel(cancelledBy)
    tfm.exec.chatMessage("You cancelled the trade!", cancelledBy)
    tfm.exec.chatMessage("The trade has been cancelled by " .. cancelledBy, self.party1.name == cancelledBy and self.party2.name or self.party1.name)
    handleCloseBtn(200, self.party1.name)
    handleCloseBtn(200, self.party2.name)
    players[self.party1.name].tradeID = nil
    players[self.party2.name].tradeID = nil
    Trade.trades[self.id] = nil
    self = nil
end
