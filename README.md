##Scripts to configure and manage Wacom Intuos Pro graphics tablet

This is a set of scripts to set up and customize Wacom Intuos Pro tablets under
Linux/X11/udev.  Original ideas taken from *https://github.com/portnov/wacom-intuos-pro-scripts*

###Features:

* Hotplug usb tablet, with udev rule
* Support of Intuos Pro's feature of having up to 4 modes of "express ring"
  operations.  LEDs on the tablet are switched accordingly to selected mode.

###Files:

* udev directory:
  * **80-wacom.rules** - Udev rules file. Note that for models other than Intuos Pro M, you will
    need to change idProduct parameter. Enables unprivileged-user write access, running 
    wacom-runtime.sh.
    Install to */etc/udev/rules.d/*

* shell scripts: Install to /usr/bin/ or /usr/local/bin/ for example.

  * **wacom-runtime.sh** - Sets up wacom_led for user write access
  * **wacom-keys.sh** - Configures Intuos Pro Express keys and ring
                    This is run with a keybind (default is Control-F12) initially, after
                    hotplugging. Subsequently can be run with the centre button (Button 1).
                    It could also be run from autostart at login, if the device is attached
                    at boot.
  * **wacom-switch-mode.sh** - Shell script which toggles ring mode: 0 -> 1 -> 2 ->
    3 -> 0 ...  This script just toggles LED on the tablet and runs the next
    script.
  * **wacom-ring-mode.sh** - Shell script which assigns actions to tablet ring
    touches, according to selected mode. This script can switch only between 4
    predefined modes (bindings are hardcoded in the script). 
  * **wacom-toggle-touch.sh** - Shell script to toggle Touch on/off.
                            This is run with a keybind (default is Alt-F12), or by bottom button
