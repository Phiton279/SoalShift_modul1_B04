#!/bin/bash

if [[  ! -d  "$HOME/modul1"  ]];
then 
   mkdir "$HOME/modul1"
fi

awk 'tolower($0) ~ /cron/ && tolower($0) !~ /sudo/ && NF < 13 {print $0}' /var/log/syslog >> $HOME/modul1/logno5.txt

# Crontab
# 2-30/6 * * * *   /bin/bash /home/aeris/sisop/modul1/nomor5/nomor5.sh