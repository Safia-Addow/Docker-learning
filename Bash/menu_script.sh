#!/bin/bash

Options () {
    directory=$1

    options=("Check disk space in $directory" "Show system uptime" "Backup Arena directory" "Parse configuration file" "Quit")

    PS3="Select an option (1/2/3/4/5): "

    select choice in "${options[@]}"
    do
        case "$choice" in
            "Check disk space in $directory")
                disk_space=$(du -sh "$directory" 2>/dev/null)
                echo "Disk space in $directory is: $disk_space"
                ;;
            "Show system uptime")
                echo "Uptime is: $(uptime)"
                ;;
            "Backup Arena directory")
                mkdir -p ~/BackupArena
                rsync -av ~/Arena_Boss/ ~/BackupArena/Arena_Boss_$(date +%F_%H-%M-%S)/
                ls -dt ~/BackupArena/Arena_Boss_* 2>/dev/null | tail -n +4 | xargs rm -rf
                ;;
            "Parse configuration file")
                CONFIG_FILE="/etc/sysctl.d/50-cloudimg-settings.conf"
                if [ -f "$CONFIG_FILE" ]; then
                    while IFS= read -r line; do
                        echo "KEY:VALUE: $line"
                    done < "$CONFIG_FILE"
                else
                    echo "Configuration file not found: $CONFIG_FILE"
                fi
                ;;
            "Quit")
                echo "Exiting..."
                break
                ;;
            *)
                echo "Invalid option. Try again!"
                ;;
        esac
    done
}  # <-- this was missing

# Run the function with a directory argument
Options ~

