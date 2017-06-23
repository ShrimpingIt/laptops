#!/bin/bash
for SUFFIX in `./numbers.sh`
do
	echo -n "${SUFFIX}: "
	ssh -t -t learner@debian-shrimp-"$SUFFIX" "DISPLAY=:0 xset dpms force on" &
done
