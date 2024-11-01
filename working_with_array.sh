#!/bin/bash

# Script Name: ping_ips.sh
# Author: ghassan
# Date: 19/10/2024
# Description: This script use an array of ip adress and pings them  and check logs whether each IP is reachable or unreachable.

# Array of IP addresses to ping
ip_addresses=("8.8.8.8" "192.168.1.1" "10.0.0.1" "8.8.4.4")

# Log file to store the results
log_file="ping_results.log"

# Function to ping an IP address and log the result
function ping_ip() {
    local ip=$1

    # Ping the IP address with 1 packet and a timeout of 2 seconds
    ping -c 1 -W 2 "$ip" > /dev/null 2>&1

    # Check if the ping was successful
    if [ $? -eq 0 ]; then
        echo "$(date): $ip is reachable" | tee -a "$log_file"
    else
        echo "$(date): $ip is unreachable" | tee -a "$log_file"
    fi
}

# Main loop to iterate over the array of IP addresses
echo "Starting to ping IP addresses..."
for ip in "${ip_addresses[@]}"; do
    ping_ip "$ip"
done

echo "Ping results have been logged to $log_file"
