# DMG Bot
A nim script that downloads the auto-generated subtitles of Youtube videos and saves them into a file. 

## Overview
This script downloads and lightly cleans up the auto-generated subtitles from Youtube videos. No effort is made to correct the subtitles, they are just downloaded as is. It also automatically parses the video's title and adds necessary information to the output file.

This script was made for fun and I primarily use it to download episodes of the Good Trades Brigade podcast. It's name is DMG Bot because it can only take damage and not give back.

## Dependencies
### Nim Dependencies

* [nimpy](https://github.com/yglukhov/nimpy)

### Python Dependencies

* [webvtt-py](https://pypi.org/project/webvtt-py/)
