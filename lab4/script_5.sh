#!/bin/bash
# echo - afiseaza
# grep - cauta in fisier tipuri de caracter si afiseza 

echo "!/bin/sh:" > sh
grep -r '^#!/bin/sh' /bin | wc -l >> sh
paste -s sh

echo "!/bin/bash:" > bash
grep -r '^#!/bin/bash' /bin | wc -l >> bash
paste -s bash

echo "!/bin/perl:" > perl
grep -r '^#!/bin/perl' /bin | wc -l >> perl
paste -s perl

echo "!/bin/tcl:" > tcl
grep -r '^#!/bin/tcl' /bin | wc -l >> tcl
paste -s tcl

exit 0