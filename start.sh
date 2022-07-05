#!/bin/bash

echo -n "Pilih Site PBX
         1. Site Tomang
         2. Site Hasyim
         input: ";
read pbx;

if [ $pbx = 1];then
 sh join.sh;
else 
sh hasyim.sh;
fi
