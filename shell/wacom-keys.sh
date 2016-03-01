#!/bin/bash
#
# Script to set keys and ring, by <damo>, February 2016
# 
# Wacom Intuos Pro ExpressKeys
#
# 2
# 3
# 8
# 9
# Center: button 1; wheel up/down
# 10
# 11
# 12
# 13
#
# xsetwacom --list parameters
# xsetwacom --list modifiers
#
# Get current settings with:    xsetwacom get "$PAD" all
#
########################################################
#export DISPLAY=:0
#export XAUTHORITY=/home/damo/.Xauthority

if [ -e /sys/bus/usb/devices/*/*/wacom_led/status_led0_select ];then 
    PAD=$(xsetwacom list dev | grep -o ".*pad")
    STYLUS=$(xsetwacom list dev | grep -o ".*stylus")
    TOUCH=$(xsetwacom list dev | grep -o ".*touch")
    
    xsetwacom set "$PAD" Button 2 "key ="               # GIMP zoom in, ">"
    xsetwacom set "$PAD" Button 3 "key -"               # GIMP zoom out,"<"
    xsetwacom set "$PAD" Button 8 "key o"               # GIMP color picker
    xsetwacom set "$PAD" Button 9 "key p"               # GIMP brush
    
    ##xsetwacom set "$PAD" Button 1 "key shift ctrl j"    # GIMP fit image in window
    xsetwacom set "$PAD" Button 1 "key ctrl F12"    # Run wacom-switch-mode.sh, bound to Control-F12 key
    
    xsetwacom set "$PAD" Button 10 "key shift"
    xsetwacom set "$PAD" Button 11 "key ctrl"
    xsetwacom set "$PAD" Button 12 "key alt"
    xsetwacom set "$PAD" Button 13 "key alt F12"    # Run wacom-toggle-touch.sh, bound to Alt-F12 key
    
    xsetwacom set "$PAD" AbsWheelUp "key shift ."       # GIMP increase value x2
    xsetwacom set "$PAD" AbsWheelDown "key shift ,"     # GIMP decrease value x2
    
    xsetwacom set "$TOUCH" Touch off                    # Disable touch
    
    echo "Wacom tablet: Settings loaded"
    notify-send "Wacom Tablet" "Settings loaded" --icon=dialog-information -u normal
else
    notify-send "Wacom Tablet" "Tablet not connected!" --icon=dialog-information -u normal
    echo "Wacom tablet: Tablet not connected" 2>&1
fi

exit
