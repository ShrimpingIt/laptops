#!/bin/bash
PASSWORD=$1
for SUFFIX in $(seq 2 9)
do
	echo -n "${SUFFIX}: "
	ssh -t laptop@debian-shrimp-"$SUFFIX" "echo '${PASSWORD}' | sudo -S rsync -e 'ssh -i /home/laptop/.ssh/id_rsa' --verbose --whole-file --archive --compress --recursive laptop@debian-shrimp-1:/var/cache/apt/archives/ /var/cache/apt/archives/"
done
