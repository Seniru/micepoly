--[[ Chance class ]]--
local Chance = Card:new()
Chance.__index = Card
Chance.__tostring = function(self)
    return "[name=" .. self.name .. ", money: " .. self.money .. "]"
end

setmetatable(Chance, {
    __call = function (cls, name)
        return cls.new(name)
    end,
})

function Chance:new(id, header, desc, action)
    --class Chance extends Card
    local self = setmetatable(Card:new(id, header, desc), self)
    function self:action(player, ...)
        return action(player, ...)
    end
    return self
end
