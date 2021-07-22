#!/bin/sh

awesome_dir=~/.config/awesome
my_awesome_dir=$DOTFILEPATH/.config/awesome

awesome_files=("rc.lua" "autostart.sh" "picom.conf" "system-overview")

for f in `ls -1 awesome`; do
    echo remove $f
    rm -rf $awesome_dir/$f

    echo ln $f
    ln -s $my_awesome_dir/$f $awesome_dir/
done
