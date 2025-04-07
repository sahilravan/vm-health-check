#!/bin/bash

# vm_health_check.sh - Virtual Machine Health Check Script
# This script checks CPU, memory, and disk utilization on an Ubuntu VM
# and reports whether the system is healthy based on a 60% threshold

# Function to display usage information
usage() {
    echo "Usage: $0 [explain]"
    echo "Options:"
    echo "  explain    Display detailed explanation of health status"
    exit 1
}

# Function to get CPU utilization percentage
get_cpu_usage() {
    # Get CPU idle percentage and subtract from 100 to get utilization
    cpu_idle=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}')
    cpu_usage=$(echo "100 - $cpu_idle" | bc)
    # Round to integer
    printf "%.0f" $cpu_usage
}

# Function to get memory utilization percentage
get_memory_usage() {
    # Use free command to get memory stats
    memory_info=$(free | grep Mem)
    total_memory=$(echo $memory_info | awk '{print $2}')
    used_memory=$(echo $memory_info | awk '{print $3}')
    memory_usage=$(echo "scale=2; $used_memory * 100 / $total_memory" | bc)
    # Round to integer
    printf "%.0f" $memory_usage
}

# Function to get disk utilization percentage
get_disk_usage() {
    # Get usage of root filesystem
    disk_usage=$(df -h / | grep / | awk '{print $5}' | sed 's/%//')
    echo $disk_usage
}

# Check if explain parameter is passed
explain=false
if [ "$1" == "explain" ]; then
    explain=true
elif [ "$1" != "" ]; then
    usage
fi

# Get utilization values
cpu_usage=$(get_cpu_usage)
memory_usage=$(get_memory_usage)
disk_usage=$(get_disk_usage)

# Set health status threshold
threshold=60

# Initialize health status
health_status="Healthy"

# Check if any utilization exceeds threshold
cpu_healthy=true
memory_healthy=true
disk_healthy=true

if [ "$cpu_usage" -ge "$threshold" ]; then
    health_status="Not Healthy"
    cpu_healthy=false
fi

if [ "$memory_usage" -ge "$threshold" ]; then
    health_status="Not Healthy"
    memory_healthy=false
fi

if [ "$disk_usage" -ge "$threshold" ]; then
    health_status="Not Healthy"
    disk_healthy=false
fi

# Display basic health status
echo "VM Health Status: $health_status"

# Display detailed explanation if requested
if [ "$explain" = true ]; then
    echo ""
    echo "Health Status Explanation:"
    echo "-------------------------"
    echo "CPU Usage: ${cpu_usage}% (Threshold: ${threshold}%) - $([ "$cpu_healthy" = true ] && echo "OK" || echo "ALERT")"
    echo "Memory Usage: ${memory_usage}% (Threshold: ${threshold}%) - $([ "$memory_healthy" = true ] && echo "OK" || echo "ALERT")"
    echo "Disk Usage: ${disk_usage}% (Threshold: ${threshold}%) - $([ "$disk_healthy" = true ] && echo "OK" || echo "ALERT")"
    echo ""
    
    if [ "$health_status" = "Not Healthy" ]; then
        echo "Reason for Not Healthy status:"
        [ "$cpu_healthy" = false ] && echo "- CPU utilization exceeds the threshold of ${threshold}%"
        [ "$memory_healthy" = false ] && echo "- Memory utilization exceeds the threshold of ${threshold}%"
        [ "$disk_healthy" = false ] && echo "- Disk utilization exceeds the threshold of ${threshold}%"
        echo ""
        echo "Recommendation: Consider optimizing resource usage or scaling up resources."
    else
        echo "All system resources are under the threshold of ${threshold}%."
    fi
fi

exit 0
