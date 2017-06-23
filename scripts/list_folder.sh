#!/bin/bash
for SUFFIX in `./numbers.sh`
do
	echo $SUFFIX
	ssh learner@debian-shrimp-"$SUFFIX" "ls ~/Desktop/projects"
done
