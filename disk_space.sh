#!/bin/bash


THRESHOLD=90
TIMESTAMP=$(date "+%Y%m%d%H%M%S")

DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | cut -d'%' -f1)


if [ $DISK_USAGE -gt $THRESHOLD ]; then
    
    ALERT_MESSAGE="Disk space alert: Current usage is $DISK_USAGE%"
     
    echo "$(date): $ALERT_MESSAGE" > C:/Users/in/Desktop/disk_space/$TIMESTAMP"_logs".log

fi
