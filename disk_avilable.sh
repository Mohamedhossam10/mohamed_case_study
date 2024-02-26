#!/bin/bash
threshold=10
TIMESTAMP=$(date "+%Y%m%d%H%M%S")

disk_space=$(df / | awk 'NR==2 {print $4/$2 * 100.0}')

if [[ $disk_space < $threshold ]]; then
    touch C:/Users/in/Desktop/anmulies_check/$TIMESTAMP"_disk_available_logs".log
    echo "$(date): disk_space=$disk_space" > C:/Users/in/Desktop/anmulies_check/$TIMESTAMP"_disk_available_logs".log

fi