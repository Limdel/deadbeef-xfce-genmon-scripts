#!/bin/sh

if pgrep "deadbeef" > /dev/null
then

size=28
f=/tmp/count.txt

db()
{
deadbeef --nowplaying-tf "$*"
}

if [ $(db '%artist%'|wc -m) -gt $size ]
    then if [ $(($(cat $f|sed '1q;d') + 1 + $size)) -gt $(db '%artist%'|wc -m) ]
         then echo -e "0\n$(cat $f|sed '2q;d')">$f
         else echo -e "$(($(cat $f|sed '1q;d')+1))\n$(cat $f|sed '2q;d')">$f
         fi;
    echo -e "$(db '%artist%'|awk '{print substr($0,'$(($(cat $f|sed '1q;d')+1))','$size')}')"
    else [[ $(db '%playback_time%') ]] && echo -e "$(db '%artist%')" || echo
fi;

if [ $(db '%title%'|wc -m) -gt $size ]
    then if [ $(($(cat $f|sed '2q;d') + 1 + $size)) -gt $(db '%title%'|wc -m) ]
         then echo -e "$(cat $f|sed '1q;d')\n0">$f
         else echo -e "$(cat $f|sed '1q;d')\n$(($(cat $f|sed '2q;d')+1))">$f
         fi;
    echo -e "$(db '%title%'|awk '{print substr($0,'$(($(cat $f|sed '2q;d')+1))','$size')}')"
    else [[ $(db '%playback_time%') ]] && echo -e "$(db '%title%')" || echo
fi

else echo
fi
