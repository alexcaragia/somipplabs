#!/bin/bash
# cut - elimina sectiunile din fiecare linie sau fisier
# sort - sorteaza liniilie din fisier
# d - dictionary order
# t - field separator
# f1 - field 1
# k2n -  sorteaza dupa a 2-a col. si le sorteaza numeric


cut -d ':' -f1,3 /etc/passwd | 
sort -t ':' -k2n

exit 0