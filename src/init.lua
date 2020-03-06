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
    ["magneta"] = {11, 14, 15},
    ["orange"] = {17, 19, 20},
    ["red"] = {22, 24, 25},
    ["yellow"] = {27, 28, 30},
    ["green"] = {32, 33, 35},
    ["dark blue"] = {38, 40}
}
