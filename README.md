# 🩺 VM Health Check Script: Your Ubuntu VM's Guardian Angel 👼

Is your Ubuntu VM silently struggling? 😱 Don't let resource bottlenecks turn into full-blown disasters! 🔥
This Bash script acts as a vigilant guardian, constantly monitoring the pulse of your Ubuntu virtual machines. Get instant insights into CPU, memory, and disk utilization, and proactively address potential issues before they escalate. 🚀

## ✨ Key Features: Effortless VM Monitoring

* ⚡️ Lightning-Fast Health Checks: Get a clear "Healthy" or "Not Healthy" status in seconds.
* 🔍 Sherlock-Level Diagnostics: Dive deep with the `explain` parameter for detailed resource utilization breakdowns.
* 🎯 Ubuntu-Optimized: Crafted specifically for Ubuntu VMs, ensuring pinpoint accuracy.
* 🛠️ Ridiculously Simple Setup: Clone, execute, and GO! No complex configurations needed.

## 🚀 Getting Started: Empower Your VMs in Minutes

### 🛠️ Installation: Just a Few Commands Away

1.  **Clone the Magic:**
    ```bash
    git clone [https://github.com/sahilravan/vm-health-check.git](https://github.com/sahilravan/vm-health-check.git) && cd vm-health-check
    ```
2.  **Make it Run:**
    ```bash
    chmod +x vm_health_check.sh
    ```

### 🎯 Usage: Instant Health Insights

#### ⚡️ Basic Usage: Quick Check

Run the script for a simple "Healthy" or "Not Healthy" status:

```bash
./vm_health_check.sh
```
![image](https://github.com/user-attachments/assets/3f5b285d-9e09-420c-bf27-ebaab6ca51f1)


⚙️ How It Works: The Brains Behind the Operation
The script intelligently monitors:

🧠 CPU Utilization: Percentage of CPU currently in use.

💾 Memory Utilization: Percentage of RAM currently in use.

💽 Disk Utilization: Percentage of root filesystem space currently in use.


If any of these resources exceed 60% utilization, the VM is flagged as "Not Healthy."

🔧 Customization: Tailor to Your Needs
You can easily adjust the threshold by modifying the threshold variable within the script:

```bash
threshold=60 # Change this to your desired percentage
```

Let's keep our VMs healthy and happy! 🌟
