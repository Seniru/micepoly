const combine = require("./combine")

combine({
    libs: [
        "libs/Land.lua",
        "libs/Player.lua",
        "libs/xmllib.lua"
    ],
    events: [
        "src/events/eventNewGame.lua",
        "src/events/eventNewPlayer.lua"
    ]
    
}).then((res) => {
    console.log("\x1b[1m\x1b[32m%s\x1b[0m", "Build completed!")
})


