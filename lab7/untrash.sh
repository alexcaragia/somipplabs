#!/bin/bash
#daca nu avem parametri, inchidem procesul
if [ "$1" = "" ]
then 
	echo Scriptul nu a primit parametrul!; exit; fi
>fisier
#gasim fisierele care contin parametrul introdus si introducem in fisier
egrep -o "$1.*$" <<< cat .trash > fisier
#adaugam rand nou dupa spatiu
sed 's/ /n/' fisier > /dev/null
n=1
#citim liniile din fisier
while read line
do
	echo "[$n] Restabiliti fisierul '$line' ?" 
	n=$[n+1]
done < fisier
echo Alegeti optiunea:; read x
#introducem in line adresa catre fisierul ales
line=`cat .trash | head -$x | tail -1`
#restabilim fisierul si cream un link
ln .trash `echo $line` 2>/dev/null
#daca nu se poate restabili, il restabilim in /home/loyd88
nume=`cat fisier | head -$x | tail -1`
if ! [ -f $line ]; then
	echo Fisierul a fost creat in directorul /home/loyd88
	ln .trash `/home/user/$nume`
fi
#stergem linia din .trash
sed -i "/$nume/d" .trash