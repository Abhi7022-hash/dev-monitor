#!/bin/bash
# Disk Monitor - checks disk space

THRESHOLD=80

echo "=== DISK USAGE ==="

df -h | grep -vE "tmpfs|udev" | tail -n +2 | while read line; do
    usage=$(echo $line | awk '{print $5}' | cut -d% -f1)
    partition=$(echo $line | awk '{print $6}')

    echo "Partition $partition: ${usage}% used"

    if [ "$usage" -ge "$THRESHOLD" ]; then
        echo "WARNING: $partition is above ${THRESHOLD}%!"
    fi
done
