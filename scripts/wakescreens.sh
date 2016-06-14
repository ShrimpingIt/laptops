#!/bin/bash
for SUFFIX in `./numbers.sh`
do
	echo -n "${SUFFIX}: "
	ssh -t -t laptop@debian-shrimp-"$SUFFIX" "DISPLAY=:0 xset dpms force on" &
	ssh -t -t laptop@debian-shrimp-"$SUFFIX" "DISPLAY=:0 gnome-screensaver-command -d" &
done
