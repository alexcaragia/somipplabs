#!/bin/bash

#wc - calculeaza cantitatea de cuvinte/linii/simboluri din fisier
# -l - afisarea fisierurilor intr-un format lung

grep -s '' '/var/log/'*.log | 
wc -l

exit 0;