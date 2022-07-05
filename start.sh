#!/bin/bash

echo -n "Pilih PBX
         1. Site Tomang
         2. Site Hasyim";
read pbx;

if [ $pbx = 1];then
 sh join.sh;
else 
sh hasyim.sh;
fi
