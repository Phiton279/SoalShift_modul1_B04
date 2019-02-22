#!bin/bash

chr() {
  printf "\\$(printf '%03o' "$1")"
}

jam=`date +%H`

fileName=`date '+%H:%M %d-%m-%Y'`

sysFile=`cat /var/log/syslog`

key1=`expr $jam + 98`
key2=`expr $jam + 97`

up=`chr $key1`
down=`chr $key2`

sysSave=`printf "$sysFile" | tr b-zaB-ZA $up-za-$down${up^^}-ZA-${down^^}`

printf "$sysSave" > "$fileName".txt

# Crontab
# 0 * * * * /bin/bash /home/aeris/sisop/modul1/nomor4/nomor4.sh