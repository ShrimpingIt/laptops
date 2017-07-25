#!/bin/bash
for SUFFIX in `./numbers.sh`
do
	echo -n "${SUFFIX}: "
	ssh learner@debian-shrimp-"$SUFFIX" "pkill -f miniterm" 
done
