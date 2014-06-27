#!/bin/bash
for SUFFIX in 0 $(seq 2 9)
do
	echo -n "${SUFFIX}: "
	ssh -t laptop@debian-shrimp-"$SUFFIX" "rsync -e 'ssh -i /home/laptop/.ssh/id_rsa' --verbose --whole-file --archive --compress --recursive laptop@debian-shrimp-1:/home/laptop/Desktop/ /home/laptop/Desktop"
done
