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
            "src/map.xml"
        ],
        prefix: "local map = [[",
        suffix: "]]\n",
        compressFunction: (chunk) => vkbeauty.xmlmin(chunk)
        
    },
    lobby: {
        files: [
            "src/lobby.xml"
        ],
        prefix: "local lobby = [[",
        suffix: "]]\n",
        compressFunction: (chunk) => vkbeauty.xmlmin(chunk)
    },
    libs: {
        files: [
            "src/init.lua",
            "libs/timers4tfm.lua",
            "libs/Card.lua",
            "libs/Chance.lua",
            "libs/Player.lua",
            "libs/Land.lua",
            "libs/utils.lua"
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
            "src/events/eventLoop.lua",
        ]
    }
    
}).then((res) => {
    console.log("\x1b[1m\x1b[32m%s\x1b[0m", "Build completed!")
})


