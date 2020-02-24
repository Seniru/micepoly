--[[ libs ]]--



local a="[%a_:][%w%.%-_:]*"function parseXml(b,c)if not c then b=string.gsub(b,"<!%[CDATA%[(.-)%]%]>",xmlEscape)b=string.gsub(b,"<%?.-%?>","")b=string.gsub(b,"<!%-%-.-%-%->","")b=string.gsub(b,"<!.->","")end;local d={}local e={}local f=d;for g,h,i,j,k in string.gmatch(b,"<(/?)("..a..")(.-)(/?)>%s*([^<]*)%s*")do if g=="/"then local l=e[f]if l and h==f.name then f=l end else local m={name=h,attribute={}}table.insert(f,m)e[m]=f;if j~="/"then f=m end;for h,n in string.gmatch(i,"("..a..")%s*=%s*\"(.-)\"")do m.attribute[h]=c and n or xmlUnescape(n)end end;if k~=""then local m={text=c and k or xmlUnescape(k)}table.insert(f,m)e[m]=f end end;return d[1]end;function generateXml(f,c)if f.name then local b="<"..f.name;for h,n in pairs(f.attribute)do b=b.." "..h.."=\""..(c and tostring(n)or xmlEscape(tostring(n))).."\""end;if#f==0 then b=b.." />"else b=b..">"for o,m in ipairs(f)do b=b..generateXml(m,c)end;b=b.."</"..f.name..">"end;return b elseif f.text then return c and tostring(f.text)or xmlEscape(tostring(f.text))end end;function path(p,...)p={p}for o,h in ipairs(arg)do local q={}for o,r in ipairs(p)do for o,m in ipairs(r)do if m.name==h then table.insert(q,m)end end end;p=q end;return p end;local s={}function xmlEscape(t)local u=s[t]if not u then local v=string.gsub;u=v(t,"&","&amp;")u=v(u,"\"","&quot;")u=v(u,"'","&apos;")u=v(u,"<","&lt;")u=v(u,">","&gt;")s[t]=u end;return u end;local w={}function xmlUnescape(t)local u=w[t]if not u then local v=string.gsub;u=v(t,"&quot;","\"")u=v(u,"&apos;","'")u=v(u,"&lt;","<")u=v(u,"&gt;",">")u=v(u,"&#(%d%d?%d?%d?);",dec2char)u=v(u,"&#x(%x%x?%x?%x?);",hex2char)u=v(u,"&amp;","&")w[t]=u end;return u end;function dec2char(x)x=tonumber(x)return string.char(x>255 and 0 or x)end;function hex2char(x)x=tonumber(x,16)return string.char(x>255 and 0 or x)end


--[[ events ]]--

print('new game')
print('hello world')

