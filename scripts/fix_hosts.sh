#!/bin/bash
PASSWORD=$1
for SUFFIX in $(seq 2 9)
do
	echo -n "${SUFFIX}: "
	# removes the spurious line in the hosts file which identifies the outbound path as matching with itself
	ssh -t laptop@debian-shrimp-"$SUFFIX" "echo '${PASSWORD}' | sudo -S perl -i -l -n -e'print unless /debian-shrimp-1/' /etc/hosts"
done
