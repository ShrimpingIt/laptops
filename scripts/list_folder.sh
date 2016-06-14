#!/bin/bash
for SUFFIX in `./numbers.sh`
do
	echo $SUFFIX
	ssh laptop@debian-shrimp-"$SUFFIX" "ls ~/Desktop/projects"
done
