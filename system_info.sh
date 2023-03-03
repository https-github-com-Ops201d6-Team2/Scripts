#!/bin/bash

# Code Fellows Resources:
    # [Linux lshw Command Tutorial for Beginners] (https://www.howtoforge.com/linux-lshw-command/)
    # [How to Use the Linux Grep Command] (https://careerkarma.com/blog/linux-grep-command/)
    # [Pipelines] (https://codefellows.github.io/ops-201-guide/curriculum/class-07/challenges/demo/bash.html)
# Sources:
    # [how to grep and print the next N lines after the hit?] (https://superuser.com/questions/298123/how-to-grep-and-print-the-next-n-lines-after-the-hit)
    # [How to Grep Multiple Patterns – Syntax] (https://phoenixnap.com/kb/grep-multiple-strings)
    # [lshw command in Linux with Examples] (https://www.geeksforgeeks.org/lshw-command-in-linux-with-examples/)
    # [Sed Command to Delete a Line] (https://linuxhint.com/sed-command-to-delete-a-line/)
    # [How to Get Hardware Information with Dmidecode Command on Linux] (https://www.tecmint.com/how-to-get-hardware-information-with-dmidecode-command-on-linux/)

# Main

clear
echo "";
echo "The name of this computer is '"$(hostname)"'";

while true
do
        echo "";
        echo "Make a selection for detailed information:";

        echo "Type 'exit' to exit";
        echo "";
        echo "1) CPU";
        echo "2) RAM";
        echo "3) Display Adapter";
        echo "4) Network Adapter";
        echo "5) BIOS Info";
        echo "6) System Info";
        echo "7) Motherboard Info";
        echo "8) Chassis Info";
        echo "";
        read system_component
        echo "";

        if [[ $system_component == "exit" ]]; then
            echo "system_info.sh exited successfully!"
            echo "";
            exit
        elif [[ $system_component == "1" ]]; then
            sudo lshw -C cpu | head -n 7 | sed '/bus info/{n;d;}'
        elif [[ $system_component == "2" ]]; then
            sudo lshw -C memory | tail -n 4
        elif [[ $system_component == "3" ]]; then
            sudo lshw -C display | sed '/bus info/{n;d;}' | sed '/bus info/{n;d;}'
        elif [[ $system_component == "4" ]]; then
            sudo lshw -C network
        elif [[ $system_component == "5" ]]; then
            sudo dmidecode -t bios | tail -n 16
        elif [[ $system_component == "6" ]]; then
            sudo dmidecode -t system | tail -n 10
        elif [[ $system_component == "7" ]]; then
            sudo dmidecode -t baseboard | tail -n 13
        elif [[ $system_component == "8" ]]; then
            sudo dmidecode -t chassis | tail -n 12
        else
            echo "Invalid Selection Input! Try Again!"
        fi
done

# End
