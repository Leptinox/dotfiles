#!/bin/bash

unset x y w h
eval $(xwininfo -id $(xdotool getactivewindow) |
    sed -n -e "s/^ \+Absolute upper-left X: \+\([0-9]\+\).*/x=\1/p" \
           -e "s/^ \+Absolute upper-left Y: \+\([0-9]\+\).*/y=\1/p" \
           -e "s/^ \+Width: \+\([0-9]\+\).*/w=\1/p" \
           -e "s/^ \+Height: \+\([0-9]\+\).*/h=\1/p" )

let a=1920/2-w/2
let b=1080/2-h/2

wmctrl -r :ACTIVE: -e 1,$a,$b,-1,-1

exit 0
