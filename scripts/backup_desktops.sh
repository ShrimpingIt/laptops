#!/bin/bash
for SUFFIX in `./numbers.sh`
do
	echo -n "${SUFFIX}: "
	LOCALDIR=../../combined-desktop/
	mkdir -p $LOCALDIR
	rsync --recursive --archive --backup --whole-file --verbose --progress -e ssh learner@debian-shrimp-"${SUFFIX}":~/Desktop $LOCALDIR/
done
