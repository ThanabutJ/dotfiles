#!/bin/sh
bn=$1

#select target display
dp=$(xrandr --listmonitors | awk '{print $4}' | fzf)

if [ -z "$dp" ]
then 
    exit 0
fi

echo "set dispay $dp brightness to 0.$bn"
xrandr --output ${dp} --brightness "0.${bn}"
