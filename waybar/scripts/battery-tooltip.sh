#!/bin/bash

BAT_PATH=$(upower -e | grep -m1 battery)
BAT=$(upower -i "$BAT_PATH")

TIME=$(echo "$BAT" | grep -E "time to" | awk '{print $4, $5}')
STATE=$(echo "$BAT" | awk -F': *' '/state/ {print $2}' | tr -d '[:space:]')
PERC=$(echo "$BAT" | awk -F': *' '/percentage/ {print $2}' | tr -d '[:space:]')

if [ -z "$TIME" ]; then
    TIME="calculating"
fi

if [ "$STATE" = "charging" ]; then
    echo "{\"text\":\"$PERC\",\"tooltip\":\"$TIME to full\",\"class\":\"charging\"}"
else
    echo "{\"text\":\"$PERC\",\"tooltip\":\"$TIME left\",\"class\":\"discharging\"}"
fi
