--[[ CommunityChest class ]]--
local CommunityChest = Card:new()
CommunityChest.__index = Card
CommunityChest.__tostring = function(self)
    return "[name=" .. self.name .. ", money: " .. self.money .. "]"
end

setmetatable(CommunityChest, {
    __call = function (cls, name)
        return cls.new(name)
    end,
})

function CommunityChest:new(id, header, desc, action)
    --class CommunityChest extends Card
    local self = setmetatable(Card:new(id, header, desc), self)
    function self:action(player, ...)
        return action(player, ...)
    end
    return self
end
