#!/bin/bash
# start 'multiline comment'
: <<'swallow' 
for SUFFIX in $(seq 16 25)
do
	echo -n "${SUFFIX}: "
	ssh learner@debian-shrimp-"$SUFFIX" "DISPLAY=:0 gsettings set org.gnome.eog.fullscreen seconds 4"
	ssh learner@debian-shrimp-"$SUFFIX" "DISPLAY=:0 gsettings set org.gnome.eog.view background-color '#FFFFFF'"
	ssh learner@debian-shrimp-"$SUFFIX" "DISPLAY=:0 gsettings set org.gnome.eog.view trans-color '#FFFFFF'"	
	ssh learner@debian-shrimp-"$SUFFIX" "DISPLAY=:0 killall eog"	
done
swallow

# start 'multiline comment'
#: <<'swallow' 
ssh learner@debian-shrimp-16 "cd ~/Desktop/cdl/; DISPLAY=:0 eog --fullscreen cdl.jpg" &
ssh learner@debian-shrimp-17 "cd ~/Desktop/cdl/; DISPLAY=:0 eog --fullscreen --slide-show cdl.jpg Y.png" &	
ssh learner@debian-shrimp-18 "cd ~/Desktop/cdl/; DISPLAY=:0 eog --fullscreen --slide-show cdl.jpg O.png"	&
ssh learner@debian-shrimp-19 "cd ~/Desktop/cdl/; DISPLAY=:0 eog --fullscreen --slide-show cdl.jpg U.png"	&
ssh learner@debian-shrimp-20 "cd ~/Desktop/cdl/; DISPLAY=:0 eog --fullscreen cdl.jpg" &
ssh learner@debian-shrimp-21 "cd ~/Desktop/cdl/; DISPLAY=:0 eog --fullscreen --slide-show cdl.jpg T.png"	&
ssh learner@debian-shrimp-22 "cd ~/Desktop/cdl/; DISPLAY=:0 eog --fullscreen --slide-show cdl.jpg H.png"	&
ssh learner@debian-shrimp-23 "cd ~/Desktop/cdl/; DISPLAY=:0 eog --fullscreen --slide-show cdl.jpg letter_A.png"	&
ssh learner@debian-shrimp-24 "cd ~/Desktop/cdl/; DISPLAY=:0 eog --fullscreen --slide-show cdl.jpg N.png"	&
ssh learner@debian-shrimp-25 "cd ~/Desktop/cdl/; DISPLAY=:0 eog --fullscreen --slide-show cdl.jpg K.png"	&
#swallow
# end 'multiline comment'
