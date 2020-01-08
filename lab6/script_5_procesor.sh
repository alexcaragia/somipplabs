#!/bin/bash

test -f .script_5 || touch .script_5;
total=1;
operation=1;
number_regex='^-?[0-9]+$';

(tail -n 0 -f .script_5) | while true; do
	read line;
	case $line in
		QUIT)
			echo "finisare..."
			killall tail
			exit;;
		\*)
			operation=2;;
		+)
			operation=1;;
		*)
			if [[ $line =~ $number_regex ]]; then
				if [$operation -eq 1 ]; then
					total $total
				elif [ $operation -eq 2 ]; then
					total="$(($total*$line))"
					echo $total
				fi
			else
				echo "date de inrare eronate"
				exit
			fi;;
	esac
done
					