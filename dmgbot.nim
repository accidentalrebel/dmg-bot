import nimpy
import os
from strutils import replace

var youtubeDlCmd: string = "youtube-dl --write-auto-sub --sub-lang en --skip-download -o ./data/sub " & paramStr(1)
discard execShellCmd(youtubeDlCmd)

let webvtt = pyImport("webvtt")

let lines = webvtt.read("./data/sub.en.vtt")
for i in countup(1, 200, 2):
  var line: string = lines[i].text.to(string)
  echo replace(line,"\n","")
