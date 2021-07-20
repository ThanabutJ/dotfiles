#!/bin/sh
bn=$1

echo "set brightness to 0.$bn"
xrandr --output eDP --brightness "0.${bn}"
