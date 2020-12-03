#!/usr/bin/bash
PATH="/home/masterdesky/Documents/GitHub/ELTE_Info_Com_Mod_2021/practice/data/"
INPUT="${1:-www.elte.hu}"
OUTPUT="${2:-${INPUT//./_}.txt}"

echo "Writing files to $PATH$OUTPUT"

/usr/bin/ping -D -i 1 -s 32 "$INPUT" |& /usr/bin/tee "$PATH$OUTPUT"
