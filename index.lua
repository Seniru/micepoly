--==[[ libs ]]==--



local a="Makinit's XML library"local b="[%a_:][%w%.%-_:]*"function parseXml(c,d)if not d then c=string.gsub(c,"<!%[CDATA%[(.-)%]%]>",xmlEscape)c=string.gsub(c,"<%?.-%?>","")c=string.gsub(c,"<!%-%-.-%-%->","")c=string.gsub(c,"<!.->","")end;local e={}local f={}local g=e;for h,i,j,k,l in string.gmatch(c,"<(/?)("..b..")(.-)(/?)>%s*([^<]*)%s*")do if h=="/"then local m=f[g]if m and i==g.name then g=m end else local n={name=i,attribute={}}table.insert(g,n)f[n]=g;if k~="/"then g=n end;for i,o in string.gmatch(j,"("..b..")%s*=%s*\"(.-)\"")do n.attribute[i]=d and o or xmlUnescape(o)end end;if l~=""then local n={text=d and l or xmlUnescape(l)}table.insert(g,n)f[n]=g end end;return e[1]end;function generateXml(g,d)if g.name then local c="<"..g.name;for i,o in pairs(g.attribute)do c=c.." "..i.."=\""..(d and tostring(o)or xmlEscape(tostring(o))).."\""end;if#g==0 then c=c.." />"else c=c..">"for p,n in ipairs(g)do c=c..generateXml(n,d)end;c=c.."</"..g.name..">"end;return c elseif g.text then return d and tostring(g.text)or xmlEscape(tostring(g.text))end end;function path(q,...)q={q}for p,i in ipairs(arg)do local r={}for p,s in ipairs(q)do for p,n in ipairs(s)do if n.name==i then table.insert(r,n)end end end;q=r end;return q end;local t={}function xmlEscape(u)local v=t[u]if not v then local w=string.gsub;v=w(u,"&","&amp;")v=w(v,"\"","&quot;")v=w(v,"'","&apos;")v=w(v,"<","&lt;")v=w(v,">","&gt;")t[u]=v end;return v end;local x={}function xmlUnescape(u)local v=x[u]if not v then local w=string.gsub;v=w(u,"&quot;","\"")v=w(v,"&apos;","'")v=w(v,"&lt;","<")v=w(v,"&gt;",">")v=w(v,"&#(%d%d?%d?%d?);",dec2char)v=w(v,"&#x(%x%x?%x?%x?);",hex2char)v=w(v,"&amp;","&")x[u]=v end;return v end;function dec2char(y)y=tonumber(y)return string.char(y>255 and 0 or y)end;function hex2char(y)y=tonumber(y,16)return string.char(y>255 and 0 or y)end

--==[[ map ]]==--

local map = [[<C><P /><Z><S><S X="398" L="806" Y="417" H="30" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="400" L="806" Y="1" H="30" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="0" L="16" Y="208" H="400" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="600" L="16" Y="208" H="400" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="60" L="16" Y="208" H="400" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="360" L="16" Y="212" H="400" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="420" L="16" Y="212" H="400" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="480" L="16" Y="208" H="400" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="540" L="16" Y="208" H="400" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="300" L="602" Y="40" H="16" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="298" L="602" Y="200" H="16" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="240" L="16" Y="210" H="400" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="300" L="16" Y="208" H="400" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="120" L="16" Y="210" H="400" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="180" L="16" Y="208" H="400" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="300" L="602" Y="80" H="16" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="300" L="602" Y="160" H="16" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="300" L="602" Y="120" H="16" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="300" L="602" Y="244" H="16" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="300" L="602" Y="284" H="16" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="300" L="602" Y="324" H="16" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="298" L="602" Y="364" H="16" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="299" L="488" Y="205" H="334" P="0,0,0.3,0.2,0,0,0,0" T="16" /><S X="573" m="" lua="1" L="10" Y="387" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="507" m="" lua="2" L="10" Y="387" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="447" m="" lua="3" L="10" Y="386" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="390" m="" lua="4" L="10" Y="386" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /></S><D><DS X="757" Y="380" /></D><O /><L /></Z></C>]]

--==[[ main ]]==--

--disabling unwanted room settings
tfm.exec.disableAutoNewGame()
tfm.exec.disableAutoTimeLeft()

--game variables
local points

function main()
    points = {}
    tfm.exec.newGame(map)
end


--==[[ events ]]==--

function eventNewGame()
    local mapDom = parseXml(map, true)
    for _, o in next, path(mapDom, "Z", "S", "S") do
        if o.attribute.lua then
            points[tonumber(o.attribute.lua)] = {x = o.attribute.X, y = o.attribute.Y}
        end
    end
end

function eventNewPlayer(name)

end

main()
