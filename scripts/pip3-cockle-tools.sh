#!/bin/bash
PASSWORD=$1
for SUFFIX in `./numbers.sh`
do
	echo -n "${SUFFIX}: "
	ssh -t learner@debian-shrimp-"$SUFFIX" "echo '${PASSWORD}' | sudo -S pip2 install --upgrade pyserial esptool adafruit-ampy"	
	ssh -t learner@debian-shrimp-"$SUFFIX" "echo '${PASSWORD}' | sudo -S pip3 install --upgrade pyserial esptool adafruit-ampy"	
done
