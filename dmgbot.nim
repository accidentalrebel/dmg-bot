import nimpy
from strutils import replace

let webvtt = pyImport("webvtt")

let lines = webvtt.read("sub.vtt")
for i in countup(1, 200, 2):
  var line: string = lines[i].text.to(string)
  echo replace(line,"\n","")
