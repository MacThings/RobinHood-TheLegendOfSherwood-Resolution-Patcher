#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 width height"
    exit 0
fi

ofs=260 # first save
#ofs=0xd5e # second save
x=$1
y=$2
filename="$HOME/Desktop/robinhood/Profiles"

if [ -f "$filename" ]; then
    #read file
    rf=($(dd if="$filename" bs=4 skip="$ofs" count=2 2>/dev/null | od -An -tf))
    echo "Savegame Offset 0x$ofs, Resolution was ${rf[0]}x${rf[1]}"

    #write file
    printf "%f\n%f\n" "$x" "$y" | dd of="$filename" bs=4 seek="$ofs" count=2 conv=notrunc 2>/dev/null
    echo "Resolution set to ${x}x${y}"
else
    echo "File $filename not found. Make sure you have a savefile in ~/Desktop/robinhood/Profiles"
fi

