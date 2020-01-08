#!/bin/bash

# e -> foloseste expesii de pattern
# s -> fara mesaje
# o -> numai care corespund in tocmai cu expresia regulata
# r -> recursiv (cutarea mai adanca)
# h -> nu pune path
# sed -> seteaza  


egrep -sorh '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b' '/etc' | 
sed 's/$/,/' > emails.lst

exit 0;