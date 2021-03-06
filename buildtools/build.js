const combine = require("./combine")
const luamin = require("luamin")
const vkbeauty = require("vkbeautify")

combine({
    exlibs: {
        files: [
            "libs/xmllib.lua"
        ],
        compressFunction: (chunk) => luamin.minify(chunk)
    },
    map: {
        files: [
            "src/maps/map.xml"
        ],
        prefix: "local map = [[",
        suffix: "]]\n",
        compressFunction: (chunk) => vkbeauty.xmlmin(chunk)
        
    },
    lobby: {
        files: [
            "src/maps/lobby.xml"
        ],
        prefix: "local lobby = [[",
        suffix: "]]\n",
        compressFunction: (chunk) => vkbeauty.xmlmin(chunk)
    },
    libs: {
        files: [
            "libs/utils.lua",
            "src/init.lua",
            "libs/timers4tfm.lua",
            "libs/Card.lua",
            "libs/Chance.lua",
            "libs/CommunityChest.lua",
            "libs/Player.lua",
            "libs/Land.lua",
            "libs/Trade.lua"
        ]
    },
    main: {
        files: [
            "src/main.lua"
        ]
    },
    events: {
        files: [
            "src/events/eventNewGame.lua",
            "src/events/eventNewPlayer.lua",
            "src/events/eventPlayerLeft.lua",
            "src/events/eventTextAreaCallback.lua",
            "src/events/eventPopupAnswer.lua",
            "src/events/eventLoop.lua",
        ]
    }
    
}).then((res) => {
    console.log("\x1b[1m\x1b[32m%s\x1b[0m", "Build completed!")
})


