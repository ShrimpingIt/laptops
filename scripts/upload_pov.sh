#!/bin/bash
for SUFFIX in $(seq 1 9)
do
	echo -n "${SUFFIX}: "
	ssh -t learner@debian-shrimp-"$SUFFIX" "cd /home/laptop/Desktop/itech/shrimPov && make upload"
done
