#!/bin/bash
#
# Wacom Intuos Pro Graphics Tablet
# If first-run, sets configuration and exits, else switches mode and changes LED
# Bound to Control-F12 on keyboard by default. Edit wacom-keys.sh if this is changed
#
# <damo>, February 2016


CONTROL=$(ls /sys/bus/usb/devices/*/*/wacom_led/status_led0_select)
PAD=$(xsetwacom list dev | grep -o ".*pad")

if [ ! -f "$CONTROL" ];then 
    echo "Wacom tablet does not appear to be attached." 2>&1
    notify-send "Wacom Tablet" "Tablet not connected!" --icon=dialog-information -u normal
    exit 1
else
    BTN=$(xsetwacom get "$PAD" Button 1)
    if [[ ${BTN#* } = "+1 " ]];then     # Button is default, so keys and ring not yet set.
        /usr/local/bin/wacom-keys.sh
        exit
    fi
fi

MODE=$(cat $CONTROL)
echo "Current mode is $MODE" 2>&1
MODE=$(( (MODE+1)%4 ))
echo "Setting mode to $MODE" 2>&1

echo $MODE > "$CONTROL"     # Write to LED state file, which lights the relevant LED

/usr/local/bin/wacom-ring-mode.sh $MODE
