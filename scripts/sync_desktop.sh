#!/bin/bash
for SUFFIX in `./numbers.sh`
do
	echo -n "${SUFFIX}: "
	ssh -t laptop@debian-shrimp-"$SUFFIX" "rsync -e 'ssh -i /home/laptop/.ssh/id_rsa' --verbose --whole-file --archive --compress --recursive laptop@10.42.0.1:/home/laptop/Desktop/ /home/laptop/Desktop"
done
