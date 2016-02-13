#!/bin/bash
#
# Script to be run from udev rule when connecting Wacom Intuos Pro Graphics Tablet
# <damo>, February 2016

# If tablet is connected when the system is started, then run from autostart with: 
#    "/usr/local/bin/wacom-runtime.sh --user &"

COUNT=6
FOUND=
RUN=

if [[ $1 = "--user" ]];then           # script has been started from autostart as $USER
    RUN=1
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
    if ! [[ $RUN = 1 ]];then
        chmod -v a+rw /sys/bus/usb/devices/*/*/wacom_led/status_led0_select 
        echo "Wacom LED's activated"    # make LED state writeable by $USER
    fi
else 
    echo "LED File was not found for 6 seconds, exiting..." 2>&1
fi

if [[ $RUN = 1 ]];then           # set Wacom Intuos Pro ExpressKeys and Ring
    /usr/local/bin/wacom-keys.sh 2>&1
fi

exit
