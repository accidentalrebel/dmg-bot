import nimpy
import os
import re
from osproc import execCmdEx
import strutils

let webvtt = pyImport("webvtt")
let py = pyBuiltinsModule()    

const outputPath = "./data/sub"
const outputExt = ".en.vtt"

let youtubeUrl = paramStr(1)

var youtubeDlCmd: string = "youtube-dl --write-auto-sub --sub-lang en --skip-download --get-title -o " & outputPath & ".vtt " & youtubeUrl
echo "Cmd: " & youtubeDlCmd

let (title, errorCode) = execCmdEx(youtubeDlCmd)
discard errorCode

echo "Title: [" & title & "]"
var filename = title[0 ..< title.find(" - ")]
filename = filename.toLowerAscii()
filename = filename.replace(re"[^a-zA-Z0-9]", "-")
echo "Filename: [" & filename & "]"

let file = open("./output/" & filename & ".txt", fmWrite)
file.writeLine(title)
file.writeLine("==============================")
file.writeLine("https://www.patreon.com/goodtradesbrigade/posts")
file.writeLine("==============================\n")

let lines = webvtt.read(outputPath & outputExt)
var line: string;
    
for i in countup(1, py.len(lines).to(int) - 1, 2):
  line = lines[i].text.to(string)
  line = replace(line,"\n","")
  file.writeLine(line)

file.close()

