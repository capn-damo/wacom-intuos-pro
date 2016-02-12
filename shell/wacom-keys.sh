#!/bin/bash

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

PAD=$(xsetwacom list dev | grep -o ".*pad")
STYLUS=$(xsetwacom list dev | grep -o ".*stylus")
TOUCH=$(xsetwacom list dev | grep -o ".*touch")

xsetwacom set "$PAD" Button 2 "key ="               # GIMP zoom in, ">"
xsetwacom set "$PAD" Button 3 "key -"               # GIMP zoom out,"<"
xsetwacom set "$PAD" Button 8 "key o"               # GIMP color picker
xsetwacom set "$PAD" Button 9 "key p"               # GIMP brush

##xsetwacom set "$PAD" Button 1 "key shift ctrl j"    # GIMP fit image in window
xsetwacom set "$PAD" Button 1 "key ctrl F12"    # Run script bound to F12 key

xsetwacom set "$PAD" Button 10 "key shift"
xsetwacom set "$PAD" Button 11 "key ctrl"
xsetwacom set "$PAD" Button 12 "key alt"
xsetwacom set "$PAD" Button 13 "key ctrl z"         # GIMP undo

xsetwacom set "$PAD" AbsWheelUp "key shift ."       # GIMP increase value x2
xsetwacom set "$PAD" AbsWheelDown "key shift ,"     # GIMP decrease value x2

xsetwacom set "$TOUCH" Touch off                    # Disable touch

notify-send "Wacom Tablet" "Settings loaded" --icon=dialog-information -u normal

exit
