#!/bin/bash
for SUFFIX in $(seq 0 9)
do
	echo -n "${SUFFIX}: "
	ssh laptop@debian-shrimp-"$SUFFIX" "killall /opt/google/chrome/chrome"
	ssh laptop@debian-shrimp-"$SUFFIX" "DISPLAY=:0.0 xdg-open http://shrimping.it > /dev/null &"
done

for SUFFIX in $(seq 0 9)
do
	ssh laptop@debian-shrimp-"$SUFFIX" "DISPLAY=:0.0 xdotool search chrome windowactivate --sync key F11"
done
