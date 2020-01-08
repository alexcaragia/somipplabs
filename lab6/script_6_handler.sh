#!/bin/bash

echo $$ > .pid
number=1
mode="Work"

sigterm()
{
	mode="TERM"
}

trap 'sigterm' SIGTERM
while true; do 
	case $mode in
		"Work")
			let number=$number+1
			echo $number;;
		"TERM")
			echo "Script finished by SIGTERM signal"
			exit;;
	esac
	sleep 1
done