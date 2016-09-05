#!/bin/bash

urxvt -depth 32 -bg rgba:0000/0000/0000/0000 +sb -fn "xft::pixelsize=9" +bl -e cava &
sleep 1

for i in $(lsw)
    do if [ "$(xprop -id $i|grep URxvt)" ]
        then chwso -l $i
             wtp 2 2 1436 864 $i
       fi
done

#wtp 1160 859 60 40
