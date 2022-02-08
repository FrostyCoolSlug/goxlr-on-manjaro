#!/bin/bash
#
# This script stops and resets jack
###########

jack_control stop

jack_control dpr nperiods
jack_control dpr rate
jack_control dpr period
jack_control dpr device

jack_control epr realtime
