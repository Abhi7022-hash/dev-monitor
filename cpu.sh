#!/bin/bash
# this script is for monitoring the cpu usage it will warn if the usage is high
THRESHLOD=80 
cpu-usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d. -f1)
echo "Cpu usage: ${cpu-usage}"

if [ "cpu-usage" -gt "$THRESHOLD" ];
then
	echo "waning! , cpu usage is high"
else
	echo "Cpu is nomal"
fi
