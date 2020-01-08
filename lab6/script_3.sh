#!/bin/bash

cron_checker()
{
	crontab -l > mycron
	if ! grep -q '\s/home/loyd88/laboratoare/lab6/script_3.sh' mycron; then
		echo "*/5 * * * 2, 4, 6 /home/loyd88/laboratoare/lab6/script_3.sh" >> mycron
		crontab mycron
	fi
	rm mycron		
}

cron_checker;
address="www.traiasca_moldova.md";

test -f ~/raport || touch ~/raport;
mkdir /home/test 2>/dev/null

if [ $? -eq 0 ]; then
	echo "catalog test was created successfully" >> ~/raport;
	touch Data_Ora_Lansarii_Scriptului;
fi

ping -c 1 $address &>/dev/null
if [ $? -eq 0 ]; then
	echo "catalog test was created successfully" >> ~/raport;
	touch Data_Ora_Lansarii_Scriptului;
fi

ping -c 1 $address &>/dev/null
if [ $? -eq 0 ]; then
	exit 1;
else
	echo "can't ping specified website" >> ~/raport;
	exit 0;
fi