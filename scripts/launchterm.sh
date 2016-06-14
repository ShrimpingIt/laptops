#!/bin/bash
for SUFFIX in `./numbers.sh`
do
	echo -n "${SUFFIX}: "
#	ssh -t -t laptop@debian-shrimp-"$SUFFIX" "killall xterm" &
	ssh -t -t laptop@debian-shrimp-"$SUFFIX" "DISPLAY=:0 xterm" &
done
