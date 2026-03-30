#!/bin/bash
# Cycles: balanced -> performance -> power-saver -> balanced
current=$(powerprofilesctl get)
case "$current" in
    balanced)     powerprofilesctl set performance ;;
    performance)  powerprofilesctl set power-saver ;;
    power-saver)  powerprofilesctl set balanced ;;
    *)            powerprofilesctl set balanced ;;
esac
