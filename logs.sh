#!/bin/bash

LOG_FILE="/home/ubuntu/nginx.log"   # fixed path to log file

if [ ! -f "$LOG_FILE" ]; then
  echo "❌ Log file not found!"
  exit 1
fi

echo "🔹 Top 5 IP addresses:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -5
echo

echo "🔹 Top 5 requested URLs:"
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -5
echo

echo "🔹 Top 5 status codes:"
awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -5
echo

echo "🔹 Top 5 User Agents:"
awk -F\" '{print $6}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -5
