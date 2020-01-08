#!/bin/bash

#Save processes PID
#ps - print info about current processes
# -ef - standard syntax
lines=`ps -ef | awk 'NR!=1{print $2}'`

#Overwrite file
# rm - remove file or directories
rm PID: PPID:PPID:AVG_ATOM.file

#While read every line from var. lines
while read -r line; do
	#Extract PID and PPID from status;
	#se.sum_exe_runtime and nr.switches from sched
	#grep - selecteaza
	#awk - select line from tail and print second word(PID)
	var=$(grep -s 'Pid\se.sum_exe_runtime\|nr_switches' '/proc/'$line'/status' '/proc/'$line'/sched' |
			awk 'NR==1 {PID=$2}
				 NR==2 {PPID=$2}
				 NR==4 {Runtime=$3}
				 NR==5 {switches=$3}
				 END {
				 		print "PID="PID, ":PPID="PPID, ":Average_Time="Runtime/Switches}')

	echo $var >> PID:PPID:AVG_ATOM.file

done <<< "$lines"

#Sort lines by third column and override file
echo "$(sort -k3 -n PID:PPID:AVG_ATOM.file)" > PID:PPID:AVG_ATOM.file

#Delete empty lines and spaces from file
sed -i 's/ //g;/^$/d' PID:PPID:AVG_ATOM.file

cat PID:PPID:AVG_ATOM.file

exit 0;