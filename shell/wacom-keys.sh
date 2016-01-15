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
# Get current settings with:    xsetwacom get "$_PAD" all
#

_PAD=$(xsetwacom list dev | grep -o ".*pad")
_STYLUS=$(xsetwacom list dev | grep -o ".*stylus")
_TOUCH=$(xsetwacom list dev | grep -o ".*touch")

xsetwacom set "$_PAD" Button 2 "key ="               # GIMP zoom in, ">"
xsetwacom set "$_PAD" Button 3 "key -"               # GIMP zoom out,"<"
xsetwacom set "$_PAD" Button 8 "key o"               # GIMP color picker
xsetwacom set "$_PAD" Button 9 "key p"               # GIMP brush

#xsetwacom set "$_PAD" Button 1 "key shift ctrl j"    # GIMP fit image in window
xsetwacom set "$_PAD" Button 1 "key F12"    # Run script bound to F12 key

xsetwacom set "$_PAD" Button 10 "key shift"
xsetwacom set "$_PAD" Button 11 "key ctrl"
xsetwacom set "$_PAD" Button 12 "key alt"
xsetwacom set "$_PAD" Button 13 "key ctrl z"         # GIMP undo

xsetwacom set "$_PAD" AbsWheelUp "key shift ."       # GIMP increase value x2
xsetwacom set "$_PAD" AbsWheelDown "key shift ,"     # GIMP decrease value x2

xsetwacom set "$_TOUCH" Touch off                    # Disable touch

echo "Touch is off" >> $HOME/tmp/tmp.txt
