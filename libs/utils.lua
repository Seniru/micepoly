function split(s, delimiter)
    result = {};
    for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
        table.insert(result, match);
    end
    return result;
end

function shuffle(tbl)
    math.randomseed(os.time())
    for i = 1, #tbl do
        local j = math.random(i)
        tbl[i], tbl[j] = tbl[j], tbl[i]
    end
end
