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

function Land.new(name, price, color, landIndex, landRent, house1Rent, house2Rent, house3Rent, house4Rent, hotelRent, buildCost, isSpecial)
    
    local self = setmetatable({}, Land)
    self.name = name
    self.price = price
    self.color = color
    self.landIndex = landIndex
    self.isSpecial = isSpecial
    self.houses = 0
    self.hasHotel = false
    self.owner = nil
    self.onland = nil

    self.landRent = landRent
    self.house1Rent = house1Rent
    self.house2Rent = house2Rent
    self.house3Rent = house3Rent
    self.house4Rent = house4Rent
    self.hotelRent = hotelRent
    self.buildCost = buildCost

    self.locX = points[landIndex].x
    self.locY = points[landIndex].y

    return self
end

function Land:removeOwner(owner)
    self.owner = nil
end

function Land:setOwner(owner)
    if self.owner then
        error(self.name .. " already has an owner")
    else
        players[owner]:addMoney(-self.price)
        self.owner = owner
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

--[[@abstract method]]--
function Land:onLand(player, ...) 
    return false
end
