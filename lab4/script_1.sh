#!/bin/bash

#grep - cauta in fisier tipuri de caracter si afiseza 
#toate liniile care au asa tip de carater
# -s - sterge erorile
# h - sterge path
# ACPI - vizualizarea starii organelor laptop-ului
# F - field separator 

grep -sh 'ACPI' '/var/log/'{*,.*} > errors.log


awk -F/ '{print $4}' errors.log | cut -d ':' -f1
cat errors.log
exit 0;
