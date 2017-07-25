#!/bin/bash
for SUFFIX in `./numbers.sh`
do
	echo -n "${SUFFIX}: "
	ssh learner@debian-shrimp-"$SUFFIX" "pkill -f miniterm" 
	ssh learner@debian-shrimp-"$SUFFIX" "DISPLAY=:0.0 nohup lxterminal -e python3 -m serial.tools.miniterm --raw /dev/ttyUSB0 115200 > /dev/null &" & 
done
