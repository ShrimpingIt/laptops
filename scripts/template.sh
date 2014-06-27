#!/bin/bash
for SUFFIX in $(seq 0 9)
do
	ssh laptop@debian-shrimp-"$SUFFIX" "cat /proc/cpuinfo | grep 'model name' | head -n1"
done
