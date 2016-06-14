#!/bin/bash
for SUFFIX in 14 # `./numbers.sh`
do
	echo $SUFFIX
	ssh laptop@debian-shrimp-"$SUFFIX" "cd ~/Desktop/ && git clone https://github.com/ShrimpingIt/projects.git"
done
