#!/bin/bash

#Extract every PID from
lines=$(grep '' PID:PPID:AVG_ATOM.file)

#Overwrite file

rm VNSwitches.txt

#While read every line from variable lines
while read -r line; do

	#Extract from each line PID
	#cut -  remove sections from each line of files
	#	-d - delimiter
	PID=$(cut -d ':' -f1 <<< "$line" | sed 's/[^0-9]*//g')
	var_PPID=$(cut -d ':' -f2 <<< "$line" | sed 's/[^0-9]*//g')
	AVG_ATOM=$(cut -d ':' -f3 <<< "$line" | sed 's/[^0-9.]*//g')

	#Extract Voluntary and Nonvoluntary ctxt_switches 
	VSwitches=$(grep -s 'voluntary_ctxt_switches' '/proc/'$PID'/status' | awk '{print $2}')
	NSwitches=$(grep -s 'nonvoluntary_ctxt_switches' '/proc/'$PID'/status' | awk '{print $2}')

	echo "$line" >> VNSwitches.txt

	#awk
	#	-v - variable
	awk -v pid="$PID" -v ppid="$var_PPID" -v vs="$VSwitches" -v ns="$NSwitches" 'BEGIN {print "sum_switches_of_ParentID=" pid, " is " (vs + ns)}' >> VNSwitches.txt

done <<< "$lines"

cat VNSwitches.txt

exit 0;	