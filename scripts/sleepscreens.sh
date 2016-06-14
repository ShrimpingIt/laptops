#!/bin/bash
for SUFFIX in `./numbers.sh`
do
	echo -n "${SUFFIX}: "
	ssh -t -t laptop@debian-shrimp-"$SUFFIX" "DISPLAY=:0 gnome-screensaver-command -l" &
	ssh -t -t laptop@debian-shrimp-"$SUFFIX" "export DISPLAY=:0;xset dpms force off" &
done
