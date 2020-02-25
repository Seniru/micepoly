--==[[ exlibs ]]==--

local a="Makinit's XML library"local b="[%a_:][%w%.%-_:]*"function parseXml(c,d)if not d then c=string.gsub(c,"<!%[CDATA%[(.-)%]%]>",xmlEscape)c=string.gsub(c,"<%?.-%?>","")c=string.gsub(c,"<!%-%-.-%-%->","")c=string.gsub(c,"<!.->","")end;local e={}local f={}local g=e;for h,i,j,k,l in string.gmatch(c,"<(/?)("..b..")(.-)(/?)>%s*([^<]*)%s*")do if h=="/"then local m=f[g]if m and i==g.name then g=m end else local n={name=i,attribute={}}table.insert(g,n)f[n]=g;if k~="/"then g=n end;for i,o in string.gmatch(j,"("..b..")%s*=%s*\"(.-)\"")do n.attribute[i]=d and o or xmlUnescape(o)end end;if l~=""then local n={text=d and l or xmlUnescape(l)}table.insert(g,n)f[n]=g end end;return e[1]end;function generateXml(g,d)if g.name then local c="<"..g.name;for i,o in pairs(g.attribute)do c=c.." "..i.."=\""..(d and tostring(o)or xmlEscape(tostring(o))).."\""end;if#g==0 then c=c.." />"else c=c..">"for p,n in ipairs(g)do c=c..generateXml(n,d)end;c=c.."</"..g.name..">"end;return c elseif g.text then return d and tostring(g.text)or xmlEscape(tostring(g.text))end end;function path(q,...)q={q}for p,i in ipairs(arg)do local r={}for p,s in ipairs(q)do for p,n in ipairs(s)do if n.name==i then table.insert(r,n)end end end;q=r end;return q end;local t={}function xmlEscape(u)local v=t[u]if not v then local w=string.gsub;v=w(u,"&","&amp;")v=w(v,"\"","&quot;")v=w(v,"'","&apos;")v=w(v,"<","&lt;")v=w(v,">","&gt;")t[u]=v end;return v end;local x={}function xmlUnescape(u)local v=x[u]if not v then local w=string.gsub;v=w(u,"&quot;","\"")v=w(v,"&apos;","'")v=w(v,"&lt;","<")v=w(v,"&gt;",">")v=w(v,"&#(%d%d?%d?%d?);",dec2char)v=w(v,"&#x(%x%x?%x?%x?);",hex2char)v=w(v,"&amp;","&")x[u]=v end;return v end;function dec2char(y)y=tonumber(y)return string.char(y>255 and 0 or y)end;function hex2char(y)y=tonumber(y,16)return string.char(y>255 and 0 or y)end

--==[[ map ]]==--

local map = [[<C><P /><Z><S><S X="398" L="806" Y="417" H="30" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="397" L="806" Y="-73" H="30" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="67" L="16" Y="208" H="490" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="667" L="16" Y="208" H="490" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="127" L="16" Y="208" H="490" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="426" L="16" Y="212" H="490" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="486" L="16" Y="212" H="490" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="547" L="16" Y="208" H="490" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="607" L="16" Y="208" H="490" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="336" L="665" Y="40" H="16" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="338" L="657" Y="200" H="16" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="307" L="16" Y="210" H="490" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="367" L="16" Y="208" H="490" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="187" L="16" Y="210" H="490" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="247" L="16" Y="208" H="490" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="338" L="661" Y="81" H="16" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="335" L="667" Y="160" H="16" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="336" L="665" Y="120" H="16" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="340" L="657" Y="244" H="16" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="337" L="662" Y="284" H="16" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="336" L="664" Y="324" H="16" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="337" L="659" Y="364" H="16" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="341" L="538" Y="189" H="367" P="0,0,0.3,0.2,0,0,0,0" T="16" /><S X="638" m="" lua="1" L="10" Y="387" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="458" m="" lua="28" L="10" Y="-20" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="399" m="" L="10" Y="388" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" lua="5" /><S X="216" m="" lua="24" L="10" Y="-21" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="517" m="" L="10" Y="387" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" lua="3" /><S X="337" m="" lua="26" L="10" Y="-20" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="578" m="" L="10" Y="387" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" lua="2" /><S X="398" m="" lua="27" L="10" Y="-20" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="337" m="" L="10" Y="389" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" lua="6" /><S X="156" m="" lua="23" L="10" Y="-19" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="456" m="" L="10" Y="386" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" lua="4" /><S X="276" m="" lua="25" L="10" Y="-21" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="275" m="" L="10" Y="388" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" lua="7" /><S X="95" m="" lua="22" L="10" Y="-19" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="157" m="" L="10" Y="386" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" lua="9" /><S X="37" m="" L="10" Y="21" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" lua="20" /><S X="218" m="" L="10" Y="388" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" lua="8" /><S X="36" m="" lua="21" L="10" Y="-21" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="97" m="" lua="10" L="10" Y="386" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="38" m="" lua="19" L="10" Y="58" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="39" m="" lua="18" L="10" Y="98" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="516" m="" lua="29" L="10" Y="-22" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="37" m="" lua="14" L="10" Y="267" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="638" m="" lua="33" L="10" Y="62" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="37" m="" lua="17" L="10" Y="144" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="578" m="" lua="30" L="10" Y="-21" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="37" m="" lua="13" L="10" Y="306" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="638" m="" lua="34" L="10" Y="101" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="37" m="" lua="16" L="10" Y="184" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="638" m="" lua="31" L="10" Y="-21" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="36" m="" lua="12" L="10" Y="346" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="638" m="" lua="35" L="10" Y="141" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="37" m="" lua="15" L="10" Y="223" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="638" m="" lua="32" L="10" Y="18" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="37" m="" lua="11" L="10" Y="385" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="638" m="" lua="36" L="10" Y="180" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="5" L="17" Y="182" H="452" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="336" L="665" Y="1" H="16" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="336" L="665" Y="-42" H="16" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="638" m="" lua="39" L="10" Y="306" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="638" m="" lua="40" L="10" Y="344" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="638" m="" lua="37" L="10" Y="222" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="638" m="" lua="38" L="10" Y="261" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /></S><D><DS X="757" Y="380" /></D><O /><L /></Z></C>]]

--==[[ lobby ]]==--

local lobby = [[<C><P /><Z><S><S X="401" Y="396" T="0" L="804" H="20" P="0,0,0.3,0.2,0,0,0,0" /></S><D><DS X="399" Y="368" /><P X="63" Y="384" T="19" C="8A311B" P="0,0" /><P X="147" Y="380" T="19" C="8A311B" P="0,0" /><P X="237" Y="372" T="19" C="8A311B" P="0,0" /><P X="319" Y="378" T="19" C="8A311B" P="0,0" /><P X="483" Y="378" T="19" C="8A311B" P="0,0" /><P X="577" Y="378" T="19" C="8A311B" P="0,0" /><P X="669" Y="378" T="19" C="8A311B" P="0,0" /><P X="763" Y="380" T="19" C="8A311B" P="0,0" /></D><O /><L /></Z></C>]]

--==[[ libs ]]==--

--game variables
local points, players, lands = {}, {}, {}

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
    tfm.exec.movePlayer(self.name, points[land].x, points[land].y, false)
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

function Land.new(name, price, color, landIndex, isSpecial)
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
    self.locX = points[landIndex].x
    self.locY = points[landIndex].y
    return self
end

function Land:removeOwner(owner)
    self.owner = nil
end

function Land:setOwner(owner)
    if owner then
        error(self.name .. " already has an owner")
    end
    self.owner = owner
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


--==[[ main ]]==--

--disabling unwanted room settings
tfm.exec.disableAutoNewGame()
tfm.exec.disableAutoTimeLeft()
tfm.exec.disableAfkDeath()


function initLands()

    -- configuring the lands
    lands[1] = Land("Go", nil, nil, 1, true)
    lands[2] = Land("Buffy`s Residence", 600, "purple", 2)
    lands[3] = Land("Community Chest", nil, nil, 3, true)
    lands[4] = Land("Transformice Museum", 600, "purple", 4)
    lands[5] = Land("Income Tax", nil, nil, 5, true)
    lands[6] = Land("Shaman`s Teleporter", 2000, "teleporter", 6)
    lands[7] = Land("801 Town", 1000, "light blue", 7)
    lands[8] = Land("Chance", nil, nil, 8, true)
    lands[9] = Land("Grim`s Mansion", 1000, "light blue", 9)
    lands[10] = Land("Nuremberg", 1200, "light blue", 10)
    lands[11] = Land("Jail", nil, nil, 11, true)
    lands[12] = Land("Jingle`s abode", 1400, "magenta", 12)
    lands[13] = Land("Cheese factory", 1500, "factory", 13)
    lands[14] = Land("Salvador", 1400, "magenta", 14)
    lands[15] = Land("Charlotte`s Tree Stump", 1600, "magenta", 15)
    lands[16] = Land("Cheese Hole Teleporter", 2000, "teleporter", 16)
    lands[17] = Land("King Fromagnus`s Castle", 1800, "orange", 17)
    lands[18] = Land("Community Chest", nil, nil, 18, true)
    lands[19] = Land("Land of Dream", 1800, "orange", 19)
    lands[20] = Land("Garden of Roses", 2000, "orange", 20)
    lands[21] = Land("Free Parking", nil, nil, 21, true)
    lands[22] = Land("Ol` Souris", 2200, "red", 22)
    lands[23] = Land("Chance", nil, nil, 23, true)
    lands[24] = Land("Cheze Gustave", 2200, "red", 24)
    lands[25] = Land("Konomouse", 2400, "red", 25)
    lands[26] = Land("Elisah`s Teleporter", 2000, "teleporter", 26)
    lands[27] = Land("Kürbisses-Nacht Streets", 2600, "yellow", 27)
    lands[28] = Land("Kürbisses-Nacht Attic", 2600, "yellow", 28)
    lands[29] = Land("Fraises Factory", 1500, "factory", 29)
    lands[30] = Land("Kürbisses-Nacht Graveyard", 2800, "yellow", 30)
    lands[31] = Land("Go to Jail", nil, nil, 31, true)
    lands[32] = Land("Amazonia", 3000, "green", 32)
    lands[33] = Land("Antic Jungle", 3000, "green", 33)
    lands[34] = Land("Community Chest", nil, nil, 34, true)
    lands[35] = Land("Crystal Jungle", 3000, "green", 35)
    lands[36] = Land("Portal Teleporter", 2000, "teleporter", 36)
    lands[37] = Land("Chance", nil, nil, 37, true)
    lands[38] = Land("Haunted Library", 3500, "dark blue", 38)
    lands[39] = Land("Super Tax", nil, nil, 39, true)
    lands[40] = Land("Temple", 4000, "dark blue", 40)
    
    --overriding the behaviours of special lands
    lands[1].onLand = function(self, player)
        player.money = player.money + 2000
    end
    
    displayLands()
    
end

function displayLands(target)
    for id, land in next, lands do
        ui.addTextArea(1000 + id, "<b>" .. land.name .. "</b>", target, land.locX - 20, land.locY - 10, 60, 30, nil, nil, 0, true)
    end
end

function main()
    tfm.exec.newGame(map)
end


--==[[ events ]]==--

function eventNewGame()
    
    --parsing the map's xml and getting the land points
    local mapDom = parseXml(map, true)
    for _, o in next, path(mapDom, "Z", "S", "S") do
        if o.attribute.lua then
            points[tonumber(o.attribute.lua)] = {x = o.attribute.X, y = o.attribute.Y}
        end
    end

    --initializing the players
    for name, player in next, tfm.get.room.playerList do
        players[name] = Player(name) 
    end

    --initializing the lands
    initLands()

end

function eventNewPlayer(name)
    displayLands(name)
end


main()
