#!/bin/bash
for SUFFIX in `./numbers.sh`
do
	echo -n "${SUFFIX}: "
	ssh -t learner@debian-shrimp-"$SUFFIX" "cd /home/laptop/Desktop/itech/empty && make upload"
done
