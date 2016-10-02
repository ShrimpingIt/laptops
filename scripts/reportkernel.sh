#!/bin/bash
for SUFFIX in `./numbers.sh`
do
	echo -n "${SUFFIX}: "
	ssh laptop@debian-shrimp-"$SUFFIX" "uname -a"
done
