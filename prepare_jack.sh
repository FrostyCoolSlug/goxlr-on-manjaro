#!/bin/bash
#
# This script simply prepares and configures Jack for the GoXLR
###########

DEVICE="hw:GoXLR"

echo "Looking for GoXLR Device.."
if [ -d /proc/asound/GoXLRMini ]; then
        echo "Found GoXLR Mini"
        DEVICE="hw:GoXLRMini"
fi

if [ -d /proc/asound/GoXLR ]; then
        echo "Found GoXLR Full"
        DEVICE="hw:GoXLR"
fi



jack_control eps realtime true
jack_control ds alsa

jack_control dps device $DEVICE
jack_control dps period 512
jack_control dps rate 48000
jack_control dps nperiods 3

jack_control start
