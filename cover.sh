#!/bin/bash

if pgrep "deadbeef" > /dev/null
then

db()
{
deadbeef --nowplaying-tf "$*"
}

cv()
{
ffmpeg -y -i "$pt/$(db $*).jpg" -vf scale=-1:32 "$cover"
}

pt="$HOME/.cache/deadbeef/covers/$(db %artist%)/"
c=/tmp/cover.txt
cover=/tmp/cover.png
click="vivaldi-stable 'http://last.fm/music/$(db %artist%)'"
icon="/usr/share/icons/Adwaita/scalable/actions/media-playback-start-symbolic.svg"

if [ "$(db %playback_time%)" ]
    then if [ "$(cat $c)" != "$(db %artist% - %album% - %title%)" ]
            then rm $cover
            if [ -s "$pt/$(db %album%).jpg" ]
                then cv %album%
                else if [ -s "$pt/$(db %title%).jpg" ]
                        then cv %title%
                     fi
            fi
         fi    
         if [ -f $cover ]
            then echo "<img>$cover</img><click>$click</click>"
            else echo "<img>$icon</img><click>$click</click>"
         fi
    else echo
fi

echo "$(db %artist% - %album% - %title%)" > $c

else echo
fi
