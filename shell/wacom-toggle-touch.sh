#!/bin/bash
#
# Script to toggle Touch state of Wacom Intuos Pro
# Bound to Alt-F12 on keyboard by default. Edit wacom-keys.sh if this is changed
#
# <damo>, February 2016

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

if [ -e /sys/bus/usb/devices/*/*/wacom_led/status_led0_select ];then 
    TOUCH=$(xsetwacom list dev | grep -o ".*touch")
    STATE=$(xsetwacom get "$TOUCH" Touch)
    
    if [[ $STATE = "on" ]];then
        STATE="off"
    else 
        STATE="on"
    fi
        
    xsetwacom set "$TOUCH" Touch "$STATE"                    # Toggle touch
        
    echo "Wacom tablet: Touch $STATE"
    notify-send "Wacom Tablet" "Touch $STATE" --icon=dialog-information -u normal
else
    echo "Wacom tablet: Tablet not connected" 2>&1
fi

exit
