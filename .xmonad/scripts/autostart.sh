#!/bin/sh

## Desktop appearance
nitrogen --restore &  # Wallpaper
picom &               # Compositor

## Trayer
nm-applet &
volumeicon &
trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --widthtype request --height 22 --transparent true --alpha 0 --tint 0x1e2127 --padding 6 --monitor 0 &

## Programs
redshift-gtk &        # Blue light filter
autokey-gtk &         # Text expanding
pavucontrol &         # Volume control
dunst &               # Notifications
udiskie --tray &      # Automount
lxsession &           # Session manager

#DAY=$(date "+%u")
#[ $DAY != "6" -a $DAY != "7" ] && teams &
# steam &

## Poe
#/home/alex/bin/Awakened-PoE-Trade-2.9.1.AppImage &
#python /home/alex/dev/clienthelper.py &

## Keyboard and cursor
setxkbmap -option caps:escape
xsetroot -cursor_name left_ptr
