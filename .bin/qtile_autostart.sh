#!/bin/sh
picom -b &
bluetoothctl power on > /dev/null
nitrogen --restore
