const combine = require("./combine")
const luamin = require("luamin")
const vkbeauty = require("vkbeautify")

combine({
    libs: {
        files: [
            "libs/Land.lua",
            "libs/Player.lua",
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
    main: {
        files: [
            "src/main.lua"
        ]
    },
    events: {
        files: [
            "src/events/eventNewGame.lua",
            "src/events/eventNewPlayer.lua"
        ]
    }
    
}).then((res) => {
    console.log("\x1b[1m\x1b[32m%s\x1b[0m", "Build completed!")
})


