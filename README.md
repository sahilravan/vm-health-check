VM Health Check Script A Bash script for monitoring the health of Ubuntu virtual machines based on CPU, memory, and disk utilization.

Overview This script checks the current utilization of system resources (CPU, memory, and disk space) on an Ubuntu virtual machine and determines if the system is healthy based on a 60% utilization threshold. If any of the monitored resources exceed this threshold, the system is considered unhealthy.

Features Monitors CPU, memory, and disk utilization Provides simple "Healthy" or "Not Healthy" status output Optional detailed explanation of health status with the explain parameter Specifically designed for Ubuntu virtual machines Requirements Ubuntu operating system Bash shell Basic utilities: top, free, df, bc, awk, sed Installation Clone this repository or download the script: bash git clone https://github.com/yourusername/vm-health-check.git cd vm-health-check Make the script executable: bash chmod +x vm_health_check.sh Usage Basic Usage Run the script without any parameters to get a simple health status:

bash ./vm_health_check.sh 

Example output:

VM Health Status: Healthy Detailed Explanation Add the explain parameter to get detailed information about the health status:

bash ./vm_health_check.sh explain 

Example output:

VM Health Status: Not Healthy

Health Status Explanation:
CPU Usage: 45% (Threshold: 60%) - OK Memory Usage: 72% (Threshold: 60%) - ALERT Disk Usage: 55% (Threshold: 60%) - OK

Reason for Not Healthy status:

Memory utilization exceeds the threshold of 60%
Recommendation: Consider optimizing resource usage or scaling up resources. How It Works The script determines health status based on these criteria:

CPU utilization: Percentage of CPU currently in use Memory utilization: Percentage of RAM currently in use Disk utilization: Percentage of root filesystem space currently in use If any of these resources exceeds 60% utilization, the VM is considered "Not Healthy."

Customization You can modify the threshold value by changing the threshold variable in the script:

bash

Set health status threshold
threshold=60 # Change this to your desired percentage License MIT License

Contributing Contributions are welcome! Please feel free to submit a Pull Request.
