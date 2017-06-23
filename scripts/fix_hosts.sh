#!/bin/bash
# removes the line which looks like the following and is probably incorrect...
# 127.0.1.1	debian-shrimp-0.workshop	debian-shrimp-0
PASSWORD=$1
for SUFFIX in `./numbers.sh`
do
	echo -n "${SUFFIX}: "
	# removes the spurious line in the hosts file which identifies the outbound path as matching with itself
	ssh -t learner@debian-shrimp-"$SUFFIX" "echo '${PASSWORD}' | sudo -S perl -i -l -n -e'print unless /debian-shrimp-0/' /etc/hosts"
done
