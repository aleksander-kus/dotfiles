#!/bin/sh

#xrandr -s 1920x1080 -r 144
nitrogen --restore &
picom &
setxkbmap -option caps:escape
nm-applet &
volumeicon &
redshift-gtk -l 52.4:16.9 &
trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --widthtype request --height 22 --transparent true --alpha 0 --tint 0x282c34 --padding 6 --monitor 0 &
#trayer --edge top --align right --widthtype request --padding 6 --SetDockType true --SetPartialStrut true --expand true --monitor 1 --transparent true --alpha 0 --tint 0x282c34  --height 22 &
autokey-gtk &
pavucontrol &
dunst &
lxsession &
DAY=$(date "+%u")
[ $DAY != "6" -a $DAY != "7" ] && teams &
steam &
/home/alex/bin/Awakened-PoE-Trade-2.9.1.AppImage &
python /home/alex/dev/clienthelper.py &
xsetroot -cursor_name left_ptr
