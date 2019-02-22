#!/bin/bash

if [[  ! -e  "$HOME/sisop/modul1/nomor1/nature"  ]];
then 
   unzip -o $HOME/sisop/modul1/nomor1/nature.zip -d $HOME/sisop/modul1/nomor1/
fi

source=$HOME/sisop/modul1/nomor1/nature/*

if [[  ! -d  "$HOME/sisop/modul1/nomor1/naturedecrypt"  ]];
then 
   mkdir "$HOME/sisop/modul1/nomor1/naturedecrypt"
fi

target=$HOME/sisop/modul1/nomor1/naturedecrypt

ite=0
for image in $source
do
  base64 -d $image | xxd -r >> $target/"Decrypted"$ite.jpg
  let ite++
done

# Crontab
# 14 14 14 2 5 /bin/bash /home/aeris/sisop/modul1/nomor1/nomor1.sh