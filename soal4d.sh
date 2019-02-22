#!/bin/bash

chr() {
  printf "\\$(printf '%03o' "$1")"
}

sysFile=`cat "$1$2"`
jam=`echo "$1" | awk -F: '{print $1}'`

key1=`expr $jam + 98`
key2=`expr $jam + 97`

up=`chr $key1`
down=`chr $key2`

sysSave=`printf "$sysFile" | tr $up-za-$down${up^^}-ZA-${down^^} b-zaB-ZA`

printf "$sysSave"

# Crontab
# 0 * * * * /bin/bash /home/aeris/sisop/modul1/nomor4/nomor4.sh