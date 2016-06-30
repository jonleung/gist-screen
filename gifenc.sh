#!/bin/sh


# From http://blog.pkh.me/p/21-high-quality-gif-with-ffmpeg.html#usage

palette="/tmp/palette.png"

filters="fps=15,scale=320:-1:flags=lanczos"

ffmpeg -v warning -i $1 -vf "$filters,palettegen" -y $palette
ffmpeg -v warning -i $1 -r 15 -i $palette -lavfi "$filters [x]; [x][1:v] paletteuse" -r 15 -y $2
