--[[ Player class ]]--
local Player = {}
Player.__index = Player
Player.__tostring = function(self)
    return "[name=" .. self.name .. "]"
end

setmetatable(Player, {
    __call = function (cls, name)
        return cls.new(name)
    end,
})

function Player.new(name)
    local self = setmetatable({}, Player)
    self.name = name
    self.money = 15000
    self.ownedLands = {}
    return self
end

function Player:goTo(land)
    print(points[2])
    --tfm.exec.movePlayer(self.name, points[land].x, points[land].y, false)
end
