#!/bin/bash

#ps - print info about current processes
# -aux - see every provess on the system
# wc -l - print newline counts
# cat - putting multiple file contents tohether
#awk - select line from tail and print second word(PID)
# -u - user

ps -u | wc -l

#awk '{print $2}' - print second word from line(PID) in file PID.list
ps -u | awk '{print $2}' > PID.list
cat PID.list

exit 0;