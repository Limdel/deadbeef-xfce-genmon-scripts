#!/bin/bash

if pgrep "deadbeef" > /dev/null
then

db()
{
deadbeef --nowplaying-tf "$*"
}

[[ "$(db %playback_time%)" ]] &&
echo "<bar>$(printf "%.0f\n" $(awk -v t1=$(db %playback_time_seconds%) -v t2=$(db %length_seconds%) 'BEGIN{print t1/(t2/100)}'))</bar>" || echo

else echo
fi
