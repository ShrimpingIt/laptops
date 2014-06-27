#!/bin/bash
PASSWORD=$1
for SUFFIX in 0 $(seq 2 9) 1
do
	echo -n "${SUFFIX}: "
	ssh -t laptop@debian-shrimp-"$SUFFIX" "echo ${PASSWORD} | sudo -S shutdown -h now"
done
