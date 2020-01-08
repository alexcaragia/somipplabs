#!/bin/bash

#ps -aux --sort=start_time - sort processes by start time
#tail -n 1 -select last line
#awk - select line from tail and print second word(PID)
ps -aux --sort=start_time| tail -n 1 | awk 'NR==1{print $2}'

exit 0;