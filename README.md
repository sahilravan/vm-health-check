VM Health Check Script
A shell script to analyze the health of Ubuntu virtual machines based on CPU, memory, and disk space utilization.

Description
This mini project provides a Bash script that monitors key system resources on Ubuntu virtual machines. The script checks CPU, memory, and disk utilization, then determines if the VM is healthy based on a 60% threshold. If any resource exceeds this threshold, the VM is considered "Not Healthy."

Features
Monitors three critical VM resources:
CPU utilization
Memory utilization
Disk space utilization
Simple "Healthy" or "Not Healthy" status reporting
Optional detailed explanation with the explain parameter
Specifically optimized for Ubuntu environments
How It Works
The script:

Collects resource utilization metrics using standard Linux commands
Applies a 60% threshold to each metric
Determines if any metrics exceed the threshold
Reports the overall health status
Provides detailed explanations when requested
Installation
Clone this repository or download the script file
Make the script executable:
bash
chmod +x vm_health_check.sh
Usage
Basic Check
For a simple health status report:

bash
./vm_health_check.sh
Example output:

VM Health Status: Healthy
Detailed Check
For detailed health information:

bash
./vm_health_check.sh explain
Example output:

VM Health Status: Not Healthy

Health Status Explanation:
-------------------------
CPU Usage: 45% (Threshold: 60%) - OK
Memory Usage: 72% (Threshold: 60%) - ALERT
Disk Usage: 55% (Threshold: 60%) - OK

Reason for Not Healthy status:
- Memory utilization exceeds the threshold of 60%

Recommendation: Consider optimizing resource usage or scaling up resources.
Requirements
Ubuntu operating system
Bash shell
Standard Ubuntu utilities: top, free, df, bc, awk, sed
Customization
To modify the threshold, edit the threshold variable in the script:

bash
# Set health status threshold
threshold=60  # Change to desired percentage
Project Structure
vm_health_check.sh - Main script file
README.md - Documentation
Future Enhancements
Support for additional Linux distributions
Configurable thresholds via command-line arguments
Email notifications for unhealthy status
Historical tracking of resource utilization
License
MIT License

