#!/bin/bash
for SUFFIX in $(seq 1 9)
do
	echo -n "${SUFFIX}: "
	ssh -t laptop@debian-shrimp-"$SUFFIX" "cd /home/laptop/Desktop/itech/empty && make upload"
done
