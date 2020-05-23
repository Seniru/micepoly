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
        [200] = {200, 201, 202, 203, 204, 205},
        [10000] = {10000, 10001, 10002, 10003, 10004, 10005},
        [11002] = {11000, 11001, 11002},
        [14000] = {14000, 14001, 14002},
        [15000] = {15000, 15001, 15002, 15003, 15004}
    }

local auctions
