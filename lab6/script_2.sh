#!/bin/bash

address="www.traiasca_moldova.md";
count=0;

sleep 2m;

test -f ~/raport || touch ~/raport;
mkdir /home/test 2>/dev/null

if [ $? -eq 0 ]; then
	echo "catalog test was created successfully" >> ~/raport;
	count=$((count+1));
	touch Data_Ora_Lansarii_Scriptului;
fi

ping -c 1 $address &>/dev/null
if [ $? -eq 0 ]; then
	echo "can't ping specified website" >> ~/raport;
	count=$((count+1));
fi
tail -$count ~/raport;