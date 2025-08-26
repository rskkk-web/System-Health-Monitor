
**This project** is a lightweight **System Monitoring script** written in **Bash**. It provides **real-time checks** for **CPU, memory, and disk usage**, **uptime reporting**, **logging with rotation**, and **configurable email alerts** for exceeding set thresholds.  
The script is designed with **modular functions** and **professional Bash practices**, making it **clean, maintainable, and easy to extend**. It’s a great fit for **DevOps engineers, sysadmins**, or anyone who wants a **simple alternative to heavy monitoring agents**.  

 **Features**
- **System Monitoring** – Tracks **CPU**, **memory**, **disk usage**, and **uptime** in real- time.  
- **Modular Functions** – Each check (**CPU, memory, etc.**) is implemented as its own function for clarity and reusability.  
- **Customizable Thresholds** – Configure **alert levels, log file options, and email addresses** via top-level variables.  
- **Smart Logging with Rotation** – Maintains **timestamped logs** while preventing oversized log files.  
- **Automated Alerts** – Sends **email notifications** when **CPU/disk usage** exceeds defined thresholds.  
- **Advanced Bash Practices** – Includes **quoting, function-local variables, safe arithmetic, and robust error handling** for portability.  

**Usage**
1. **Set configuration options** at the top of the script for your environment:  
   ```bash
   CPU_THRESHOLD=80         # Percent
   DISK_THRESHOLD=90        # Percent
   LOG_FILE="/home/user/syshealth.log"
   ALERT_EMAIL="your_email@example.com"
   MAX_LOG_SIZE=1000000     # Max log file size in bytes
   ENABLE_ALERTS=true
````

2. **Make the script executable and run it**:

   ```bash
   chmod +x syshealth.sh
   ./syshealth.sh
   ```

 **Techniques & Best Practices Used**
**Function Modularity** – Clear separation of monitoring and utility logic.
**Configurable Parameters** – Change behavior without altering the script’s core logic.
**Log Rotation** – Automatically prevents the log file from growing endlessly.
**Colorized Terminal Output** – Uses **ANSI escape sequences** for user-friendly CLI display.
**Safe Arithmetic & Comparisons** – Supports non-integer values using `bc` and proper checks.
**Inline Documentation** – Key parts of the script are well-commented for maintainability.
**Email Alerts** – Integrated notification system using the `mail` command.
