#!/bin/bash
for SUFFIX in `./numbers.sh`
do
	echo $SUFFIX
	ssh learner@debian-shrimp-"$SUFFIX" "cd ~/Desktop/git/cockle && git pull origin master"
done
