#!/bin/bash
for SUFFIX in `./numbers.sh`
do
	# report hostname 
	ssh -t learner@debian-shrimp-"$SUFFIX" cat /etc/hostname 
	# report hosts file 
	ssh -t learner@debian-shrimp-"$SUFFIX" cat /etc/hosts 
done
