#!/bin/bash

# Code Fellows Resources:
    # [Bash Functions] - (https://ryanstutorials.net/bash-scripting-tutorial/bash-functions.php)
    # [Bash Tutoria] -(https://codefellows.github.io/ops-201-guide/curriculum/class-03/challenges/demo/bash.html)
    # [PowerShell Tutorial] - (https://codefellows.github.io/ops-201-guide/curriculum/class-03/challenges/demo/powershell.html)
   
# My Sources:
    # [Using Windows PowerShell scripts for task automation] (https://www.techtarget.com/searchitchannel/feature/Using-Windows-Powershell-scripts-for-task-automation)
    # [Guide to Automating Repetitive Tasks on Windows 10] (https://www.hongkiat.com/blog/automate-windows-10-repetitive-tasks/)

# Main

@echo off
setlocal

# Set the path to the source directory to be backed up
set source=C:\Users\username\Documents

# Set the path to the target directory where the backups will be stored
set target=D:\Backups

# Set the path to the Veeam executable
set veeam="C:\Program Files\Veeam\Endpoint Backup\Veeam.EndPoint.Manager.exe"

# Backup files modified in the last day
%veeam% backup files --mode=incremental --source=%source% --target=%target% --backupwhen=modified --backupdaycount=1

# Schedule the script with Windows Task Scheduler
schtasks /create /tn "Daily Backup" /tr "%~dp0backup.bat" /sc daily /st 23:55:00

# End of script



# Save the file with a .bat extension
# Open Windows Task Scheduler
# Click on "Create Basic Task" 
# Follow the steps to schedule the task to run daily at 11:55 PM.
# "Start a program" 
# Click "Finish" to create the scheduled task



# End
