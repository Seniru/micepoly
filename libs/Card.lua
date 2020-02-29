--[[ Card class ]]--
local Card = {id=0, header="", description=""}

Card.__index = Card
Card.__tostring = function(self)
    return self.description
end

setmetatable(Card, {
    __call = function (cls, name)
        return cls:new(name)
    end,
})


function Card:new(id, header, desc)
    local self = setmetatable({}, self)
    self.id = id or 0
    self.header = header or ""
    self.description = desc or ""
    return self
end

--[[
    @abstract method
]]
function Card:action(player, ...)
    error("Calling non-overidden abstract methods")
end
