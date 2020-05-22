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

function Land:removeOwner()
    players[self.owner].ownedLands[self.color][self.landIndex] = nil
    players[self.owner].ownedLands[self.color]._lands = players[self.owner].ownedLands[self.color]._lands - 1
    self.owner = nil
end

function Land:setOwner(owner, auctionedPrice)
    if self.owner then
        tfm.exec.chatMessage(self.name .. " already has an owner", owner)
    else
        if self.isMortgaged then
            ui.addPopup(300 + self.landIndex, 1, self.name .. " is mortgaged, do you wish to lift it now", owner, nil, nil, nil, true)
        end
        self.owner = owner
        if not players[owner].ownedLands[self.color] then
            players[owner].ownedLands[self.color] = {[self.landIndex] = self.name, _lands = 1}
        else
            players[owner].ownedLands[self.color][self.landIndex] = self.name
            players[owner].ownedLands[self.color]._lands = players[owner].ownedLands[self.color]._lands + 1
        end
        players[owner]:addMoney(-(auctionedPrice or self.price))
        -- if players[owner].doubles == 0 then changeTurn() end
        --todo: make this more visible
        --ui.addTextArea(1000000 + self.landIndex, "<a href='event:addHouse:" .. self.landIndex .. "'>[ + ]</a>", owner, self.locX, self.locY, 20, 20, nil, nil, 0.5, true)
    end
end

function Land:addHouse()
    if not self:canBuild("house") then
        error("Can't build a house here")
    else
        self.houses = self.houses + 1
        players[self.owner]:addMoney(-self.buildCost)
        local houseLocData = housePoints[self.landIndex][self.houses]
        ui.addTextArea(1000000 + (self.landIndex * 100 + self.houses), "H", nil, houseLocData.x, houseLocData.y, houseLocData.w, houseLocData.h, nil, nil, 0.5, false)
    end
end

function Land:addHotel()
    if self:canBuild("hotel") then
        for i=1, 4 do
            self:removeBuildings(true)
        end
        local houseLocData = housePoints[self.landIndex][self.isInOpposite and 4 or 1]
        self.hasHotel = true
        self.houses = 0
        ui.addTextArea(1000000 + (self.landIndex * 100 + 5), "H+", nil, houseLocData.x, houseLocData.y, houseLocData.w * (self.isInHorizon and 4 or 1), houseLocData.h * (self.isInHorizon and 1 or 4), nil, nil, 0.5, false)
        players[self.owner]:addMoney(-self.buildCost)
    end
end

function Land:removeBuildings(force)
    if force or self:canBreak() then
        if self.hasHotel then
            ui.removeTextArea(1000000 + (self.landIndex * 100 + 5))
            self.hasHotel = false
            for houses = 1, 4 do
                local houseLocData = housePoints[self.landIndex][houses]
                ui.removeTextArea(1000000 + (self.landIndex * 100 + houses))
            end
            self.houses = 4
        else
            ui.removeTextArea(1000000 + (self.landIndex * 100 + self.houses))
            self.houses = (self.houses - 1 < 0) and 0 or self.houses - 1
        end
    end
end

function Land:mortgage(mortgage)
    if mortgage then
        if self.houses > 0 or self.hasHotel then
            tfm.exec.chatMessage("Can't mortgage while houses/hotels are on the land", self.owner)
            return false
        end
        self.isMortgaged = true
        players[self.owner]:addMoney(self.price / 2)
    else
        self.isMortgaged = false
        players[self.owner]:addMoney(-(self.price / 2 * 1.1))
    end
end

function Land:getRent()
    --checking if the player owns all the lands in that category
    if self.isMortgaged then
        return 0
    end

    if players[self.owner].ownedLands[self.color]._lands == #landCategories[self.color] then
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

function Land:canBreak()
    if self.hasHotel then
        return true
    elseif self.houses == 0 then
        return false
    else
        for cat, land in next, landCategories[self.color] do
            local land = lands[land]
            if land.landIndex ~= self.landIndex and land.houses > self.houses then
                return false
            end
        end
    end
    return true
end

--[[@abstract method]]--
function Land:onLand(player, ...) 
    return false
end
