# Frequent Linux Commands Cheat Sheet

This file covers commonly used Linux commands to help you navigate and manage the system efficiently.

---

## Navigation & Filesystem

- pwd  
  Print the current working directory path.

- ls  
  List directory contents.
Example: `ls -a` (show hidden files).

- cd (directory)  
Change the current directory.

- mkdir (directory)  
Create a new directory.

- rmdir (directory) 
Remove an empty directory.

- rm -r (directory)
Remove a directory and its contents recursively.

---

## File Operations

- touch (file)  
Create an empty file or update its timestamp.

- cat (file)  
Display the contents of a file.

- echo "text" > (file)  
Write text to a file (overwrites existing content).

- echo "text" >> (file)
Append text to a file.

- cp (source) (destination)  
Copy files or directories.  
Use `cp -r` for directories.

- mv (source) (destination)  
Move or rename files and directories.

- rm (file)  
Delete a file.

---

## File Viewing & Searching

- head (file)  
View the first 10 lines of a file.

- tail (file)  
View the last 10 lines of a file.

- head -n 5 (file)  
View first 5 lines.

- tail -n 5 (file)  
View last 5 lines.

- grep "pattern" (file)  
Search for a pattern in a file.

---

## Permissions & Ownership

- chmod (permissions) (file)  
Change file permissions (e.g., `chmod 755 script.sh`).

- chown (user):(group) (file)  
Change file owner and group.

---

## Process & System Info

- ps aux  
View all running processes.

- top 
Real-time system monitoring of processes.

- lsof  
List open files.

---

## Shell & Environment

- echo $SHELL  
Show current shell.

- alias name='command'  
Create command shortcuts.

- export VAR=value
Set environment variables temporarily.

---

## Miscellaneous

- man (command)  
Show the manual page for a command.

- clear  
Clear the terminal screen.
