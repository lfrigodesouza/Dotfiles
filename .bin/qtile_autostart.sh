#!/bin/sh
picom -b -f &
blueberry-tray & > /dev/null
nitrogen --restore
~/.bin/screen_layout.sh > /dev/null
pcmanfm -d &
