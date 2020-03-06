--[[ Land class ]]
local Land = {}
Land.__index = Land
Land.__tostring = function(self)
    return "[name=" .. self.name .. "]"
end

setmetatable(Land, {
    __call = function (cls, name, ...)
        return cls.new(name, ...)
    end,
})

function Land.new(data)
    local self = setmetatable({}, Land)
    self.landIndex = data[1] or data.landIndex
    self.name = data[2] or data.name
    self.price = data.price
    self.color = data.color
    self.isSpecial = data.isSpecial
    self.houses = 0
    self.hasHotel = false
    self.owner = nil
    self.onland = nil
    self.isMortgaged = false

    self.landRent = data.landRent
    self.houseRents = data.houseRents
    self.hotelRent = data.hotelRent
    self.buildCost = data.buildCost

    self.locX = points[self.landIndex].x
    self.locY = points[self.landIndex].y

    return self
end

function Land:removeOwner(owner)
    self.owner = nil
end

function Land:setOwner(owner)
    if self.owner then
        error(self.name .. " already has an owner")
    else
        self.owner = owner
        if not players[owner].ownedLands[self.color] then
            players[owner].ownedLands[self.color] = {self.landIndex}
        else
            table.insert(players[owner].ownedLands[self.color], self.landIndex)
        end
        players[owner]:addMoney(-self.price)
    end
end

function Land:addHouse()
    if self.houses >= 4 or self.hasHotel then
        error("Can't build a house here")
    else
        self.houses = self.houses + 1
    end
end

function Land:removeHouse()
    self.houses = (self.houses - 1 < 0) and 0 or self.houses - 1
end

function Land:addHotel()
    self.houses = 0
    self.hasHotel = true
end

function Land:getRent()
    --checking if the player owns all the lands in that category
    if #players[self.owner].ownedLands[self.color] == #landCategories[self.color] then
        if self.hasHotel then
            return self.hotelRent
        elseif self.houses > 0 then
            return self.houseRents[self.houses]
        else
            return self.landRent * 2
        end
    end
    return self.landRent
end

--[[@abstract method]]--
function Land:onLand(player, ...) 
    return false
end
