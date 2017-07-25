#!/bin/bash
PASSWORD=$1
for SUFFIX in `./numbers.sh`
do
	echo -n "${SUFFIX}: "
	ssh learner@debian-shrimp-"$SUFFIX" "code --install-extension donjayamanne.python"
	ssh -t learner@debian-shrimp-"$SUFFIX" "echo '${PASSWORD}' | sudo -S pip install pylint"
done



	
