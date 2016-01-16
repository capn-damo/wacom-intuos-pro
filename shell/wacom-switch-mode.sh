#!/bin/bash

CONTROL=$(ls /sys/bus/usb/devices/*/*/wacom_led/status_led0_select)

if [ ! -f "$CONTROL" ];then 
    echo "Wacom tablet does not appear to be attached."
    exit 1
fi

MODE=$(cat $CONTROL)
echo "Current mode is $MODE"
MODE=$(( (MODE+1)%4 ))
echo "Setting mode to $MODE"

echo $MODE > "$CONTROL"

wacom-ring-mode.sh $MODE
