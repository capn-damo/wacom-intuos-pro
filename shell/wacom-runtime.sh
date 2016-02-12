#!/bin/bash

logfile="/var/log/wacom"
> "$logfile"

COUNT=10
FOUND=
while (( $COUNT > 0 ));do 
    if  [ -e /sys/bus/usb/devices/*/*/wacom_led/status_led0_select ];then 
        FOUND=1
        break
   else 
        echo "Wacom LED file does not exist yet, waiting..." >> "$logfile"
        sleep 1s
   fi
   COUNT=$((COUNT-1))
done

if (( $FOUND ));then 
    chmod -v a+rw /sys/bus/usb/devices/*/*/wacom_led/status_led0_select >> "$logfile"
    echo "Wacom LED's activated" >> "$logfile"
    exit
else 
    echo "LED File was not found for 10 seconds, exiting..." >> "$logfile"
fi

exit
