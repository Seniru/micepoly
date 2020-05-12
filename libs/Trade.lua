--[[ Trade class ]]--
local Trade = {}
Trade.__index = Trade
Trade.__tostring = function(self)
    return table.tostring(self)
end

Trade.trades = {}

setmetatable(Trade, {
    __call = function (cls, name)
        return cls.new(name)
    end,
})

function Trade.new(id, party1, party2)
    local self = setmetatable({}, Trade)
    self.party1 = {
        name = party1, lands = {}, teleporters = {}, utilities = {}, hasJailFreeCommu = false, hasJailFreeChance = false, money = 0
    }
    self.party2 = {
        name = party1, lands = {}, teleporters = {}, utilities = {}, hasJailFreeCommu = false, hasJailFreeChance = false, money = 0
    }
    Trade.trades[id] = self
    return self
end

--[[function Trade:addLand(party, landId)
    local party = self.party1.name == party and self.party1 or self.party2
    party.lands[#party.lands + 1] = landId
end]]
