#!/bin/bash
for SUFFIX in `./numbers.sh`
do
	echo -n "${SUFFIX}: "
	ssh -t laptop@debian-shrimp-"$SUFFIX" "cd /home/laptop/Desktop/itech/Blink && make upload"
done
