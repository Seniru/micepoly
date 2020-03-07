function eventChatCommand(name, cmd)
    if cmd:sub(1, 1) == "g" then
        players[name]:goTo(tonumber(cmd:sub(2)))
    end
end

--[[--==[[ exlibs ]]==--

local a="Makinit's XML library"local b="[%a_:][%w%.%-_:]*"function parseXml(c,d)if not d then c=string.gsub(c,"<!%[CDATA%[(.-)%]%]>",xmlEscape)c=string.gsub(c,"<%?.-%?>","")c=string.gsub(c,"<!%-%-.-%-%->","")c=string.gsub(c,"<!.->","")end;local e={}local f={}local g=e;for h,i,j,k,l in string.gmatch(c,"<(/?)("..b..")(.-)(/?)>%s*([^<]*)%s*")do if h=="/"then local m=f[g]if m and i==g.name then g=m end else local n={name=i,attribute={}}table.insert(g,n)f[n]=g;if k~="/"then g=n end;for i,o in string.gmatch(j,"("..b..")%s*=%s*\"(.-)\"")do n.attribute[i]=d and o or xmlUnescape(o)end end;if l~=""then local n={text=d and l or xmlUnescape(l)}table.insert(g,n)f[n]=g end end;return e[1]end;function generateXml(g,d)if g.name then local c="<"..g.name;for i,o in pairs(g.attribute)do c=c.." "..i.."=\""..(d and tostring(o)or xmlEscape(tostring(o))).."\""end;if#g==0 then c=c.." />"else c=c..">"for p,n in ipairs(g)do c=c..generateXml(n,d)end;c=c.."</"..g.name..">"end;return c elseif g.text then return d and tostring(g.text)or xmlEscape(tostring(g.text))end end;function path(q,...)q={q}for p,i in ipairs(arg)do local r={}for p,s in ipairs(q)do for p,n in ipairs(s)do if n.name==i then table.insert(r,n)end end end;q=r end;return q end;local t={}function xmlEscape(u)local v=t[u]if not v then local w=string.gsub;v=w(u,"&","&amp;")v=w(v,"\"","&quot;")v=w(v,"'","&apos;")v=w(v,"<","&lt;")v=w(v,">","&gt;")t[u]=v end;return v end;local x={}function xmlUnescape(u)local v=x[u]if not v then local w=string.gsub;v=w(u,"&quot;","\"")v=w(v,"&apos;","'")v=w(v,"&lt;","<")v=w(v,"&gt;",">")v=w(v,"&#(%d%d?%d?%d?);",dec2char)v=w(v,"&#x(%x%x?%x?%x?);",hex2char)v=w(v,"&amp;","&")x[u]=v end;return v end;function dec2char(y)y=tonumber(y)return string.char(y>255 and 0 or y)end;function hex2char(y)y=tonumber(y,16)return string.char(y>255 and 0 or y)end

--==[[ map ]]==--

local map = [[<C><P /><Z><S><S X="334" Y="344" T="0" L="546" H="44" P="0,0,0.3,0.2,0,0,0,0" /><S X="80" Y="183" T="0" L="79" H="369" P="0,0,0.3,0.2,0,0,0,0" /><S X="336" Y="22" T="0" L="546" H="44" P="0,0,0.3,0.2,0,0,0,0" /><S X="594" Y="179" T="0" L="77" H="366" P="0,0,0.3,0.2,0,0,0,0" /><S X="398" L="806" Y="417" H="30" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="397" L="806" Y="-73" H="30" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="67" L="16" Y="208" H="490" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="667" L="16" Y="208" H="490" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="127" L="16" Y="208" H="490" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="426" L="16" Y="212" H="490" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="486" L="16" Y="212" H="490" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="547" L="16" Y="208" H="490" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="607" L="16" Y="208" H="490" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="336" L="665" Y="40" H="16" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="338" L="657" Y="200" H="16" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="307" L="16" Y="210" H="490" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="367" L="16" Y="208" H="490" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="187" L="16" Y="210" H="490" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="247" L="16" Y="208" H="490" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="338" L="661" Y="81" H="16" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="335" L="667" Y="160" H="16" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="336" L="665" Y="120" H="16" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="340" L="657" Y="244" H="16" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="337" L="662" Y="284" H="16" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="336" L="664" Y="324" H="16" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="337" L="659" Y="364" H="16" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="344" L="535" Y="182" H="295" P="0,0,0.3,0.2,0,0,0,0" T="16" /><S X="638" m="" lua="1" L="10" Y="387" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="458" m="" lua="28" L="10" Y="-20" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="399" m="" L="10" Y="388" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" lua="5" /><S X="216" m="" lua="24" L="10" Y="-21" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="517" m="" L="10" Y="387" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" lua="3" /><S X="337" m="" lua="26" L="10" Y="-20" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="578" m="" L="10" Y="387" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" lua="2" /><S X="398" m="" lua="27" L="10" Y="-20" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="337" m="" L="10" Y="389" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" lua="6" /><S X="156" m="" lua="23" L="10" Y="-19" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="456" m="" L="10" Y="386" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" lua="4" /><S X="276" m="" lua="25" L="10" Y="-21" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="275" m="" L="10" Y="388" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" lua="7" /><S X="95" m="" lua="22" L="10" Y="-19" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="157" m="" L="10" Y="386" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" lua="9" /><S X="37" m="" L="10" Y="21" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" lua="20" /><S X="218" m="" L="10" Y="388" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" lua="8" /><S X="36" m="" lua="21" L="10" Y="-21" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="97" m="" lua="10" L="10" Y="386" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="38" m="" lua="19" L="10" Y="58" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="39" m="" lua="18" L="10" Y="98" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="516" m="" lua="29" L="10" Y="-22" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="37" m="" lua="14" L="10" Y="267" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="638" m="" lua="33" L="10" Y="62" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="37" m="" lua="17" L="10" Y="144" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="578" m="" lua="30" L="10" Y="-21" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="37" m="" lua="13" L="10" Y="306" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="638" m="" lua="34" L="10" Y="101" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="37" m="" lua="16" L="10" Y="184" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="638" m="" lua="31" L="10" Y="-21" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="36" m="" lua="12" L="10" Y="346" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="638" m="" lua="35" L="10" Y="141" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="37" m="" lua="15" L="10" Y="223" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="638" m="" lua="32" L="10" Y="18" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="37" m="" lua="11" L="10" Y="385" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="638" m="" lua="36" L="10" Y="180" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="5" L="17" Y="182" H="452" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="336" L="665" Y="1" H="16" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="336" L="665" Y="-42" H="16" P="0,0,0.3,0.2,0,0,0,0" T="0" /><S X="638" m="" lua="39" L="10" Y="306" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="638" m="" lua="40" L="10" Y="344" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="638" m="" lua="37" L="10" Y="222" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="638" m="" lua="38" L="10" Y="261" H="10" P="0,0,0.3,0.2,0,0,0,0" T="8" /><S X="559" Y="344" T="4" L="12" H="21" P="0,0,20,0.2,0,0,0,0" m="" lua="201" /><S X="432" Y="344" T="4" L="12" H="21" P="0,0,20,0.2,0,0,0,0" m="" lua="401" /><S X="266" Y="344" T="4" L="12" H="21" P="0,0,20,0.2,0,0,0,0" m="" lua="701" /><S X="140" Y="344" T="4" L="12" H="21" P="0,0,20,0.2,0,0,0,0" m="" lua="901" /><S X="73" Y="344" T="4" L="12" H="21" P="0,0,20,0.2,0,0,0,0" m="" lua="1001" /><S X="77" Y="17" T="4" L="12" H="21" P="0,0,20,0.2,0,0,0,0" m="" lua="2204" /><S X="197" Y="17" T="4" L="12" H="21" P="0,0,20,0.2,0,0,0,0" m="" lua="2404" /><S X="260" Y="17" T="4" L="12" H="21" P="0,0,20,0.2,0,0,0,0" m="" lua="2504" /><S X="374" Y="17" T="4" L="12" H="21" P="0,0,20,0.2,0,0,0,0" m="" lua="2704" /><S X="435" Y="17" T="4" L="12" H="21" P="0,0,20,0.2,0,0,0,0" m="" lua="2804" /><S X="555" Y="17" T="4" L="12" H="21" P="0,0,20,0.2,0,0,0,0" m="" lua="3004" /><S X="574" Y="343" T="4" L="12" H="20" P="0,0,20,0.2,0,0,0,0" m="" lua="202" /><S X="447" Y="343" T="4" L="12" H="20" P="0,0,20,0.2,0,0,0,0" m="" lua="402" /><S X="281" Y="343" T="4" L="12" H="20" P="0,0,20,0.2,0,0,0,0" m="" lua="702" /><S X="155" Y="343" T="4" L="12" H="20" P="0,0,20,0.2,0,0,0,0" m="" lua="902" /><S X="88" Y="344" T="4" L="12" H="20" P="0,0,20,0.2,0,0,0,0" m="" lua="1002" /><S X="92" Y="16" T="4" L="12" H="20" P="0,0,20,0.2,0,0,0,0" m="" lua="2203" /><S X="212" Y="16" T="4" L="12" H="20" P="0,0,20,0.2,0,0,0,0" m="" lua="2403" /><S X="275" Y="16" T="4" L="12" H="20" P="0,0,20,0.2,0,0,0,0" m="" lua="2503" /><S X="389" Y="16" T="4" L="12" H="20" P="0,0,20,0.2,0,0,0,0" m="" lua="2703" /><S X="450" Y="16" T="4" L="12" H="20" P="0,0,20,0.2,0,0,0,0" m="" lua="2803" /><S X="570" Y="16" T="4" L="12" H="20" P="0,0,20,0.2,0,0,0,0" m="" lua="3003" /><S X="587" Y="344" T="4" L="11" H="21" P="0,0,20,0.2,0,0,0,0" m="" lua="203" /><S X="460" Y="344" T="4" L="11" H="21" P="0,0,20,0.2,0,0,0,0" m="" lua="403" /><S X="294" Y="344" T="4" L="11" H="21" P="0,0,20,0.2,0,0,0,0" m="" lua="703" /><S X="168" Y="344" T="4" L="11" H="21" P="0,0,20,0.2,0,0,0,0" m="" lua="903" /><S X="101" Y="344" T="4" L="11" H="21" P="0,0,20,0.2,0,0,0,0" m="" lua="1003" /><S X="105" Y="17" T="4" L="11" H="21" P="0,0,20,0.2,0,0,0,0" m="" lua="2202" /><S X="225" Y="17" T="4" L="11" H="21" P="0,0,20,0.2,0,0,0,0" m="" lua="2402" /><S X="288" Y="17" T="4" L="11" H="21" P="0,0,20,0.2,0,0,0,0" m="" lua="2501" /><S X="402" Y="17" T="4" L="11" H="21" P="0,0,20,0.2,0,0,0,0" m="" lua="2702" /><S X="463" Y="17" T="4" L="11" H="21" P="0,0,20,0.2,0,0,0,0" m="" lua="2802" /><S X="583" Y="17" T="4" L="11" H="21" P="0,0,20,0.2,0,0,0,0" m="" c="4" lua="3002" /><S X="601" Y="345" T="4" L="13" H="23" P="0,0,20,0.2,0,0,0,0" m="" lua="204" /><S X="474" Y="345" T="4" L="13" H="23" P="0,0,20,0.2,0,0,0,0" m="" lua="404" /><S X="308" Y="345" T="4" L="13" H="23" P="0,0,20,0.2,0,0,0,0" m="" lua="704" /><S X="182" Y="345" T="4" L="13" H="23" P="0,0,20,0.2,0,0,0,0" m="" lua="904" /><S X="115" Y="345" T="4" L="13" H="23" P="0,0,20,0.2,0,0,0,0" m="" lua="1004" /><S X="119" Y="18" T="4" L="13" H="23" P="0,0,20,0.2,0,0,0,0" m="" lua="2201" /><S X="239" Y="18" T="4" L="13" H="23" P="0,0,20,0.2,0,0,0,0" m="" lua="2401" /><S X="302" Y="18" T="4" L="13" H="23" P="0,0,20,0.2,0,0,0,0" m="" lua="2501" /><S X="416" Y="18" T="4" L="13" H="23" P="0,0,20,0.2,0,0,0,0" m="" lua="2701" /><S X="477" Y="18" T="4" L="13" H="23" P="0,0,20,0.2,0,0,0,0" m="" lua="2801" /><S X="597" Y="18" T="4" L="13" H="23" P="0,0,20,0.2,0,0,0,0" m="" lua="3001" /><S X="53" Y="11" T="4" L="25" H="10" P="0,0,20,0.2,0,0,0,0" m="" lua="2001" /><S X="57" Y="51" T="4" L="25" H="10" P="0,0,20,0.2,0,0,0,0" m="" lua="1901" /><S X="59" Y="125" T="4" L="25" H="10" P="0,0,20,0.2,0,0,0,0" m="" lua="1701" /><S X="57" Y="326" T="4" L="25" H="10" P="0,0,20,0.2,0,0,0,0" m="" lua="1201" /><S X="62" Y="247" T="4" L="25" H="10" P="0,0,20,0.2,0,0,0,0" m="" lua="1401" /><S X="58" Y="202" T="4" L="25" H="10" P="0,0,20,0.2,0,0,0,0" m="" lua="1501" /><S X="626" Y="327" T="4" L="25" H="10" P="0,0,20,0.2,0,0,0,0" m="" lua="4004" /><S X="623" Y="249" T="4" L="25" H="10" P="0,0,20,0.2,0,0,0,0" m="" lua="3804" /><S X="622" Y="9" T="4" L="25" H="10" P="0,0,20,0.2,0,0,0,0" m="" lua="3204" /><S X="623" Y="51" T="4" L="25" H="10" P="0,0,20,0.2,0,0,0,0" m="" lua="3304" /><S X="621" Y="120" T="4" L="25" H="10" P="0,0,20,0.2,0,0,0,0" m="" lua="3504" /><S X="53" Y="21" T="4" L="26" H="10" P="0,0,20,0.2,0,0,0,0" m="" lua="2002" /><S X="57" Y="61" T="4" L="26" H="10" P="0,0,20,0.2,0,0,0,0" m="" lua="1902" /><S X="59" Y="135" T="4" L="26" H="10" P="0,0,20,0.2,0,0,0,0" m="" lua="1702" /><S X="57" Y="336" T="4" L="26" H="10" P="0,0,20,0.2,0,0,0,0" m="" lua="1202" /><S X="62" Y="257" T="4" L="26" H="10" P="0,0,20,0.2,0,0,0,0" m="" lua="1402" /><S X="58" Y="212" T="4" L="26" H="10" P="0,0,20,0.2,0,0,0,0" m="" lua="1502" /><S X="626" Y="337" T="4" L="26" H="10" P="0,0,20,0.2,0,0,0,0" m="" lua="4003" /><S X="623" Y="259" T="4" L="26" H="10" P="0,0,20,0.2,0,0,0,0" m="" lua="3803" /><S X="622" Y="19" T="4" L="26" H="10" P="0,0,20,0.2,0,0,0,0" m="" lua="3203" /><S X="623" Y="61" T="4" L="26" H="10" P="0,0,20,0.2,0,0,0,0" m="" lua="3303" /><S X="621" Y="130" T="4" L="26" H="10" P="0,0,20,0.2,0,0,0,0" m="" lua="3503" /><S X="54" Y="30" T="4" L="26" H="10" P="0,0,20,0.2,0,0,0,0" m="" lua="2003" /><S X="58" Y="70" T="4" L="26" H="10" P="0,0,20,0.2,0,0,0,0" m="" lua="1903" /><S X="60" Y="144" T="4" L="26" H="10" P="0,0,20,0.2,0,0,0,0" m="" lua="1703" /><S X="58" Y="345" T="4" L="26" H="10" P="0,0,20,0.2,0,0,0,0" m="" lua="1203" /><S X="63" Y="266" T="4" L="26" H="10" P="0,0,20,0.2,0,0,0,0" m="" lua="1403" /><S X="59" Y="221" T="4" L="26" H="10" P="0,0,20,0.2,0,0,0,0" m="" lua="1503" /><S X="627" Y="346" T="4" L="26" H="10" P="0,0,20,0.2,0,0,0,0" m="" lua="4002" /><S X="624" Y="268" T="4" L="26" H="10" P="0,0,20,0.2,0,0,0,0" m="" lua="3802" /><S X="623" Y="28" T="4" L="26" H="10" P="0,0,20,0.2,0,0,0,0" m="" lua="3202" /><S X="624" Y="70" T="4" L="26" H="10" P="0,0,20,0.2,0,0,0,0" m="" lua="3302" /><S X="622" Y="139" T="4" L="26" H="10" P="0,0,20,0.2,0,0,0,0" m="" lua="3502" /><S X="52" Y="41" T="4" L="25" H="11" P="0,0,20,0.2,0,0,0,0" m="" lua="2004" /><S X="56" Y="81" T="4" L="25" H="11" P="0,0,20,0.2,0,0,0,0" m="" lua="1904" /><S X="58" Y="155" T="4" L="25" H="11" P="0,0,20,0.2,0,0,0,0" m="" lua="1704" /><S X="56" Y="356" T="4" L="25" H="11" P="0,0,20,0.2,0,0,0,0" m="" lua="1204" /><S X="61" Y="277" T="4" L="25" H="11" P="0,0,20,0.2,0,0,0,0" m="" lua="1404" /><S X="57" Y="232" T="4" L="25" H="11" P="0,0,20,0.2,0,0,0,0" m="" lua="1504" /><S X="625" Y="357" T="4" L="25" H="11" P="0,0,20,0.2,0,0,0,0" m="" lua="4001" /><S X="622" Y="279" T="4" L="25" H="11" P="0,0,20,0.2,0,0,0,0" m="" lua="3801" /><S X="621" Y="39" T="4" L="25" H="11" P="0,0,20,0.2,0,0,0,0" m="" lua="3201" /><S X="622" Y="81" T="4" L="25" H="11" P="0,0,20,0.2,0,0,0,0" m="" lua="3301" /><S X="620" Y="150" T="4" L="25" H="11" P="0,0,20,0.2,0,0,0,0" m="" lua="3501" /></S><D><DS X="757" Y="380" /></D><O /><L /></Z></C>]]

--==[[ lobby ]]==--

local lobby = [[<C><P /><Z><S><S X="401" Y="396" T="0" L="804" H="20" P="0,0,0.3,0.2,0,0,0,0" /></S><D><DS X="399" Y="368" /><P X="63" Y="384" T="19" C="8A311B" P="0,0" /><P X="147" Y="380" T="19" C="8A311B" P="0,0" /><P X="237" Y="372" T="19" C="8A311B" P="0,0" /><P X="319" Y="378" T="19" C="8A311B" P="0,0" /><P X="483" Y="378" T="19" C="8A311B" P="0,0" /><P X="577" Y="378" T="19" C="8A311B" P="0,0" /><P X="669" Y="378" T="19" C="8A311B" P="0,0" /><P X="763" Y="380" T="19" C="8A311B" P="0,0" /></D><O /><L /></Z></C>]]

--==[[ libs ]]==--

--game variables
local points, housePoints, players, lands, chances, communityChests = {}, {}, {}, {}, {}, {}
local gameStarted = false
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

--Timers4TFm
local a={}a.__index=a;a._timers={}a._init=false;a._clock=0;setmetatable(a,{__call=function(b,...)return b.new(...)end})function a.init(c)if not a._init then a._init=true;a._clock=c end end;function a.process(d)a._clock=d;for e,f in next,a._timers do if f:isAlive()and f:getMatureTime()<=a._clock then f:call()if f.loop then f:reset()else f:kill()end end end end;function a.run(d)a.init(d)a.process(d)end;function a.new(g,h,i,j,...)local self=setmetatable({},a)self.id=g;self.callback=h;self.timeout=i;self.mature=a._clock+i;self.loop=j;self.args={...}self.alive=true;a._timers[g]=self;return self end;function a:getId()return self.id end;function a:getTimeout()return self.timeout end;function a:isLooping()return self.loop end;function a:getMatureTime()return self.mature end;function a:isAlive()return self.alive end;function a:setCallback(k)self.callback=k end;function a:addTime(c)self.mature=self.mature+c end;function a:setLoop(j)self.loop=j end;function a:setArgs(...)self.args={...}end;function a:call()self.callback(table.unpack(self.args))end;function a:kill()self.alive=false;self=nil end;function a:reset()self.mature=a._clock+self.timeout end;Timer=a

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
            ui.addTextArea(11000, "Buy or Auction? --Auction not supported--", self.name, 300, 100, 100, 100, nil, nil, 1, true)
            ui.addTextArea(11001, "<a href='event:buy:" .. landObj.landIndex .. "'>Buy</a>", self.name, 300, 250, 50, 50, nil, nil, 1, true)
            --todo: Implement the bid functionality and change the link text
            ui.addTextArea(11002, "<a href='event:buy:" .. landObj.landIndex .. "'>Auction</a>", self.name, 360, 250, 50, 50, nil, nil, 1, true)
        else
            local rent = landObj:getRent()
            self:addMoney(-rent)
            players[landObj.owner]:addMoney(rent)
            changeTurn()
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
        ui.addTextArea(1000000 + self.landIndex, "<a href='event:addHouse:" .. self.landIndex .. "'>[ + ]</a>", owner, self.locX, self.locY, 20, 20, nil, nil, 0.5, true)
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
    --todo: refactor this nested shit
    if self.hasHotel then
        print("have built everything!")
        return false
    else
        if building == "house" then
            for cat, land in next, landCategories[self.color] do
                local land = lands[land]
                if land.landIndex ~= self.landIndex then
                    if land.owner ~= self.owner or (land.houses < self.houses) then
                        print("owners are not matching or other lands dont have much")
                        return false
                    end
                end
            end
            print("passed")
            return true
        elseif building == "hotel" then
            if self.houses < 4 then
                --print("not enough houses")
                return false

            else
                local can = true
                for cat, land in next, landCategories[self.color] do
                    local land = lands[land]
                    if land.hasHotel then
                        return true
                    elseif land.houses ~= 4 then
                        can = false
                    end
                end
                return can  
            end
        end
    end
end

--[[@abstract method]]--
function Land:onLand(player, ...) 
    return false
end

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
            --todo: implement this correctly after building the true jail
            player:goTo(11)
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
            tfm.exec.chatMessage("Like our post in forum\nLink: https://123456.com")
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
            player:addMoney(2500
        )
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
            --todo: implement this correctly after building the true jail
            player:goTo(11)
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
        end)
        --todo: Add the get out of the jail card after implementing the jail and related featuress
    }

    --shuffling the cards
    shuffle(chances)
    shuffle(communityChests)

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
    lands[29] = Land{29, "Fraises Factory", price = 1500, color = "factory", landRent = 4, houseRents = {10}, isSpecial = true}
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
    lands[40] = Land{40, "Temple", price = 4000, color = "dark blue", landRent = 500, houseRents = {2000, 6000, 14000, 17000}, hotelRent = 20000, buildCost = 2000}
    
    local chanceFn = function(land, player)
        local curr = currentChance
        local next = getNext(chances, curr)
        chances[next]:action(player, land)
        ui.addTextArea(12000, "Chance: " .. chances[next].header .. "<br>" .. chances[next].description, player.name, 200, 200, 200, 50, nil, nil, 1, true)
        currentChance = next
    end

    local commChestFn = function(land, player)
        local curr = currentCommunitychest
        local next = getNext(communityChests, curr)
        communityChests[next]:action(player, land)
        ui.addTextArea(12000, "Community Chest: " .. communityChests[next].header .. "<br>" .. communityChests[next].description, player.name, 200, 200, 200, 50, nil, nil, 1, true)
        currentCommunitychest = next
    end
    
    --overriding the behaviours of special lands

    lands[3].onLand = function(self, player) --community chest
        commChestFn(self, player)
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

    lands[34].onLand = function(self, player) --community chest
        commChestFn(self, player)
    end

    lands[37].onLand = function(self, player) --chance
        chanceFn(self, player)
    end

    displayLands()
    
end

function displayLands(target)
    for id, land in next, lands do
        ui.addTextArea(1000 + id, "<a href='event:land:" .. id .. "'><b>" .. land.name .. "</b></a>", target, land.locX - 20, land.locY - 10, 60, 30, nil, nil, 0, true)
    end
end

function changeTurn()
    local curr = currentPlayer
    local next = getNext(players, currentPlayer)
    ui.updateTextArea(12, "<N2>Roll!</N2>", curr)
    ui.updateTextArea(12, "<a href='event:roll'>Roll!</a>", next)
    currentPlayer = next
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
        ui.addTextArea(10003, "Mortgage", target, 400, 330, 60, 40, nil, nil, 1, true)
        ui.addTextArea(10004, "Sell", target, 460, 330, 60, 40, nil, nil, 1, true)
    end
end

function handleCloseBtn(id, name)
    local closeSequence = {
        [10000] = {10000, 10001, 10002, 10003, 10004, 1000}
    }
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

function eventChatCommand(name, cmd)
    if cmd:sub(1, 1) == "g" then
        players[name]:goTo(tonumber(cmd:sub(2)))
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
                points[tonumber(o.attribute.lua)] = {x = o.attribute.X, y = o.attribute.Y}
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
            end, 4000, false)
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
    --dice rolling event
    if evt == "roll" and name == currentPlayer then
        local die1 = math.random(1, 6)
        local die2 = math.random(1, 6)
        local total = die1 + die2
        ui.updateTextArea(10, die1)
        ui.updateTextArea(11, die2)
        players[name].current = players[name].current + total
        if players[name].current > 40 then
            players[name].current = players[name].current - 40
            players[name]:addMoney(2000)
        end
        players[name]:goTo(players[name].current)
        print(tostring(players[name]))
    elseif evt == "close" then
        handleCloseBtn(id, name)
        --complex events
    elseif evt:find("^%w+:%w+$") then
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
            changeTurn()
        elseif key == "addHouse" then
            local land = lands[tonumber(value)]
            if land.houses < 4 then
                land:addHouse()
            end
        elseif key == "addHotel" then
            local land = lands[tonumber(value)]
            land:addHotel()
        end
    end
end

function eventLoop(tc, tr)
    Timer.run(tc)
end

main()
]]