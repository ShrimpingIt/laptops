#!/bin/bash
for SUFFIX in $(seq 0 9)
do
	# copy current machine's key to the target laptop
	ssh-copy-id laptop@debian-shrimp-"$SUFFIX"
	
	# configure ssh for passwordless non-interactive ssh login 
	#ssh -t laptop@debian-shrimp-"$SUFFIX" "ssh-keygen -f /home/laptop/.ssh/id_rsa -t rsa -N ''; echo 'StrictHostKeyChecking no' > ~/.ssh/config;" 
	
	# initialise and copy target laptop's key to debian-shrimp-1
	#ssh -t laptop@debian-shrimp-"$SUFFIX" "ssh-copy-id laptop@debian-shrimp-1"
done
