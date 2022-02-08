#!/bin/bash
#
# This needs to happen *AFTER* pulse is running, as we're connecting jack up to the pulse sinks / sources.

echo "Connecting JACK Outputs to Pulse.."
# System Output
jack_connect system:playback_1 GoXLR_Sink_System:front-left
jack_connect system:playback_2 GoXLR_Sink_System:front-right

# Game Output
jack_connect system:playback_3 GoXLR_Sink_Game:front-left
jack_connect system:playback_4 GoXLR_Sink_Game:front-right

# Chat Output
jack_connect system:playback_5 GoXLR_Sink_Chat:front-left
jack_connect system:playback_6 GoXLR_Sink_Chat:front-right

# Music Output
jack_connect system:playback_7 GoXLR_Sink_Music:front-left
jack_connect system:playback_8 GoXLR_Sink_Music:front-right

# Sample Output
jack_connect system:playback_9 GoXLR_Sink_Sample:front-left
jack_connect system:playback_10 GoXLR_Sink_Sample:front-right

# Broadcast Stream Input
jack_connect system:capture_1 GoXLR_Source_Broadcast_Mix:front-left
jack_connect system:capture_2 GoXLR_Source_Broadcast_Mix:front-right

# Chat Input
jack_connect system:capture_3 GoXLR_Source_Chat:front-left
jack_connect system:capture_4 GoXLR_Source_Chat:front-right
echo "Connected"

# Keep this script running so SystemD can monitor..
#sleep infinity
