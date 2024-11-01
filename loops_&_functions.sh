#!/bin/bash

# Script Name: services_monitor.sh
# Author: ghassan
# Date: 19/10/2024
# Description: making this script that checks if certain services (Apache, MySQL, SSH) are running.
#              If a service is not active, it restarts the service and logs the actions.

#list of services to check
services=("apache2" "mysql" "ssh")

#function to check the status of a service and restart if not active
check_and_restart_service() {
    local service=$1

    #Check if the service is active
    service_status=$(systemctl is-active "$service")

    if [ "$service_status" != "active" ]; then
        echo "$(date): $service is not running. Attempting to restart..."
        
        #try to restart the service
        systemctl restart "$service"
        
        #check if the restart was successful
        if [ $? -eq 0 ]; then
            echo "$(date): Successfully restarted $service."
        else
            echo "$(date): Failed to restart $service."
        fi
    else
        echo "$(date): $service is running normally."
    fi
}

# Main loop to iterate over the list of services
for service in "${services[@]}"; do
    check_and_restart_service "$service"
done
