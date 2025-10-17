# 📌 Challenge: Bash Menu Script

Create a Bash script that:

1. Presents a menu to the user with the following options:
2. Check disk space
3. Show system uptime
4. Backup the Arena directory and keep the last 3 backups
5. Parse a configuration file settings.conf and display the values

Executes the chosen task.

```bash
Script:

#!/bin/bash

Options () {
directory=$1

options=("Check disk space in $directory" "Show system uptime" "Backup Arena directory" "Parse configuration file" "Quit")

PS3="Select an option (1/2/3/4/5): "

select choice in "${options[@]}"
do
    case "$choice" in
          "Check disk space in $directory")
             disk_space=$(du -sh "$directory")
             echo "Disk space in $directory is: $disk_space"
             ;;
          "Show system uptime")
             echo "Uptime is: $(uptime)"
             ;;
          "Backup Arena directory")
             rsync -av ~/Arena_boss/ ~/BackupArena/Arena_boss_$(date +%F_%H-%M-%S)/
             ls -dt ~/BackupArena/Arena_boss_* | tail -n +4 | xargs rm -rf
             ;;
          "Parse configuration file")
             cat /etc/sysctl.d/50-cloudimg-settings.conf | while IFS= read -r line; do
                 echo "KEY:VALUE: $line"
             done
             ;;
          "Quit")
             echo "Exiting.."
             break
             ;;
          *)
             echo "Invalid option. Try again!"
             ;;
    esac
done
```
