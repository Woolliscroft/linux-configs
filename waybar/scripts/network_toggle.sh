#!/bin/bash

WIFI=$(nmcli radio wifi)
WWAN=$(nmcli radio wwan)

if [ "$1" = "status" ]; then
    if [ "$WIFI" = "enabled" ]; then
        SSID=$(nmcli -t -f ACTIVE,SSID dev wifi | grep '^yes' | cut -d: -f2)
        [ -z "$SSID" ] && SSID="WiFi"
        echo "{\"text\":\" $SSID\",\"tooltip\":\"Click to switch to mobile data\"}"
    elif [ "$WWAN" = "enabled" ]; then
        echo "{\"text\":\"󰩟 Mobile\",\"tooltip\":\"Click to switch to WiFi\"}"
    else
        echo "{\"text\":\"󰖪 Offline\",\"tooltip\":\"Click to enable WiFi\"}"
    fi
    exit 0
fi

if [ "$WIFI" = "enabled" ]; then
    nmcli radio wifi off
    nmcli radio wwan on
    notify-send "Network" "Switched to mobile data"
else
    nmcli radio wifi on
    nmcli radio wwan off
    notify-send "Network" "Switched to WiFi"
fi
