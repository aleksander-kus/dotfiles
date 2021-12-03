#!/bin/bash
BACKUPDIR=/home/alex/Disk2/backup2/arch-ryszard

function notify-send() {
    #Detect the name of the display in use
    local display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"

    #Detect the user using such display
    local user=$(who | grep '('$display')' | awk '{print $1}' | head -n 1)

    #Detect the id of the user
    local uid=$(id -u $user)

    sudo -u $user DISPLAY=$display DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$uid/bus notify-send "$@"
}

if [ ! -d $BACKUPDIR ] 
then 
    notify-send -t 10000000 "Warning" "The backup directory could not be found."
    exit 1
fi

rsync-snapshot --dst $BACKUPDIR --maxSnapshots 100 \
--logFile /var/log/backup.log --exclude "/var/*" \
--exclude "/home/alex/Disk1/*" --exclude "/home/alex/Disk2/*" \
--exclude "/home/alex/.config/BraveSoftware/*" --exclude "/home/alex/.mozilla/*" \
--exclude "/home/alex/.local/share/libvirt/*" --exclude "/home/alex/.local/share/fsearch/*" \
--exclude "/home/alex/.cache" --exclude "/home/alex/VirtualBox VMs"