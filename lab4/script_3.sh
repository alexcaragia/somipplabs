#!/bin/bash

# sed - schimba cu locul liniile din fisier
# e - foloseste expresii de pattern

grep '(WW)\|(II)' '/var/log/Xorg.0.log' | 
sed -e 's/(WW)/(Warning)/g' -e 's/(II)/(Information)/g' > full.log

exit 0;