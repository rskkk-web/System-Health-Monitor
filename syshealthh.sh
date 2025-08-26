#!/bin/bash

# ---- CONFIGURATION ----
CPU_THRESHOLD=80         # Alert when CPU usage > 80%
DISK_THRESHOLD=90        # Alert when Disk usage > 90%
LOG_FILE="/home/jojo/syshealth.log"
ALERT_EMAIL="your_email@gmail.com"
MAX_LOG_SIZE=1000000     # 1mb in bytes
ENABLE_ALERTS=true


# ---- To customize Output ----
green="\e[32m"
red="\e[31m"
yellow="\e[33m"
no_color="\e[0m"


# ---- Functions ----
get_cpu_usage() {
    local usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100-$8}')
    echo "$usage"
}

get_mem_usage() {
    local usage=$(free -m | awk 'NR==2 {printf "%.2f", $3*100/$2}')
    echo "$usage"
}

get_disk_usage() {
    local usage=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
    echo "$usage"
}

get_uptime() {
    local up=$(uptime -p)
    echo "$up"
}


# ---- Print Health Status ----
print_status() {
    echo -e "${yellow}------SYSTEM HEALTH CHECK------${no_color}"
    echo -e "$green CPU Usage    :$no_color $1%"
    echo -e "$green Memory Usage :$no_color $2%"
    echo -e "$green Disk Usage   :$no_color $3%"
    echo -e "$green Uptime       :$no_color $4"
}


# -- Function: Log to file --
log_status() {
    local timestamp=$(date +"[%Y-%m-%d %H:%M:%S]")
    echo "$timestamp CPU:$1% MEM:$2% DISK:$3% UPTIME:$4" >> $LOG_FILE
}


# -- Function: Send Alert --
send_alert() {
    local type=$1
    local message=$2
    echo -e "\a$type alert: $red $message $no_color"
    echo "$message" | mail -s "ALERT: $type" $ALERT_EMAIL
}


# ---- Main script logic ----
cpu=$(get_cpu_usage)
mem=$(get_mem_usage)
disk=$(get_disk_usage)
up=$(get_uptime)


print_status "$cpu" "$mem" "$disk" "$up"
log_status "$cpu" "$mem" "$disk" "$up"


# --- Log Rotation to avoid huge log file over time ---
if [[ -f "$LOG_FILE" && $(stat -c%s "$LOG_FILE") -ge $MAX_LOG_SIZE ]]; then
	mv "$LOG_FILE" "$LOG_FILE.$(date +'%Y-%m-%d_%H:%M:%S').old"
        touch "$LOG_FILE"
fi


# ---ALERTS---
if [[ "$ENABLE_ALERTS" == true ]] && (( $(echo "$cpu > $CPU_THRESHOLD" | bc -l) )); then
    send_alert "CPU" "High CPU Usage: $cpu%"
fi

if [[ "$ENABLE_ALERTS" == true ]] && (( $(echo "$disk > $DISK_THRESHOLD" | bc -l) )); then
    send_alert "Disk" "Disk space is full: $disk%"
fi

