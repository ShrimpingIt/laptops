#!/bin/bash
PASSWORD=$1
for SUFFIX in `./numbers.sh`
do
	# reports on modules
	#ssh -t learner@debian-shrimp-"$SUFFIX" "echo '${PASSWORD}' | sudo -S echo; echo -n 'Modules:'; sudo dmidecode --type memory | grep Size;"
	ssh -t -q learner@debian-shrimp-"$SUFFIX" "echo -n ${SUFFIX}: ; echo '${PASSWORD}' | sudo -p '' -S echo 2>&1 1>/dev/null; echo -n 'Memory:'; sudo free | awk '/Mem/ { print \$2;}' "
done
#arduino-mk
