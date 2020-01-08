#!/bin/bash

#Save in variable total memory from system
total_men=$(free | awk 'NR==2{print$2}')

#ps - aux - select all processes
#grep - selecteaza
#awk '{print $2":"$6} - print second and sixth words
#sort -nk2 - numeric sort (-n) by second column(-k2)
#awk - select line from tail and print second word(PID)
#awk -v - allows permissions to use variables in awk
ps -aux | grep '' | awk 'NR!=1{print $2" "$6}' | sort -nk2 -r |
awk -v gmem="${total_mem}" '{print $1":"gmem - $2}' > Diff.txt

#Display content from file
cat Diff.txt

exit 0;