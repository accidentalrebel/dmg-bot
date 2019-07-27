import nimpy
import os
from osproc import execCmdEx
from strutils import replace

let webvtt = pyImport("webvtt")
let py = pyBuiltinsModule()    

const outputPath = "./data/sub"
const outputExt = ".en.vtt"

let fileName = paramStr(1)
let youtubeUrl = paramStr(2)

var youtubeDlCmd: string = "youtube-dl --write-auto-sub --sub-lang en --skip-download --get-title -o " & outputPath & ".vtt " & youtubeUrl
echo "Cmd: " & youtubeDlCmd

let (title, errorCode) = execCmdEx(youtubeDlCmd)
echo "Title: " & title

let file = open("./output/" & fileName & ".txt", fmWrite)

let lines = webvtt.read(outputPath & outputExt)
var line: string;

for i in countup(1, py.len(lines).to(int) - 1, 2):
  line = lines[i].text.to(string)
  line = replace(line,"\n","")
  file.writeLine(line)

file.close()
