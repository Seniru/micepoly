--[[ Player class ]]--
local Player = {}
Player.__index = Player
Player.__tostring = function(self)
    return "[name=" .. self.name .. ", money: " .. self.money .. "]"
end

Player.jailFreeMethods = {
    PAY_PRISON = "pay-prison",
    CHANCE_CARD = "jail-free-chance",
    COMMUNITY_CHEST_CARD = "jail-free-comm"
}

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
    self.hasJailFreeCards = {
        ["chance"] = false,
        ["community chest"] = false
    }
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

function Player:jailFree(method)
    if method == Player.jailFreeMethods.PAY_PRISON then
        self:addMoney(-500)
        self.isInJail = false
        self.current = 11
        self:goTo(11)
        handleCloseBtn(15000, self.name)
    elseif method == Player.jailFreeMethods.CHANCE_CARD then
        --todo: refactor this block
        if self.hasJailFreeCards["chance"] then
            self.isInJail = false
            self.current = 11
            self:goTo(11)
            self.hasJailFreeCards["chance"] = false
            jailFreeChanceId = #chances + 1
            table.insert(chances, Chance:new(24, "Get out of Jail free", "This card may be kept until needed or sold.", function(player, land)
                table.remove(chances, jailFreeChanceId)
                currentChance = jailFreeChanceId
                player.hasJailFreeCards["chance"] = true
            end))
            handleCloseBtn(15000, self.name)
        else
            tfm.exec.chatMessage("You don't own this item", self.name)
        end
    elseif method == Player.jailFreeMethods.COMMUNITY_CHEST_CARD then
        if self.hasJailFreeCards["community chest"] then
            self.isInJail = false
            self.current = 11
            self:goTo(11)
            self.hasJailFreeCards["chance"] = false
            jailFreeCommId = #communityChests + 1
            table.insert(communityChests, CommunityChest:new(25, "Get out of Jail free", "This card may be kept until needed or sold.", function(player)
                table.remove(communityChests, jailFreeCommId)
                currentChance = (jailFreeCommId + 1 > #communityChests) and 1 or jailFreeCommId + 1
                player.hasJailFreeCards["community chest"] = true
            end))
            handleCloseBtn(15000, self.name)
        else
            tfm.exec.chatMessage("You don't own this item", self.name)
        end
    end
end