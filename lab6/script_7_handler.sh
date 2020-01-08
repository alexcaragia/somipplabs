#!/bin/bash

echo $$ > .pid
number=1
mode="Addition"

sigterm() { mode="Term"; }
add_op() { mode="Addition"; }
mult_op() { mode="Multiplication"; }

trap 'sigterm' SIGTERM
trap 'add_op' USR1
trap 'mult_op' USR2

while true; do
	case $mode in
		"Addition")
			let number=$number+2
			echo $number;;
		"Multiplication")
			let number=$number*2
			echo $number;;
		"Term")
			echo "Script finished by SIGTERM signal"
			exit;;
	esac
	sleep 1
done