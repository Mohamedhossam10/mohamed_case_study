#!/bin/bash
TIMESTAMP=$(date "+%Y%m%d%H%M%S")

log_file="C:/Users/in/Desktop/anmulies_check/$TIMESTAMP _sudden_increace.log"


threshold_increase=20


echo "$(date): Starting memory monitoring" >> "$log_file"


initial_memory=$(df -h / | awk 'NR==2 {print $5}' | cut -d'%' -f1)


sleep 5


current_memory=$(df -h / | awk 'NR==2 {print $5}' | cut -d'%' -f1)


percentage_increase=$(( ((current_memory - initial_memory) * 100) / initial_memory ))


echo "$(date): Memory usage increase: $percentage_increase %" >> "$log_file"


if [ $percentage_increase -gt $threshold_increase ]; then
    
    echo "$(date): Abnormal increase in memory consumption. Change: $percentage_increase %" >> "$log_file"
    
fi


echo "$(date): Memory monitoring complete" >> "$log_file"
