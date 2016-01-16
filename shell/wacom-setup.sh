#!/bin/bash

COUNT=10
FOUND=0
while [ $COUNT -gt 0 ];do 
    if [ -f /sys/bus/usb/devices/*/*/wacom_led/status_led0_select ];then
        FOUND=1
        break
    else
        echo "File does not exist yet, waiting..."
        sleep 1s
    fi
    COUNT=$((COUNT-1))
done

if [ $FOUND = 1 ];then
    chown 1000:1000 /sys/bus/usb/devices/*/*/wacom_led/status_led0_select
else
    echo "File was not found for 10 seconds, exiting..."
fi

