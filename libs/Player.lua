--[[ Player class ]]--
local Player = {}
Player.__index = Player
Player.__tostring = function(self)
    return "[name=" .. self.name .. ", money: " .. self.money .. "]"
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
    self.current = 1
    return self
end

function Player:goTo(land)
    local landObj = lands[land]
    tfm.exec.movePlayer(self.name, points[land].x, points[land].y, false)
    if landObj.isSpecial then
        landObj:onLand(self)
        --todo: remove this line after implementing all special cases
        changeTurn()
    else
        if not landObj.owner then
            ui.addTextArea(11000, "Buy or bid? --bid not supported--", self.name, 300, 100, 100, 100, nil, nil, 1, true)
            ui.addTextArea(11001, "<a href='event:buy:" .. landObj.landIndex .. "'>Buy</a>", self.name, 300, 250, 50, 50, nil, nil, 1, true)
            --todo: Implement the bid functionality and change the link text
            ui.addTextArea(11002, "<a href='event:buy:" .. landObj.landIndex .. "'>Bid</a>", self.name, 360, 250, 50, 50, nil, nil, 1, true)
        else
            self:addMoney(-landObj.landRent)
            players[landObj.owner]:addMoney(landObj.landRent)
            changeTurn()
        end
    end
end

function Player:addMoney(amount)
    self.money = self.money + amount
end
