#!/bin/bash
# sed - filtrarea si transformarea textului
# awk - scanarea patternuri si procesarea limbajului
# sort - sortarea liniilor din file
# uniq - raporteaza sau omite liniile care se repeta
# c - numarator

man bash | 
sed 's/\s/\n/\g' | 
awk 'length($0)>2' | 
sort | 
uniq -c | 
sort -nr | 
head -4

exit 0;