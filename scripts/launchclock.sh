#!/bin/bash
for SUFFIX in $(seq 0 9)
do
	echo -n "${SUFFIX}: "
	ssh -t laptop@debian-shrimp-"$SUFFIX" "export DISPLAY=:0;xclock"
done
