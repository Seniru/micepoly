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
    self.isInJail = false
    self.doubles = 0
    return self
end

function Player:getTotalWorth()
    local total = self.money
    for cat, ownedLands in next, self.ownedLands do
        for _, landId in next, ownedLands do
            local land = lands[landId]
            total = total + land.price + (land.houses + (land.hasHotel and 1 or 0)) * land.buildCost
        end
    end
    return total
end

function Player:goTo(land, withDoubles)
    if land == "jail" then
        return self:goToJail()
    end
    local landObj = lands[land]
    tfm.exec.movePlayer(self.name, points[land].x, points[land].y, false)
    if landObj.isSpecial then
        landObj:onLand(self)
        --todo: remove this line after implementing all special cases
        if not withDoubles then changeTurn() end
    else
        if not landObj.owner then
            ui.addTextArea(11000, "Buy or Auction?", self.name, 300, 100, 100, 100, nil, nil, 1, true)
            ui.addTextArea(11001, "<a href='event:buy:" .. landObj.landIndex .. "'>Buy</a>", self.name, 300, 250, 50, 50, nil, nil, 1, true)
            ui.addTextArea(11002, "<a href='event:auction:" .. landObj.landIndex .. "'>Auction</a>", self.name, 360, 250, 50, 50, nil, nil, 1, true)
        else
            local rent = landObj:getRent()
            self:addMoney(-rent)
            players[landObj.owner]:addMoney(rent)
            if not withDoubles then changeTurn() end
        end
    end
end

function Player:addMoney(amount)
    self.money = self.money + amount
    self:updateStatsBar()
end

function Player:updateStatsBar()
    ui.updateTextArea(13, "Money: $" .. self.money, self.name)
end

function Player:goToJail()
    tfm.exec.movePlayer(self.name, points["jail"].x, points["jail"].y, false)
    self.isInJail = true
    self.doubles = 0
    self.current = 11
    changeTurn()
end
