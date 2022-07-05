#!/bin/bash

echo -n "Jika pbx pada server tomang pilih angka 1 dan jika pbx server hasyim pilih angka 2: ";
read pbx;

if [ $pbx = 1];then
 sh join.sh;
else 
sh hasyim.sh;
fi
