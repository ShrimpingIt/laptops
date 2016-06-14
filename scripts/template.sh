#!/bin/bash
for SUFFIX in `./numbers.sh`
do
	ssh laptop@debian-shrimp-"$SUFFIX" "cat /proc/cpuinfo | grep 'model name' | head -n1"
done
