#!/bin/bash
for SUFFIX in $(seq 0 9)
do
	echo -n "${SUFFIX}: "
	ssh -t laptop@debian-shrimp-"$SUFFIX" "/sbin/ifconfig | grep 'inet addr:10.42'"
done
