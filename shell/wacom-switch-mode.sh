#!/bin/bash

CONTROL=$(ls /sys/bus/usb/devices/*/*/wacom_led/status_led0_select)
PAD=$(xsetwacom list dev | grep -o ".*pad")

if [ ! -f "$CONTROL" ];then 
    echo "Wacom tablet does not appear to be attached."
    exit 1
else
    BTN=$(xsetwacom get "$PAD" Button 1)
    echo "$BTN"
    if [[ ${BTN#* } = "+1 " ]];then
        /usr/local/bin/wacom-keys.sh
        exit
    fi
fi

MODE=$(cat $CONTROL)
echo "Current mode is $MODE"
MODE=$(( (MODE+1)%4 ))
echo "Setting mode to $MODE"

echo $MODE > "$CONTROL"

/usr/local/bin/wacom-ring-mode.sh $MODE
