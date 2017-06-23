#!/bin/bash
for SUFFIX in `./numbers.sh`
do
	ssh learner@debian-shrimp-"$SUFFIX" "cat /proc/cpuinfo | grep 'model name' | head -n1"
done
