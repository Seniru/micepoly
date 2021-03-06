--==[[ exlibs ]]==--

local a="Makinit's XML library"local b="[%a_:][%w%.%-_:]*"function parseXml(c,d)if not d then c=string.gsub(c,"<!%[CDATA%[(.-)%]%]>",xmlEscape)c=string.gsub(c,"<%?.-%?>","")c=string.gsub(c,"<!%-%-.-%-%->","")c=string.gsub(c,"<!.->","")end;local e={}local f={}local g=e;for h,i,j,k,l in string.gmatch(c,"<(/?)("..b..")(.-)(/?)>%s*([^<]*)%s*")do if h=="/"then local m=f[g]if m and i==g.name then g=m end else local n={name=i,attribute={}}table.insert(g,n)f[n]=g;if k~="/"then g=n end;for i,o in string.gmatch(j,"("..b..")%s*=%s*\"(.-)\"")do n.attribute[i]=d and o or xmlUnescape(o)end end;if l~=""then local n={text=d and l or xmlUnescape(l)}table.insert(g,n)f[n]=g end end;return e[1]end;function generateXml(g,d)if g.name then local c="<"..g.name;for i,o in pairs(g.attribute)do c=c.." "..i.."=\""..(d and tostring(o)or xmlEscape(tostring(o))).."\""end;if#g==0 then c=c.." />"else c=c..">"for p,n in ipairs(g)do c=c..generateXml(n,d)end;c=c.."</"..g.name..">"end;return c elseif g.text then return d and tostring(g.text)or xmlEscape(tostring(g.text))end end;function path(q,...)q={q}for p,i in ipairs(arg)do local r={}for p,s in ipairs(q)do for p,n in ipairs(s)do if n.name==i then table.insert(r,n)end end end;q=r end;return q end;local t={}function xmlEscape(u)local v=t[u]if not v then local w=string.gsub;v=w(u,"&","&amp;")v=w(v,"\"","&quot;")v=w(v,"'","&apos;")v=w(v,"<","&lt;")v=w(v,">","&gt;")t[u]=v end;return v end;local x={}function xmlUnescape(u)local v=x[u]if not v then local w=string.gsub;v=w(u,"&quot;","\"")v=w(v,"&apos;","'")v=w(v,"&lt;","<")v=w(v,"&gt;",">")v=w(v,"&#(%d%d?%d?%d?);",dec2char)v=w(v,"&#x(%x%x?%x?%x?);",hex2char)v=w(v,"&amp;","&")x[u]=v end;return v end;function dec2char(y)y=tonumber(y)return string.char(y>255 and 0 or y)end;function hex2char(y)y=tonumber(y,16)return string.char(y>255 and 0 or y)end

--==[[ map ]]==--

local map = [[<C><P Ca="" /><Z><S><S X="768" m="" lua="1" L="10" Y="369" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="467" m="" L="10" Y="369" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" lua="5" /><S X="610" m="" L="10" Y="369" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" lua="3" /><S X="689" m="" L="10" Y="369" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" lua="2" /><S X="396" m="" L="10" Y="369" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" lua="6" /><S X="541" m="" L="10" Y="369" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" lua="4" /><S X="326" m="" L="10" Y="369" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" lua="7" /><S X="180" m="" L="10" Y="369" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" lua="9" /><S X="253" m="" L="10" Y="369" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" lua="8" /><S X="108" m="" lua="10" L="10" Y="369" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="27" m="" lua="14" L="10" Y="141" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="27" m="" lua="13" L="10" Y="207" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="27" m="" lua="12" L="10" Y="286" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="27" m="" lua="15" L="10" Y="68" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="67" m="" lua="15" L="10" Y="68" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="23" m="" lua="11" L="10" Y="374" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="50" m="" lua="jail" L="10" Y="348" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="400" Y="341" T="12" L="648" H="10" P="0,0,0.3,0.2,0,0,0,0" o="DBDBDB" /><S X="648" Y="197" T="12" L="400" H="10" P="0,0,0.3,0.2,90,0,0,0" o="DBDBDB" /><S X="400" Y="208" T="12" L="664" H="256" o="DBDBDB" P="0,0,0.3,0.2,0,0,0,0" c="2" /><S X="400" Y="325" T="12" L="800" H="10" P="0,0,0.3,0.2,0,0,0,0" o="DBDBDB" /><S X="658" Y="337" T="4" L="15" H="20" P="0,0,20,0.2,0,0,0,0" m="" lua="201" c="2" /><S X="400" Y="397" T="12" L="800" H="10" P="0,0,0.3,0.2,0,0,0,0" o="DBDBDB" /><S X="400" Y="101" T="12" L="800" H="10" P="0,0,0.3,0.2,0,0,0,0" o="DBDBDB" /><S X="57" Y="159" T="12" L="330" H="24" P="0,0,0.3,0.2,90,0,0,0" o="DBDBDB" c="2" /><S X="400" Y="173" T="12" L="800" H="10" P="0,0,0.3,0.2,0,0,0,0" o="DBDBDB" /><S X="52" Y="368" T="12" L="37" H="10" P="0,0,0.3,0.2,0,0,0,0" o="DBDBDB" /><S X="28" Y="347" T="12" L="37" H="10" P="0,0,0.3,0.2,90,0,0,0" o="DBDBDB" /><S X="400" Y="13" T="12" L="800" H="43" P="0,0,0.3,0.2,0,0,0,0" o="DBDBDB" /><S X="400" Y="245" T="12" L="800" H="10" P="0,0,0.3,0.2,0,0,0,0" o="DBDBDB" /><S X="0" Y="197" T="12" L="400" H="10" P="0,0,0.3,0.2,90,0,0,0" o="DBDBDB" /><S X="73" Y="196" T="12" L="403" H="10" P="0,0,0.3,0.2,90,0,0,0" o="DBDBDB" /><S X="217" Y="197" T="12" L="400" H="10" P="0,0,0.3,0.2,90,0,0,0" o="DBDBDB" /><S X="145" Y="197" T="12" L="400" H="10" P="0,0,0.3,0.2,90,0,0,0" o="DBDBDB" /><S X="289" Y="197" T="12" L="400" H="10" P="0,0,0.3,0.2,90,0,0,0" o="DBDBDB" /><S X="360" Y="197" T="12" L="400" H="10" P="0,0,0.3,0.2,90,0,0,0" o="DBDBDB" /><S X="432" Y="197" T="12" L="400" H="10" P="0,0,0.3,0.2,90,0,0,0" o="DBDBDB" /><S X="504" Y="197" T="12" L="400" H="10" P="0,0,0.3,0.2,90,0,0,0" o="DBDBDB" /><S X="576" Y="197" T="12" L="400" H="10" P="0,0,0.3,0.2,90,0,0,0" o="DBDBDB" /><S X="728" Y="197" T="12" L="400" H="10" P="0,0,0.3,0.2,90,0,0,0" o="DBDBDB" /><S X="800" Y="197" T="12" L="400" H="10" P="0,0,0.3,0.2,90,0,0,0" o="DBDBDB" /><S X="729" Y="159" T="12" L="333" H="45" P="0,0,0.3,0.2,90,0,0,0" o="DBDBDB" c="2" /><S X="771" m="" lua="27" L="10" Y="206" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="772" m="" lua="28" L="10" Y="287" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="771" m="" lua="25" L="10" Y="63" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="772" m="" lua="26" L="10" Y="134" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="716" Y="337" T="4" L="15" H="20" P="0,0,20,0.2,0,0,0,0" m="" lua="204" c="2" /><S X="697" Y="337" T="4" L="15" H="20" P="0,0,20,0.2,0,0,0,0" m="" lua="203" c="2" /><S X="678" Y="337" T="4" L="15" H="20" P="0,0,20,0.2,0,0,0,0" m="" lua="202" c="2" /><S X="110" m="" lua="16" L="10" Y="68" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="182" m="" lua="17" L="10" Y="68" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="253" m="" lua="18" L="10" Y="68" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="324" m="" lua="19" L="10" Y="68" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="402" m="" lua="20" L="10" Y="68" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="468" m="" lua="21" L="10" Y="68" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="542" m="" lua="22" L="10" Y="68" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="608" m="" lua="23" L="10" Y="68" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="679" m="" lua="24" L="10" Y="68" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /></S><D><DS X="752" Y="372" /></D><O /><L /></Z></C>]]

--==[[ lobby ]]==--

local lobby = [[<C><P /><Z><S><S X="401" Y="396" T="0" L="804" H="20" P="0,0,0.3,0.2,0,0,0,0" /></S><D><DS X="399" Y="368" /><P X="63" Y="384" T="19" C="8A311B" P="0,0" /><P X="147" Y="380" T="19" C="8A311B" P="0,0" /><P X="237" Y="372" T="19" C="8A311B" P="0,0" /><P X="319" Y="378" T="19" C="8A311B" P="0,0" /><P X="483" Y="378" T="19" C="8A311B" P="0,0" /><P X="577" Y="378" T="19" C="8A311B" P="0,0" /><P X="669" Y="378" T="19" C="8A311B" P="0,0" /><P X="763" Y="380" T="19" C="8A311B" P="0,0" /></D><O /><L /></Z></C>]]

--==[[ libs ]]==--

function split(s, delimiter)
    result = {}
    for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
        table.insert(result, match)
    end
    return result
end

function shuffle(tbl)
    math.randomseed(os.time())
    for i = 1, #tbl do
        local j = math.random(i)
        tbl[i], tbl[j] = tbl[j], tbl[i]
    end
end

function getNext(tbl, current)
    return next(tbl, current) or next(tbl)
end

function table.tostring(tbl, depth)
    local res = "{"
    local prev = 0
    for k, v in next, tbl do
        if type(v) == "table" then
            if depth == nil or depth > 0 then
                res =
                    res ..
                    ((type(k) == "number" and prev and prev + 1 == k) and "" or k .. ": ") ..
                        table.tostring(v, depth and depth - 1 or nil) .. ", "
            else
                res = res .. k .. ":  {...}, "
            end
        else
            res = res .. ((type(k) == "number" and prev and prev + 1 == k) and "" or k .. ": ") .. tostring(v) .. ", "
        end
        prev = type(k) == "number" and k or nil
    end
    return res:sub(1, res:len() - 2) .. "}"
end

math.randomseed(os.time())

--game variables
local points, housePoints, players, lands, chances, communityChests = {}, {}, {}, {}, {}, {}
local gameStarted = false
local jailFreeChanceId, jailFreeCommId = nil
local totalPlayers = 0
local currentPlayer, currentChance, currentCommunityChest

local  closeBtn = "<p align='right'><R><b><a href='event:close'>X</a></b></R></p>"

--table to store lands of same category
local landCategories = {
    ["teleporter"] = {6, 16, 26, 36},
    ["factory"] = {13, 29},
    ["purple"] = {2, 4},
    ["light blue"] = {7, 9, 10},
    ["magenta"] = {12, 14, 15},
    ["orange"] = {17, 19, 20},
    ["red"] = {22, 24, 25},
    ["yellow"] = {27, 28, 30},
    ["green"] = {32, 33, 35},
    ["dark blue"] = {38, 40}
}

-- text area ids to remove on close events
local closeSequence = {
        [200] = {200, 201, 202, 203, 204, 205, 206, 207},
        [10000] = {10000, 10001, 10002, 10003, 10004, 10005},
        [11002] = {11000, 11001, 11002},
        [14000] = {14000, 14001, 14002},
        [15000] = {15000, 15001, 15002, 15003, 15004}
    }

local auctions

--Timers4TFm
local a={}a.__index=a;a._timers={}setmetatable(a,{__call=function(b,...)return b.new(...)end})function a.process()local c=os.time()local d={}for e,f in next,a._timers do if f.isAlive and f.mature<=c then f:call()if f.loop then f:reset()else f:kill()d[#d+1]=e end end end;for e,f in next,d do a._timers[f]=nil end end;function a.new(g,h,i,j,...)local self=setmetatable({},a)self.id=g;self.callback=h;self.timeout=i;self.isAlive=true;self.mature=os.time()+i;self.loop=j;self.args={...}a._timers[g]=self;return self end;function a:setCallback(k)self.callback=k end;function a:addTime(c)self.mature=self.mature+c end;function a:setLoop(j)self.loop=j end;function a:setArgs(...)self.args={...}end;function a:call()self.callback(table.unpack(self.args))end;function a:kill()self.isAlive=false end;function a:reset()self.mature=os.time()+self.timeout end;Timer=a

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

--[[ Chance class ]]--
local Chance = Card:new()
Chance.__index = Card
Chance.__tostring = function(self)
    return "[name=" .. self.name .. ", money: " .. self.money .. "]"
end

setmetatable(Chance, {
    __call = function (cls, name)
        return cls.new(name)
    end,
})

function Chance:new(id, header, desc, action)
    --class Chance extends Card
    local self = setmetatable(Card:new(id, header, desc), self)
    function self:action(player, ...)
        return action(player, ...)
    end
    return self
end

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
    self.tradeID = nil
    self.hasJailFreeCards = {
        ["chance"] = false,
        ["community chest"] = false
    }
    return self
end

function Player:getTotalWorth()
    local total = self.money
    for cat, ownedLands in next, self.ownedLands do
        for landId, name in next, ownedLands do
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

--[[ Trade class ]]--
local Trade = {}
Trade.__index = Trade
Trade.__tostring = function(self)
    return table.tostring(self)
end

Trade.trades = {}
Trade.handshakes = {}

setmetatable(Trade, {
    __call = function (cls, name)
        return cls.new(name)
    end,
})

function Trade.new(id, party1, party2)
    print("new trade")
    local self = setmetatable({}, Trade)
    self.id = id

    self.party1 = {
        name = party1, lands = {}, teleporters = {}, utilities = {}, hasJailFreeCommu = false, hasJailFreeChance = false, money = 0, submitted = false
    }
    self.party2 = {
        name = party2, lands = {}, teleporters = {}, utilities = {}, hasJailFreeCommu = false, hasJailFreeChance = false, money = 0, submitted = false
    }

    players[party1].tradeID = id
    players[party2].tradeID = id
    Trade.trades[id] = self
    return self
end

function Trade:updateInterface()
    print("[trade] updte interface")
    local p1Name, p2Name = self.party1.name, self.party2.name
    local player1, player2 = players[p1Name], players[p2Name]
    local p1Txt, p2Txt = "[" .. p1Name .. "]\n", "[" .. p2Name .. "]\n"
    local col = lands[2].color
    for id, land in next, lands do
        if not land.isSpecial then
            if land.color ~= col then
                col = land.color
                p1Txt = p1Txt .. "\n" ..col
                p2Txt = p2Txt .. "\n" .. col
            end
            -- todo: create another string to displayed to the other party so that they can't add lands to the trade 
            local p1Owns = not not (player1.ownedLands[col] and player1.ownedLands[col][id])
            local p2Owns = not not (player2.ownedLands[col] and player2.ownedLands[col][id])
            local p1Added = p1Owns and self.party1.lands[id]
            local p2Added = p2Owns and self.party2.lands[id]
            if p1Added then print(id) end
            p1Txt = p1Txt .. (p1Owns and "<VP><a href='event:trade-addLand:" .. id .. "'>" or "<N2>") .. (p1Added and "<b><T>" or "") .. land.name .. (p1Added and "</T></b>" or "") .. (p1Owns and "</a></VP>" or "</N2>") .. ", "
            p2Txt = p2Txt .. (p2Owns and "<VP><a href='event:trade-addLand:" .. id .. "'>" or "<N2>") .. (p2Added and "<b><T>" or "") .. land.name .. (p2Added and "</T></b>" or "") .. (p2Owns and "</a></VP>" or "</N2>") .. ", "
        end
    end

    for _, player in next, ({self.party1.name, self.party2.name}) do
        ui.updateTextArea(200, player == p1Name and p1Txt or p2Txt, player)
        ui.updateTextArea(201, player == p1Name and p2Txt or p1Txt, player)
    end
end

function Trade:addLand(player, landId, add)
    print("[trade] add land")
    add = add == nil and true or add
    local party = player == self.party1.name and 1 or 2
    self["party" .. party].lands[landId] = add and true or nil
    print(table.tostring(self))
    self.party1.submitted = false
    self.party2.submitted = false
    self:updateInterface()
end

function Trade:addCard(player, type)
    local party = player == self.party1.name and 1 or 2
    local hasJailFreeChance, hasJailFreeCommu = players[player].hasJailFreeCards["chance"], players[player].hasJailFreeCards["community chest"]
    self["party" .. party]["hasJailFree" .. type] = type == "Chance" and hasJailFreeChance or hasJailFreeCommu
    local addJailFreeChance, addJailFreeCommu = self["party" .. party].hasJailFreeChance, self["party" .. party].hasJailFreeCommu
    local res = player .. 
        ((addJailFreeChance and "<T>" or "") .. (hasJailFreeChance and "<a href='event:jailFreeChance:" .. self.id .. "'>" or "<N2>") .. "Get out of jail free (chance) " .. (hasJailFreeChance and "</a>" or "</N2>") .. (addJailFreeChance and "</T>" or "")) .. "|" .. 
        ((addJailFreeCommu and "<T>" or "") .. (hasJailFreeCommu and "<a href='event:jailFreeCommu:" .. self.id .. "'>" or "<N2>") .. "Get out of jail free (commu)" .. (hasJailFreeCommu and "</a>" or "</N2>") .. (addJailFreeCommu and "</T>" or ""))
    ui.updateTextArea(206, res, player)
    ui.updateTextArea(207, res, player == self.party1.name and self.party2.name or self.party1.name)
end

function Trade:addMoney(player, amount)
    local playerObj = players[player]
    if not amount then
        tfm.exec.chatMessage("<R>Please specify a valid number!", player)
    elseif amount > playerObj.money then
        tfm.exec.chatMessage("<R>Not enough money for that action!", player)
    else
        local party = player == self.party1.name and 1 or 2
        self["party" .. party].money = amount
        ui.updateTextArea(204, "<a href='event:trade-addMoney:" .. self.id .. "'>Money: $" .. amount .. "</a>", player)
        ui.updateTextArea(205, "<a href='event:trade-addMoney:" .. self.id .. "'>Money: $" .. amount .. "</a>", player == self.party1.name and self.party2.name or self.party1.name)
    end
end

function Trade:close(closedBy)
    print("[trade] close")
    if closedBy then
        tfm.exec.chatMessage("You cancelled the trade!", closedBy)
        tfm.exec.chatMessage("The trade has been cancelled by " .. closedBy, self.party1.name == closeBy and self.party2.name or self.party1.name)
    end
    handleCloseBtn(200, self.party1.name)
    handleCloseBtn(200, self.party2.name)
    players[self.party1.name].tradeID = nil
    players[self.party2.name].tradeID = nil
    Trade.trades[self.id] = nil
    self = nil
end

function Trade:submit(submittedBy)
    print("[trade] submit")
    local party = submittedBy == self.party1.name and 1 or 2
    self["party" .. party].submitted = true
    if self.party1.submitted and self.party2.submitted then
        -- both parties submitted, start the transaction
        for party, partyData in next, ({self.party1, self.party2}) do
            local partyName = partyData.name
            local otherName = partyName == self.party1.name and self.party2.name or self.party1.name
            -- exchanging lands
            for landID, _ in next, partyData.lands do
                lands[landID]:removeOwner()
                lands[landID]:setOwner(otherName, 0)
            end
            -- exchanging money
            players[partyName]:addMoney(-(partyData.money))
            players[otherName]:addMoney(partyData.money)
            -- exchanging cards
            if partyData.hasJailFreeChance then
                players[partyName].hasJailFreeCards["chance"] = false
                players[otherName].hasJailFreeCards["chance"] = true
            end
            if partyData.hasJailFreeCommu then
                players[partyName].hasJailFreeCards["community chest"] = false
                players[otherName].hasJailFreeCards["community chest"] = true
            end
        end
        self:close()
    end
end


--==[[ main ]]==--

--disabling unwanted room settings
tfm.exec.disableAutoNewGame()
tfm.exec.disableAutoTimeLeft()
tfm.exec.disableAfkDeath()
tfm.exec.disableAutoShaman()
tfm.exec.disableMortCommand()

tfm.exec.setRoomMaxPlayers(15)

function initCards()

    chances = {
        Chance:new(1, "Speeding fine!", "Pay $150", function(player) 
            player:addMoney(-150)
        end),
        Chance:new(2, "Go back 3 spaces", "", function(player, land)
            player:goTo((land.landIndex - 3) < 1 and 40 - land.landIndex - 3 or land.landIndex - 3)
        end),
        Chance:new(3, "Chance", "Bank pays you dividend of $500", function(player)
            player:addMoney(500)
        end),
        Chance:new(4, "Drunk in Charge", "Fine $200", function(player)
            player:addMoney(-200)
        end),
        Chance:new(5, "Collect $1000", "You have won a fanart competition", function(player)
            player:addMoney(1000)
        end),
        Chance:new(6, "Receive $1500", "Your building loan has matured", function(player)
            player:addMoney(1500)
        end),
        Chance:new(7, "You were assessed for street repairs", "\t$400 per house\n\t$1150 per hotel", function(player)
            --todo: implementing this after supporting houses
            player:addMoney(0)
        end),
        Chance:new(8, "Take a trip to Elisah`s teleporter station", "Collect $2000 if you pass `GO`!", function(player, land)
            -- check if a player has to pass GO to move to Elisa's teleporter
            if land.landIndex > 26 then
                player:addMoney(2000)
            end
            player:goTo(26) -- going to elisah's teleporter station
        end),
        Chance:new(9, "Pay school fees", "Pay school fees of $1500", function(player)
            player:addMoney(-1500)
        end),
        Chance:new(10, "Visit to King Fromagnus`s Castle", "Collect $2000 if you pass `GO`!", function(player, land)
            -- check if a player has to pass Go to move to the castle
            if land.landIndex > 17 then
                player:addMoney(2000)
            end
            player:goTo(17) -- going to king fromagnus's castle
        end),
        Chance:new(11, "Make general repairs on all of your houses", "\t$250 for each houses\n\t$1000 for each hotel", function(player)
            --todo: implement this after supporting houses
            print("Not implemented")
        end),
        Chance:new(12, "Go to Jail!", "Move directly to jail. Do not pass GO. Do not collect $2000", function(player)
            player:goToJail()
        end),
        Chance:new(13, "Advance to Buffy`s Residence", "", function(player)
            player:goTo(2) -- Going to buffy's residence
        end),
        Chance:new(14, "Advance to Chez Gustave!", "", function(player)
            player:goTo(24) -- Going to cheze gustave
        end),
        Chance:new(15, "Troll!", "", function(player)
            tfm.exec.chatMessage("Troll :P", player.name)
        end),
        Chance:new(16, "Hunger!", "Pay $50 to eat and prevent you from dying!", function(player)
            player:addMoney(-50)
        end),
        Chance:new(17, "$50 Reward!", "Like our post in forum!", function(player)
            --todo: add the forum link
            tfm.exec.chatMessage("Like our post in forum\nLink: https://123456.com", player.name)
            player:addMoney(50)
        end),
        Chance:new(18, "AFK Death", "Pay $20 to revive!", function(player)
            player:addMoney(-20)
        end),
        Chance:new(19, "It`s Money!", "Every player get $500", function()
            for name, player in next, players do
                player:addMoney(500)
            end
            tfm.exec.chatMessage("You got $500 as a gift!")
        end),
        Chance:new(20, "It`s your birthday!", "Collect $200 from each player", function(player)
            tfm.exec.chatMessage("It's " .. player.name .. "'s Birthday! Give him a present of $200")
            for _, p in next, players do
                p:addMoney(-200)
                player:addMoney(200)
            end
        end),
        Chance:new(22, "Pay $2000", "Pay $2000 for your utility bills", function(player)
            player:addMoney(-2000)
        end),
        Chance:new(23, "You won a lottery!", "Collect $2500", function(player)
            player:addMoney(2500)
        end),
        Chance:new(24, "Get out of Jail free", "This card may be kept until needed or sold.", function(player, land)
            table.remove(chances, jailFreeChanceId)
            currentChance = (jailFreeChanceId + 1 > #chances) and 1 or jailFreeChanceId + 1
            player.hasJailFreeCards["chance"] = true
        end)
        --todo: Add the get out of the jail card after implementing the jail and related featuress
    }

    communityChests = {
        CommunityChest:new(1, "Receive $250", "Receive interest on 7% preference shares of $250", function(player) 
            player:addMoney(250)
        end),
        CommunityChest:new(2, "Collect $1000", "You have won 2nd price in a fashion squad competition", function(player)
            player:addMoney(250)
        end),
        CommunityChest:new(3, "Pay $1000", "Pay your insurance premium of $1000", function(player)
            player:addMoney(-1000)
        end),
        CommunityChest:new(4, "Collect $200", "Income tax refund", function(player)
            player:addMoney(-200)
        end),
        CommunityChest:new(5, "Collect $2000", "Bank error in your favour", function(player)
            player:addMoney(2000)
        end),
        CommunityChest:new(6, "Pay $1000", "Pay $1000 to the hospital", function(player)
            player:addMoney(-1000)
        end),
        CommunityChest:new(7, "Go to Jail!", "Move directly to jail. Do not pass GO. Do not collect $2000", function(player)
            player:goToJail()
        end),
        CommunityChest:new(8, "It`s your birthday!", "Collect $100 from each player", function(player)
            tfm.exec.chatMessage("It's " .. player.name .. "'s Birthday! Give him a present of $200")
            for _, p in next, players do
                p:addMoney(-200)
                player:addMoney(200)
            end
        end),
        CommunityChest:new(9, "Trick or Treat?", "Pay a fine of $100 or take a chance", function(player)
            --todo: implement this correctly
            tfm.exec.chatMessage("Not implemented correclty! No effect because of that", player.name)
        end),
        CommunityChest:new(10, "You inherit $1000", "", function(player)
            player:addMoney(1000)
        end),
        CommunityChest:new(11, "Pay $500", "Doctor`s fee", function(player)
            player:addMoney(-500)
        end),
        CommunityChest:new(12, "Receive $500", "From Sale of stock you got $500", function(player)
            player:addMoney(500)
        end),
        CommunityChest:new(13, "Go back to Transformice Museum", "", function(player)
            player:goTo(4) -- Going to Transformice Museum
        end),
        CommunityChest:new(14, "Annuity matures", "Collect $1000", function(player)
            player:addMoney(1000)
        end),
        CommunityChest:new(15, "Receive $500", "<i>Powered by Shaman</i>", function(player)
            player:addMoney(500)
        end),
        CommunityChest:new(16, "Error occured in game!", "You received $1500", function(player)
            player:addMoney(1500)
            tfm.exec.chatMessage("Don't forget to report actual bugs to the developer.\n<LINK HERE>", player.name)
        end),
        CommunityChest:new(17, "Trollol!", "", function(player)
            tfm.exec.chatMessage("Trollol!!!", player.name)
        end),
        CommunityChest:new(18, "Pay $500", "Pay bank loan interest of $500", function(player)
            player:addMoney(-500)
        end),
        CommunityChest:new(19, "Cheef's food!", "You got $250 for free", function(player)
            player:addMoney(-250)
        end),
        CommunityChest:new(20, "Receive $1000", "Part time job salary", function(player)
            player:addMoney(1000)
        end),
        CommunityChest:new(21, "Pay 500", "General repairs in your house", function(player)
            player:addMoney(-500)
        end),
        CommunityChest:new(22, "Cheese farming event!", "You farmed $250 in 1 hour", function(player)
            player:addMoney(250)
        end),
        CommunityChest:new(23, "Go back 5 spaces", "", function(player, land)
            player:goTo((land.landIndex - 5) < 1 and 40 - land.landIndex - 5 or land.landIndex - 5)
        end),
        CommunityChest:new(24, "Let`s gamble!", "Place your bet", function(player)
            --todo: implement this
            tfm.exec.chatMessage("Not implemented!", player.name)
        end),
        CommunityChest:new(25, "Get out of Jail free", "This card may be kept until needed or sold.", function(player)
            table.remove(communityChests, jailFreeCommId)
            currentChance = (jailFreeCommId + 1 > #communityChests) and 1 or jailFreeCommId + 1
            player.hasJailFreeCards["community chest"] = true
        end)
        --todo: Add the get out of the jail card after implementing the jail and related featuress
    }

    --shuffling the cards
    shuffle(chances)
    shuffle(communityChests)
    
    --getting the indexes of jail free cards
    do

        for id, chance in next, chances do
            if chance.header == "Get out of Jail free" then
                jailFreeChanceId = id
            end
        end

        for id, commChest in next,  communityChests do
            if commChest.header == "Get out of Jail free" then
                jailFreeCommId = id
            end
        end

    end

end

function initLands()

    --[[ configuring the lands
        format: name, price, group (color), landIndex, landRent, house1Rent, house2Rent,
        house3Rent, house4Rent, hotelRent, buildCost
    ]]
    --Land {"name", 0, "red", landRent = 1, houseRents = {10, 10, 100, 1000, hotelRent = 1000, buildCost = 10000, isSpecial = true}
    lands[1] = Land{1, "Go", isSpecial = true}
    lands[2] = Land{2, "Buffy`s Residence", price = 600, color = "purple", landRent = 20, houseRents = {100, 300, 900, 1600}, hotelRent = 2500, buildCost = 500}
    lands[3] = Land{3, "Community Chest", isSpecial = true}
    lands[4] = Land{4, "Transformice Museum", price = 600, color = "purple", landRent = 40, houseRents = {200, 600, 1800, 3200}, hotelRent = 4500, buildCost = 500}
    lands[5] = Land{5, "Income Tax", isSpecial = true}
    lands[6] = Land{6, "Shaman`s Teleporter", price = 2000, color = "teleporter", landRent = 250, houseRents = {500, 1000, 2000}}
    lands[7] = Land{7, "801 Town", price = 1000, color = "light blue", landRent =  60, houseRents = {300, 900, 2700, 4000}, hotelRent = 5500, buildCost = 500}
    lands[8] = Land{8, "Chance", isSpecial = true}
    lands[9] = Land{9, "Grim`s Mansion", price = 1000, color = "light blue", landRent = 60, houseRents = {300, 900, 2700, 4000}, hotelRent = 5500, buildCost = 500}
    lands[10] = Land{10, "Nuremberg", price = 1200, color = "light blue", landRent = 80, houseRents = {400, 1000, 3000, 4500}, hotelRent = 6000, buildCost = 500}
    lands[11] = Land{11, "Jail", isSpecial = true}
    lands[12] = Land{12, "Jingle`s abode", price = 1400, color = "magenta", landRent = 100, houseRents = {500, 1500, 4500, 6250}, hotelRent = 7500, buildCost = 1000}
    lands[13] = Land{13, "Cheese factory", price = 1500, color = "factory", landRent = 4, houseRents = {10}, isSpecial = true}
    lands[14] = Land{14, "Salvador", price = 1400, color =  "magenta", landRent = 100, houseRents = { 500,  1500, 4500,  6250}, hotelRent = 7500, buildCost = 1000}
    lands[15] = Land{15, "Charlotte`s Tree Stump", price = 1600, color = "magenta", landRent = 120, houseRents = {600, 1800, 5000, 7000}, hotelRent = 9000, buildCost = 1000}
    lands[16] = Land{16, "Cheese Hole Teleporter", price = 2000, color = "teleporter", landRent = 250, houseRents = {500, 1000, 2000}}
    lands[17] = Land{17, "King Fromagnus`s Castle", price = 1800, color = "orange", landRent = 140, houseRents = {700, 2000, 5500, 7500}, hotelRent = 9500, buildCost = 1000}
    lands[18] = Land{18, "Community Chest", isSpecial = true}
    lands[19] = Land{19, "Land of Dream", price = 1800, color = "orange", landRent = 140, houseRents = {700, 2000, 5500, 7500}, hotelRent = 9500, buildCost = 1000}
    lands[20] = Land{20, "Garden of Roses", price = 2000, color = "orange", landRent = 160, houseRents = {80, 2200, 6000, 8000}, hotelRent = 10000, buildCost = 1000}
    lands[21] = Land{21, "Free Parking", isSpecial = true}
    lands[22] = Land{22, "Ol` Souris", price = 2200, color = "red", landRent = 180, houseRents = {900, 2500, 7000, 8750}, hotelRent = 10000, buildCost = 1500}
    lands[23] = Land{23, "Chance", isSpecial = true}
    lands[24] = Land{24, "Cheze Gustave", price = 2200, color = "red", landRent = 180, houseRents = {900, 2500, 7000, 8750}, hotelRent = 10000, buildCost = 1500}
    lands[25] = Land{25, "Konomouse", price = 2400, color = "red", landRent = 200, houseRents = {1000, 3000, 7500, 9250}, hotelRent = 11000, buildCost = 1500}
    lands[26] = Land{26, "Elisah`s Teleporter", price = 2000, color = "teleporter", landRent = 250, houseRents = {500, 1000, 2000}}
    lands[27] = Land{27, "Kürbisses-Nacht Streets", price = 2600, color = "yellow", landRent = 220, houseRents = {1100, 3300, 8000, 9750}, hotelRent = 11500, buildCost = 1500}
    lands[28] = Land{28, "Kürbisses-Nacht Attic", price = 2600, color = "yellow", landRent = 220, houseRents = {1100, 3300, 8000, 9750}, hotelRent = 11500, buildCost = 1500}
    --[[lands[29] = Land{29, "Fraises Factory", price = 1500, color = "factory", landRent = 4, houseRents = {10}, isSpecial = true}
    lands[30] = Land{30, "Kürbisses-Nacht Graveyard", price = 2800, color = "yellow", landRent = 240, houseRents = {1200, 3600, 8500, 10250}, hotelRent = 12000, buildCost = 1500}
    lands[31] = Land{31, "Go to Jail", isSpecial = true}
    lands[32] = Land{32, "Amazonia", price = 3000, color = "green", landRent = 260, houseRents = {1300, 3900, 9000, 11000}, hotelRent = 12750, buildCost = 2000}
    lands[33] = Land{33, "Antic Jungle", price = 3000, color = "green", landRent = 260, houseRents = {1300, 3900, 9000, 11000}, hotelRent = 12750, buildCost = 2000}
    lands[34] = Land{34, "Community Chest", isSpecial = true}
    lands[35] = Land{35, "Crystal Jungle", price = 3000, color = "green", landRent = 280, houseRents = {1500, 4500, 10000, 12000}, hotelRent = 14000, buildCost = 2000}
    lands[36] = Land{36, "Portal Teleporter", price = 2000, color = "teleporter", landRent = 250, houseRents = {500, 1000, 2000}}
    lands[37] = Land{37, "Chance", isSpecial = true}
    lands[38] = Land{38, "Haunted Library", price = 3500, color = "dark blue", landRent = 350, houseRents = {1750, 5000, 11000, 13000}, hotelRent = 15000, buildCost = 2000}
    lands[39] = Land{39, "Super Tax", isSpecial = true}
    lands[40] = Land{40, "Temple", price = 4000, color = "dark blue", landRent = 500, houseRents = {2000, 6000, 14000, 17000}, hotelRent = 20000, buildCost = 2000}]]
    
    local chanceFn = function(land, player)
        local curr = currentChance
        local success, nextC = pcall(getNext, chances, curr)
        if not success then
            nextC = 1
        end
        ui.addTextArea(12000, "Chance: " .. chances[nextC].header .. "<br>" .. chances[nextC].description, player.name, 200, 200, 200, 50, nil, nil, 1, true)
        chances[nextC]:action(player, land)
        currentChance = nextC
    end

    local commChestFn = function(land, player)
        local curr = currentCommunitychest
        local success, nextC = pcall(getNext, communityChests, curr)
        if not success then
            nextC = 1
        end
        ui.addTextArea(12000, "Community Chest: " .. communityChests[nextC].header .. "<br>" .. communityChests[nextC].description, player.name, 200, 200, 200, 50, nil, nil, 1, true)
        communityChests[nextC]:action(player, land)
        currentCommunitychest = nextC
    end
    
    --overriding the behaviours of special lands

    lands[3].onLand = function(self, player) --community chest
        commChestFn(self, player)
    end

    lands[5].onLand = function(self, player) -- income tax
        ui.addTextArea(14000, "Income Tax<br>Pay 2000 or 10% of your total worth", player.name, 300, 200, 200, 100, nil, nil, 1, true)
        ui.addTextArea(14001, "<a href='event:incomeTaxFull'>Pay 2000</a>", player.name, 300, 320, 90, 30, nil, nil, 1, true)
        ui.addTextArea(14002, "<a href='event:incomeTax10%'>Pay 10%</a>", player.name, 410, 320, 90, 30, nil, nil, 1, true)
    end

    lands[8].onLand = function(self, player) --chance
        chanceFn(self, player)
    end

    lands[18].onLand = function(self, player) --community chest
        commChestFn(self, player)
    end

    lands[23].onLand = function(self, player) --chance
        chanceFn(self, player)
    end

    --[[lands[34].onLand = function(self, player) --community chest
        commChestFn(self, player)
    end

    lands[37].onLand = function(self, player) --chance
        chanceFn(self, player)
    end


    lands[39].onLand = function(self, player) -- super tax
        tfm.exec.chatMessage("Super Tax! Pay $1000", player.name)
        player:addMoney(-1000)
    end

    lands[31].onLand = function(self, player)
        player:goToJail()
    end]]

    displayLands()
    
end

function displayLands(target)
    for id, land in next, lands do
        ui.addTextArea(1000 + id, "<a href='event:land:" .. id .. "'><b>" .. land.name .. "</b></a>", target, land.locX - 20, land.locY - 10, 60, 30, nil, nil, 0, false)
    end
end

function changeTurn()
    local curr = currentPlayer
    local nextP = getNext(players, currentPlayer)
    ui.updateTextArea(12, "<N2>Roll!</N2>", curr)
    if not players[nextP].isInJail then
        ui.updateTextArea(12, "<a href='event:roll'>Roll!</a>", nextP)
    else
        ui.addTextArea(15000, "You are in Jail\nPay $500, Use jail card or roll doubles in your next three turns", nextP, 300, 100, 100, 100, nil, nil, 1, true)
        ui.addTextArea(15001, "<a href='event:pay-prison'>Pay $500</a>", nextP, 300, 200, 50, 30, nil, nil, 1, true)
        ui.addTextArea(15002, "<a href='event:roll'>Roll!</a>", nextP, 400, 200, 50, 30, nil, nil, 1, true)
        ui.addTextArea(15003, "<a href='event:jail-free-chance'>Use Jail Chance</a>", nextP, 500, 200, 50, 30, nil, nil, 1, true)
        ui.addTextArea(15004, "<a href='event:jail-free-comm'>Use Jail community</a>", nextP, 550, 200, 50, 30, nil, nil, 1, true)
    end
    currentPlayer = nextP
end

function setUI(target)
    -- dice 1
    ui.addTextArea(10, "-", target, 700, 50, 50, 50, nil, nil, 1, true)
    -- dice 2
    ui.addTextArea(11, "-", target, 780, 50, 50, 50, nil, nil, 1, true)
    -- roll button
    ui.addTextArea(12, "<N2>Roll!</N2>", target, 720, 120, 200, 30, nil, nil, 1, true)
    -- stats
    ui.addTextArea(13, "Money: $15000", target, 780, 200, 100, 50, nil, nil, 1, true)
end

function showLandInfo(id, target)
    local land = lands[id]
    local res = closeBtn .. land.name

    if land.isSpecial then
        --todo
    else    
        if land.color == "factory" then
            --todo
        elseif land.color == "teleporter" then
            --todo
        else
            res = res .. " <i>(" .. land.color .. ")</i>" ..
            "\nPrice: " .. (land.price or "0") ..
            "\nOwner:" .. (land.owner or "NA") ..
                "\nLand rent: " .. (land.landRent or "NA") ..
                "\nWith 1 house: " .. (land.houseRents[1] or "NA") ..
                "\nWith 2 houses: " .. (land.houseRents[2] or "NA") ..
                "\nWith 3 houses: " .. (land.houseRents[3] or "NA") ..
                "\nWith 4 houses: " .. (land.houseRents[4] or "NA") ..
                "\nHotel rent: " .. (land.hotelRent or "NA") ..
                "\n<i>Mortgaged: " .. tostring(land.isMortgaged)
            end
    end
    
    ui.addTextArea(10000, res, target, 280, 100, 300, 200, nil, nil, 1, true)
    --adding extra control buttons for land owners
    if land.owner == target then
        --todo: support the functionality of the buttons
        ui.addTextArea(10001, land:canBuild("house") and ("<a href='event:addHouse:" .. land.landIndex .. "'>Add houses</a>") or "<N2>Add houses</N2>", target, 280, 330, 60, 40, nil, nil, 1, true)
        ui.addTextArea(10002, land:canBuild("hotel") and ("<a href='event:addHotel:" .. land.landIndex .. "'>Add hotel</a>") or "<N2>Add hotel</N2>", target, 340, 330, 60, 40, nil, nil, 1, true)
        ui.addTextArea(10003, (not land.isMortgaged) and ("<a href='event:mortgage:" .. land.landIndex .. "'>Mortgage</a>") or ("<a href='event:unmortgage:" .. land.landIndex .."'>Unmortgage</a>"), target, 400, 330, 60, 40, nil, nil, 1, true)
        ui.addTextArea(10004, "Sell", target, 460, 330, 60, 40, nil, nil, 1, true)
        ui.addTextArea(10005, land:canBreak() and ("<a href='event:breakHouse:" .. land.landIndex .. "'>Sell houses</a>") or "<N2>Sell houses</N2>", target, 500, 330, 60, 40, nil, nil, 1, true)
    end
end

function auctionLand(landId, bid, bidder, newInstance)
    local land = lands[landId]
    if not auctions and newInstance then
        auctions = {
            landId = landId,
            highest = bid,
            highestBidder = bidder,
            bidders = {},
            totalBidders = totalPlayers,
            currentBidder = bidder
        }
        for name, _ in next, players do
            auctions.bidders[name] = 1
        end
    elseif auctions and not newInstance then
        ui.removeTextArea(13000)
        auctions.highest = bid
        auctions.highestBidder = bidder
        auctions.currentBidder = getNext(auctions.bidders, auctions.currentBidder)
        auctions.bidders[auctions.currentBidder] = auctions.highest + 1
    else
        tfm.exec.chatMessage("An auction is ongoing, try again later!", bidder)
    end
    ui.addTextArea(13000, "Auctioning " .. land.name .."!\nPlace your bid\n" .. auctions.highest + 1 .. " <a href='event:increaseBid'>[ + ]</a>\n<a href='event:bid'>[ Bid ]</a> <a href='event:fold'>[ Fold ]</a>", auctions.currentBidder, 100, 100, 100, 100, nil, nil, 1, true)
end

function startTrade(party1, party2)
    tfm.exec.chatMessage(party2 .. " accepted the trade invitation!", party1)
    local tradeId = party1 .. "," .. party2
    local trade = Trade.new(tradeId, party1, party2)
    local p1HasJailFreeChance, p1HasJailFreeCommu = players[party1].hasJailFreeCards["chance"], players[party1].hasJailFreeCards["community chest"]
    local p2HasJailFreeChance, p2HasJailFreeCommu = players[party2].hasJailFreeCards["chance"], players[party2].hasJailFreeCards["community chest"]
    local p1CardTxt = party1 .. 
        ((p1HasJailFreeChance and "<a href='event:trade-jailFreeChance:" .. tradeId .. "'>" or "<N2>") .. "Get out of jail free (chance) " .. (p1HasJailFreeChance and "</a>" or "</N2>")) .. "|" .. 
        ((p1HasJailFreeCommu and "<a href='event:trade-jailFreeCommu:" .. tradeId .. "'>" or "<N2>") .. "Get out of jail free (commu)" .. (p1HasJailFreeCommu and "</a>" or "</N2>"))
    local p2CardTxt = party2 ..
        (p2HasJailFreeChance and "<a href='event:trade-jailFreeChance:" .. tradeId .. "'>" or "<N2>") .. "Get out of jail free (chance) " .. (p2HasJailFreeChance and "</a>" or "</N2>") .. "|" .. 
        (p2HasJailFreeCommu and "<a href='event:trade-jailFreeCommu:" .. tradeId .. "'>" or "<N2>") .. "Get out of jail free (commu)" .. (p2HasJailFreeCommu and "</a>" or "</N2>")
    for _, player in next, ({party1, party2}) do
        ui.addTextArea(200, "", player, 100, 60, 250, 200, nil, nil, 1, true)
        ui.addTextArea(201, "", player, 500, 60, 250, 200, nil, nil, 1, true)
        ui.addTextArea(202, "<a href='event:trade-submit:" .. tradeId .. "'>Submit</a>", player, 380, 60, 50, 30, nil, nil, 1, true)
        ui.addTextArea(203, "<a href='event:trade-cancel:" .. tradeId .. "'>Cancel</a>", player, 380, 100, 50, 30, nil, nil, 1, true)
        ui.addTextArea(204, "<a href='event:trade-addMoney:" .. tradeId .. "'>Money: $0</a>", player, 100, 300, 250, 30, nil, nil, 1, true)
        ui.addTextArea(205, "<a href='event:trade-addMoney:" .. tradeId .. "'>Money: $0</a>", player, 500, 300, 250, 30, nil, nil, 1, true)
        ui.addTextArea(206, player == party1 and p1CardTxt or p2CardTxt, player, 100, 300, 250, 50, nil, nil, 1, true)
        ui.addTextArea(207, player == party1 and p2CardTxt or p1CardTxt, player, 500, 300, 250, 50, nil, nil, 1, true)
    end
    trade:updateInterface()
end

function handleDice(name, die1, die2)
    --todo: refactor this function
    local total = die1 + die2
    ui.updateTextArea(10, die1)
    ui.updateTextArea(11, die2)

    if players[name].isInJail then
        if die1 == die2 then
            players[name].doubles = players[name].doubles + 1
            if players[name].doubles == 3 then
                players[name].doubles = 0
                players[name].isInJail = false
                players[name].current = 11 + die1 + die2
                players[name]:goTo(11 + die1 + die2)
                handleCloseBtn(15000, name)
            end
        else
            players[name].doubles = 0
            changeTurn()
            handleCloseBtn(15000, name)
        end
    else
        players[name].current = players[name].current + total
        --giving salary after passing one round
        if players[name].current > #lands then
            players[name].current = players[name].current - #lands
            players[name]:addMoney(2000)
        end

        if die1 == die2 then
            players[name].doubles = players[name].doubles + 1
            if players[name].doubles == 3 then
                return players[name]:goToJail()
            end
            players[name]:goTo(players[name].current, true)
        else
            players[name].doubles = 0
            players[name]:goTo(players[name].current)
        end
    end
end

function handleCloseBtn(id, name)
    if closeSequence[id] then
        for _, id in next, closeSequence[id] do
            ui.removeTextArea(id, name)
        end
    else
        ui.removeTextArea(id, name)
    end
end

function main()
    tfm.exec.newGame(lobby)
end

function eventChatCommand(name, cmd) -- test
    if cmd:sub(1, 1) == "g" then
        players[name]:goTo(tonumber(cmd:sub(2)))
    elseif cmd:sub(1, 1) == "r" then
        handleDice(name, tonumber(cmd:sub(2, 2)), tonumber(cmd:sub(3, 3)))
    elseif cmd == "t" then
        -- trade start
        local party1 = name
        local party2 = "Senirupasan#0000"
        Trade.handshakes[#Trade.handshakes + 1] = party1
        ui.addPopup(100000 + #Trade.handshakes, 1, party1 .. " wants to trade with you no.\nAccept?", party2, nil, nil, nil, true)
    elseif cmd == "test" then
        print(table.tostring(players[name]))
    elseif cmd == "p" then
        tfm.exec.chatMessage(table.tostring(players[name]), name)
    end
end

--==[[ events ]]==--

function eventNewGame()
    
    if gameStarted then
        --parsing the map's xml and getting the land points
        local mapDom = parseXml(map, true)
        local cloudId = tostring(tfm.enum.ground.cloud)
        for _, o in next, path(mapDom, "Z", "S", "S") do
            --getting normal land points
            if o.attribute.lua and o.attribute.T == cloudId then
                points[tonumber(o.attribute.lua) or o.attribute.lua] = {x = o.attribute.X, y = o.attribute.Y}
            elseif o.attribute.lua then  --getting house points
                local landId, houseId = o.attribute.lua:match("^(%d+)0(%d)$")
                landId = tonumber(landId)
                houseId = tonumber(houseId)
                if not housePoints[landId] then
                    housePoints[landId] = {[houseId] = {
                        x = o.attribute.X,
                        y = o.attribute.Y,
                        w = o.attribute.L,
                        h = o.attribute.H
                    }}
                else
                    housePoints[landId][houseId] = {
                        x = o.attribute.X,
                        y = o.attribute.Y,
                        w = o.attribute.L,
                        h = o.attribute.H
                    }
                end
            end
        end

        --initializing the players
        for name, player in next, tfm.get.room.playerList do
            players[name] = Player(name)
            --tfm.exec.killPlayer(name)
        end

        --initializing lands and cards
        initLands()
        initCards()

        --giving the turn to the first player
        changeTurn()
   
    else
        for _, _ in next, tfm.get.room.playerList do
            totalPlayers = totalPlayers + 1
        end
        if totalPlayers >= 2 then
            tfm.exec.chatMessage("Starting the game in 10 seconds...")
            Timer("start game", function()
                gameStarted = true
                tfm.exec.newGame(map)
                setUI()
                --todo: set this 10 seconds
            end, 4000 + 2000 --[[initial 2 seconds to load the map]], false)
        end
    end

end

function eventNewPlayer(name)
    totalPlayers = totalPlayers + 1
    if gameStarted then
        displayLands(name)
        setUI(name)
    elseif not gameStarted and totalPlayers >= 2 then
        tfm.exec.chatMessage("Starting the game in 10 seconds...")
        Timer("start game", function()
            gameStarted = true
            tfm.exec.newGame(map)
            setUI()
        end, 10000, false)
    end
end

function eventPlayerLeft(name)
    totalPlayers = totalPlayers - 1
end
function eventTextAreaCallback(id, name, evt)
    if evt == "roll" and name == currentPlayer then
        handleDice(name, math.random(1,6), math.random(1, 6))
    elseif evt == "close" then
        handleCloseBtn(id, name)
    elseif evt == "increaseBid" then
        auctions.bidders[name] = auctions.bidders[name] + 1
        ui.updateTextArea(13000, "Auctioning " .. lands[auctions.landId].name .."!\nPlace your bid\n" .. auctions.bidders[name] .. " <a href='event:increaseBid'>[ + ]</a>\n<a href='event:bid'>[ Bid ]</a> <a href='event:fold'>[ Fold ]</a>", name)
    elseif evt == "bid" then
        auctionLand(auctions.landId, auctions.bidders[name], name)
    elseif evt == "fold" then
        auctions.bidders[name] = nil
        auctions.totalBidders = auctions.totalBidders - 1
        if auctions.totalBidders == 1 then
            lands[auctions.landId]:setOwner(auctions.highestBidder, auctions.highest)
            auctions = nil
            if players[name].doubles == 0 then changeTurn() end
        end
        ui.removeTextArea(id)
    elseif evt == "incomeTaxFull" then
        players[name]:addMoney(-2000)
        handleCloseBtn(14000, name)
    elseif evt == "incomeTax10%" then
        local player = players[name]
        local tax = player:getTotalWorth() * 0.1
        player:addMoney(-tax)
        tfm.exec.chatMessage("Paid tax of worth " .. tax, name)
        handleCloseBtn(14000, name)
        --complex events
    elseif evt == "pay-prison" then
        players[name]:jailFree(evt)
    elseif evt == "jail-free-chance" then
        players[name]:jailFree(evt)
    elseif evt == "jail-free-comm" then
        players[name]:jailFree(evt)
    elseif evt:find("^.+:.+$") then
        local key, value = table.unpack(split(evt, ":"))
        --land info display event
        if key == "land" then
            showLandInfo(tonumber(value), name)
        --buy land evet
        elseif key == "buy" then
            lands[tonumber(value)]:setOwner(name)
            ui.removeTextArea(11000, name)
            ui.removeTextArea(11001, name)
            ui.removeTextArea(11002, name)
            if players[name].doubles == 0 then changeTurn() end
        elseif key == "addHouse" then
            local land = lands[tonumber(value)]
            if land.houses < 4 then
                land:addHouse()
            end
            showLandInfo(land.landIndex, name)
        elseif key == "addHotel" then
            local land = lands[tonumber(value)]
            land:addHotel()
            showLandInfo(land.landIndex, name)
        elseif key == "auction" then
            handleCloseBtn(id, name)
            auctionLand(tonumber(value), 0, name, true)
        elseif key == "breakHouse" then
            local land = lands[tonumber(value)]
            land:removeBuildings()
            players[land.owner]:addMoney(land.buildCost / 2)
            showLandInfo(land.landIndex, name)
        elseif key == "mortgage" then
            local land = lands[tonumber(value)]
            land:mortgage(true)
            showLandInfo(land.landIndex, name)
        elseif key == "unmortgage" then
            local land = lands[tonumber(value)]
            land:mortgage(false)
            showLandInfo(land.landIndex, name)
        elseif key == "trade-cancel" then
            Trade.trades[value]:close(name)
        elseif key == "trade-addLand" then
            Trade.trades[players[name].tradeID]:addLand(name, tonumber(value))
        elseif key == "trade-submit" then
            Trade.trades[value]:submit(name)
        elseif key == "trade-addMoney" then
            ui.addPopup(400, 2, "Specify the amount", name, nil, nil, nil, true)
        elseif key == "trade-jailFreeChance" then
            Trade.trades[value]:addCard(name, "Chance")
        elseif key == "trade-jailFreeCommu" then
            Trade.trades[value]:addCard(name, "Commu")
        end
    end
end

function eventPopupAnswer(id, name, answer)
    if id >= 300 and id <= 350 then -- unmortgage popup on trade
        local landID = id - 300
            local land = lands[landID]
            print(land.name)
        if answer == "yes" then
            land:mortgage(false)
        else
            players[name]:addMoney(-(land.price / 2 * 0.1))
        end
    elseif id == 400 then -- cash transaction popup
        print("cash transaction")
        Trade.trades[players[name].tradeID]:addMoney(name, tonumber(answer))
    elseif id >= 100000 then -- trade agreements/handshakes
        print("trade handshake")
        local tradeId = id - 100000
        local party1 = Trade.handshakes[tradeId]
        local party2 = name
        startTrade(party1, party2)
    end
end
function eventLoop(tc, tr)
    Timer.process()
end

main()
