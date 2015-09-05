#!/bin/bash
# shell script to prepend i3status with more stuff

i3status | (read line && echo $line && read line && echo $line && while :
do
    read line
    sed -e "s/WLAN0_USAGE/`~/.i3/wlan0-usage.sh`/" <<< "$line" || exit 1
done)
