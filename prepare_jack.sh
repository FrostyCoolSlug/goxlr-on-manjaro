#!/bin/bash
#
# This script simply prepares and configures Jack for the GoXLR
###########

jack_control eps realtime true
jack_control ds alsa

jack_control dps device hw:GoXLR
jack_control dps period 512
jack_control dps rate 48000
jack_control dps nperiods 3

jack_control start

# Keep this script running so SystemD can monitor..
sleep infinity
