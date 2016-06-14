#!/bin/bash
for SUFFIX in `./numbers.sh`
do
	# report hostname 
	ssh -t laptop@debian-shrimp-"$SUFFIX" cat /etc/hostname 
	# report hosts file 
	ssh -t laptop@debian-shrimp-"$SUFFIX" cat /etc/hosts 
done
