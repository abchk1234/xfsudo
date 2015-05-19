#!/bin/bash
# xfsudo: run as root using sudo

PRGNAME=$(basename "$0")

# Check which mode to operate in based upon which name we were called as.
if [ "$PRGNAME" = xfsu ]; then
	MODE=as_root  # run with root priviliges and root's environment variables
else
	MODE=as_sudo  # run with root priviliges and user's environment variables
fi

# Check if command line argument specified or not
if [ -z "$1" ]; then
	zenity --title='xfsudo' --error --text='No program specified'
	exit 1
fi

# Check for -h option
if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
	echo "Usage: $PRGNAME <program>"
	exit 1
fi

# Check if the program called exists
#if ! type -p "$1" &>/dev/null; then
#	zenity --title='xfsudo' --error --text='Non existing program specified'
#	exit 1
#fi

# Get the password
PASS=$(zenity --title='xfsudo' --password) || exit 1

flag=0
# Pass the password and command-line arguments to sudo
if [ "$MODE" = as_sudo ]; then
	echo "$PASS" | sudo -p "" -SkE "$@" >/dev/null 2>&1 | grep "incorrect password" && flag=1
else
	echo "$PASS" | sudo -p "" -Sik "$@" >/dev/null 2>&1 | grep "incorrect password" && flag=1
fi

if [ "$flag" -eq 1 ]; then
	zenity --title='xfsudo' --error --text='Incorrect password entered'
fi

# Done
exit $?
