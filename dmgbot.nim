import nimpy
import os
from strutils import replace

const outputPath = "./data/sub"
const outputExt = ".en.vtt"

var youtubeDlCmd: string = "youtube-dl --write-auto-sub --sub-lang en --skip-download -o " & outputPath & ".vtt " & paramStr(1)
echo "Cmd: " & youtubeDlCmd

discard execShellCmd(youtubeDlCmd)

let webvtt = pyImport("webvtt")

let lines = webvtt.read(outputPath & outputExt)
# for i in countup(1, 200, 2):
#   var line: string = lines[i].text.to(string)
#   echo replace(line,"\n","")
