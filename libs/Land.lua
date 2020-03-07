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
    self.isInHorizon = 
        (self.landIndex >= 1 and self.landIndex <= 11) or 
        (self.landIndex >= 21 and self.landIndex <= 31)
    self.isInOpposite = (self.landIndex >= 21 and self.landIndex <= 40)

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
        --todo: make this more visible
        --ui.addTextArea(1000000 + self.landIndex, "<a href='event:addHouse:" .. self.landIndex .. "'>[ + ]</a>", owner, self.locX, self.locY, 20, 20, nil, nil, 0.5, true)
    end
end

function Land:addHouse()
    if self.houses >= 4 or self.hasHotel then
        error("Can't build a house here")
    else
        self.houses = self.houses + 1
        players[self.owner]:addMoney(-self.buildCost)
        local houseLocData = housePoints[self.landIndex][self.houses]
        ui.addTextArea(1000000 + (self.landIndex * 100 + self.houses), "H", nil, houseLocData.x, houseLocData.y, houseLocData.w, houseLocData.h, nil, nil, 0.5, true)
    end
end

function Land:removeHouse()
    ui.removeTextArea(1000000 + (self.landIndex * 100 + self.houses))
    self.houses = (self.houses - 1 < 0) and 0 or self.houses - 1
end

function Land:addHotel()
    if not self.hasHotel and self.houses == 4 then
        for i=1, 4 do
            self:removeHouse()
        end
        local houseLocData = housePoints[self.landIndex][self.isInOpposite and 4 or 1]
        ui.addTextArea(1000000 + (self.landIndex * 100 + 5), "H+", nil, houseLocData.x, houseLocData.y, houseLocData.w * (self.isInHorizon and 4 or 1), houseLocData.h * (self.isInHorizon and 1 or 4), nil, nil, 0.5, true)
        self.hasHotel = true
        players[self.owner]:addMoney(-self.buildCost)
    end
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

function Land:canBuild(building)
    --todo: refactor this nested code
    if self.hasHotel then
        return false
    elseif building == "house" then
        for cat, land in next, landCategories[self.color] do
            local land = lands[land]
            if land.landIndex ~= self.landIndex and (land.owner ~= self.owner or (land.houses < self.houses)) then
                return false
            end
        end
        return true
    elseif building == "hotel" then
        if self.houses < 4 then
            return false
        end
        for cat, land in next, landCategories[self.color] do
            local land = lands[land]
            if land.hasHotel then
                return true
            elseif land.houses ~= 4 then
                return false
            end
        end
        return true
    end
end

--[[@abstract method]]--
function Land:onLand(player, ...) 
    return false
end
