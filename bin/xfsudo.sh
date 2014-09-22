#!/bin/bash
# xfsudo: run as root using sudo

## Default mode
mode=sudo  # run with root priviliges and user's environment variables
#mode=root  # run with root priviliges and root's environment variables

# Config file which will override above setting
if [ -f /etc/xfsudo.conf ]; then
	source /etc/xfsudo.conf
fi

# Get the password
pass=$(zenity --title='xfsudo' --password) || exit 1

# Check if password is empty
if [ "$pass" == "" ]; then
	$(zenity --title='xfsudo' --error --text='Password not entered') && exit 1
fi

# Pass the password and command-line arguments to sudo
if [ "$mode" == "sudo" ]; then
	echo "$pass" | sudo -Sk env HOME=$HOME "$@" || $(zenity --title='xfsudo' --error --text='Incorrect password entered') && exit 1
else
	echo "$pass" | sudo -Sik "$@" || $(zenity --title='xfsudo' --error --text='Incorrect password entered') && exit 1
fi

# Exit without error
exit 0
