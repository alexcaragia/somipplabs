#!/bin/bash

#ps -aux - display all processes
#grep - selecteaza
#grep 'string' - where line contain '/sbin/'
#awk '{print $2}' - print second word(PID)
ps -aux | grep '/sbin/' | awk '{print $2}' > PID.sbin

#Read lines from file
cat PID.sbin

exit 0;