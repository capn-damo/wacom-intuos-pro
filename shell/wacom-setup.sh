#!/bin/bash
#
# Script to be run from udev rule when connecting Wacom Intuos Pro Graphics Tablet
# <damo>, February 2016

# If tablet is connected when the system is started, then run from autostart with: 
#    "/usr/local/bin/wacom-setup.sh --user &"

COUNT=6
FOUND=

if [[ $1 = "--user" ]];then           # script has been started from autostart as $USER
    /usr/local/bin/wacom-keys.sh && exit
fi 

while (( $COUNT > 0 ));do 
    if  [ -e /sys/bus/usb/devices/*/*/wacom_led/status_led0_select ];then 
        FOUND=1
        break
   else 
        echo "Waiting for Wacom LED file...$COUNT" 
        sleep 1s
   fi
   COUNT=$((COUNT-1))
done

if (( $FOUND ));then 
    chown 1000:1000 /sys/bus/usb/devices/*/*/wacom_led/status_led0_select 
    echo "Wacom LED's activated"    # make LED state writeable by $USER
else 
    echo "LED File was not found for 6 seconds, exiting..." 2>&1
fi

exit
