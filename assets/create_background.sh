#!/bin/bash

file="$1"
filename=$(basename -- "$file")
extension="${filename##*.}"
filename="${filename%.*}"

convert "./wallpapers/$filename.$extension" -blur 0x14 "./backgrounds/temp-$filename.$extension"
convert -brightness-contrast -32x-32 "./backgrounds/temp-$filename.$extension" "./backgrounds/$filename.$extension"
rm "./backgrounds/temp-$filename.$extension"
