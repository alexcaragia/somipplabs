#!/bin/bash
if [ "$1" = "" ]
then 
	echo Scriptul nu a primit parametrul!; exit; fi

>> .trash
ln .trash `echo $1`
echo `readlink -f $1` >> .trash
rm `echo $1` > /dev/null