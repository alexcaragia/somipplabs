#!/bin/bash
#gasim anul, luna si ziua
date=`date -I`
year=`echo $date | egrep -o '^[[:digit:]]+'`
month=`echo $date | sed -r 's/^.+-([[:digit:]]+)-.+/\1/'`
day=`echo $date | egrep -o '[[:digit:]]+$'`
#verificam daca nu exista alt director
dir=`ls /home/loyd88 | grep Backup`
#daca exista vreun director Backup
if [ -d /home/loyd88/$dir ] && [[ $dir != "" ]]
then
	#verificam daca nu au trecut 7 zile
	year_B=`echo $dir | sed -r 's/^[[:alpha:]]+-([[:digit:]]+)-.+/\1/'`
	month_B=`echo $dir | sed -r 's/.+-([[:digit:]]+)-[[:digit:]]+$/\1/'`
	day_B=`echo $dir | egrep -o '([[:digit:]]+)$'`
	#aflam cate secunde au trecut de la creare
	sec_B=`date -d "$year_B-$month_B-$day_B" +%s`
	sec=`date -d "$year-$month-$day" +%s`
	#daca directorul a fost creat mai devreme de 7 zile in urma, se sterge
	if [[ $[(sec-sec_B)/(3600*24)] -gt 7 ]]; then
		rm -r /home/loyd88/$dir
		bash backup
	else
		for fisier in /home/loyd88/laboratoare/lab7/*; do
			nume_fisier=`echo $fisier | egrep -o '[[:alpha:]]+$'`
			#daca exista astfel de fisier, comparam dimensiunile
			if [ -f /home/loyd88/$dir/$nume_fisier ]; then
				size1=`wc -c /home/loyd88/$dir/$nume_fisier | egrep -o '^[[:digit:]]+'`
				size2=`wc -c $fisier | egrep -o '^[[:digit:]]+'`
				#daca dimensiunile sunt diferite...
				if [[ $size1 -ne $size2 ]]; then
					mv /home/loyd88/$dir/$nume_fisier /home/loyd88/$dir/$nume_fisier.old
					cat $fisier > /home/loyd88/$dir/$nume_fisier
				fi
			else
				#daca NU exista
				cp $fisier /home/loyd88/$dir/
			fi
		done
	fi
#daca nu exista Backup, il cream
else
	#cream directorul
	mkdir "/home/loyd88/laboratoare/Backup-$year-$month-$day"
	#copiem toate fisierele
	for fisier in /home/loyd88/laboratoare/lab7/*
	do
		cp $fisier /home/loyd88/Backup-$year-$month-$day/
	done
	#scriem in backup-report
	echo -e "Directorul Backup-$year-$month-$day a fost creat\nin data de $year-$month-$day" > /home/loyd88/Backup-$year-$month-$day/backup-report
	echo Au fost copiate urmatoarele fisiere: >> /home/loyd88/Backup-$year-$month-$day/backup-report
	for fisier in /home/loyd88/laboratoare/lab7/*
	do
		echo $fisier | egrep -o '[[:alpha:]]+$' >> /home/loyd88/Backup-$year-$month-$day/backup-report 
	done
fi