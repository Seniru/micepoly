const combine = require("./combine")

combine({
    libs: {
        files: [
            "libs/Land.lua",
            "libs/Player.lua",
            "libs/xmllib.lua"
        ],
    },
    map: {
        files: [
            "src/map.xml"
        ],
        prefix: "local map = [[",
        suffix: "]]\n",
        compressFunction: (chunk) => chunk.replace(/[\n\t\s]+/g, " ")

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


