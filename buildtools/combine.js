const fs = require("fs")

const OUTPUT_FILE_LOC = "./main.lua"

module.exports = (segments) => {
    return new Promise((resolve, reject) => {
        let writer = fs.createWriteStream(OUTPUT_FILE_LOC)
        
        console.log("\x1b[1m\x1b[32m%s\x1b[0m", "Combining and Writing files...");
        
        writer.once("open", (fd) => {
            
            for (let type of Object.keys(segments)) {
                writer.write(`--[[ ${type} ]]--\n\n`)
                for (let filePath of segments[type]) {
                    console.log(`\x1b[93mWriting ${filePath}`)
                    writer.write(fs.readFileSync(`./${filePath}`) + "\n")
                }
                writer.write("\n")
            }

            writer.end()
            console.log("\x1b[1m\x1b[32m%s\x1b[0m", "Succesfully wrote the file!")
            resolve(true)
        })
    })
}