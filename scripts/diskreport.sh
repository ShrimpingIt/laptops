#!/bin/bash
for SUFFIX in $(seq 0 9)
do
	echo -n "${SUFFIX}: "
	ssh laptop@debian-shrimp-"$SUFFIX" "df -h /"
done
