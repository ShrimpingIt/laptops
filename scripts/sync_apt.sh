#!/bin/bash
PASSWORD=$1
for SUFFIX in `./numbers.sh`
do
	echo -n "${SUFFIX}: "
	ssh -t learner@debian-shrimp-"$SUFFIX" "echo '${PASSWORD}' | sudo -S rsync -e 'ssh -i /home/laptop/.ssh/id_rsa' --verbose --whole-file --archive --compress --recursive --include='chromium*' --include='iceweasel*' learner@debian-shrimp-2:/var/cache/apt/archives/ /var/cache/apt/archives/"
done
