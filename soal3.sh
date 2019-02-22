#!bin/bash

benar=1
i=1

while [ $benar != 0 ]
do

if [ ! -f /home/phiton2/sisop1/password$i.txt ];
then
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1 > /home/phiton2/sisop1/password$i.txt
benar=0
else
let i=i+1
fi

done

