#!/bin/bash

if pgrep "deadbeef" > /dev/null
then

db()
{
deadbeef --nowplaying-tf "$*"
}

[[ "$(db %playback_time%)" ]] && echo -e "$(db %playback_time%)\n$(db %length%)" || echo

else echo
fi
