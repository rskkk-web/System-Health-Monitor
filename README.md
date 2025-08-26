  
This project is a **lightweight System Monitoring script** written in Bash. It provides real-time checks for CPU, memory, and disk usage, uptime reporting, logging with rotation, and configurable email alerts for exceeding set thresholds. 

The script is designed with modular functions and professional Bash practices, making it clean, maintainable, and easy to extend. It’s a good fit for **DevOps engineers, sysadmins, or anyone who wants a simple alternative to heavy monitoring agents**.  

**Features**
- **System Monitoring** – Tracks CPU, memory, disk usage, and uptime in real-time.  
- **Modular Functions** – Each check (CPU, memory, etc.) is implemented as its own function for clarity and reusability.  
- **Customizable Thresholds** – Easily configure alert levels, log file options, and email addresses through top-level variables.  
- **Smart Logging with Rotation** – Keeps timestamped records while preventing oversized log files.  
- **Automated Alerts** – Sends email notifications when CPU/disk usage goes beyond defined thresholds.  
- **Advanced Bash Practices** – Includes quoting, function-local variables, safe arithmetic, and robust error handling for portability.  

**Usage**
1. Open the script and configure the settings at the top for your environment:  
   - `CPU_THRESHOLD` (percent)  
   - `DISK_THRESHOLD` (percent)  
   - `LOG_FILE` (path to log file)  
   - `ALERT_EMAIL` (notification email address)  
   - `MAX_LOG_SIZE` (max log file size in bytes)  
   - `ENABLE_ALERTS` (true/false)  

2. Make the script executable and run it with required permissions:  
   ```bash
   chmod +x syshealth.sh  
   ./syshealth.sh
   ```

**Techniques & Best Practices Used**
- **Function Modularity** – Clear separation of monitoring and utility logic.  
- **Configurable Parameters** – Change behavior without editing the script’s core logic.  
- **Log Rotation** – Prevents the log file from growing endlessly during continuous use.  
- **Colorized Terminal Output** – ANSI escape sequences for readable, user-friendly CLI output.  
- **Safe Arithmetic & Comparisons** – Ensures accuracy (even for non-integer values).  
- **Inline Documentation** – Key parts of the script are explained with comments for long-term maintainability.  
- **Email Alerts** – Built-in notification system using the `mail` command.  

