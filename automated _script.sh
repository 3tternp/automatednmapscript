#!/bin/bash

while true; 
do
    echo -e "\033[38m"
    echo -e "Choose the operation you want to perform?"
    echo -e "\033[31m1. DNS_cache_snoop"
    echo -e "\033[32m2. Poodle"
    echo -e "\033[33m3. sweet32"
    echo -e "\033[34m4. SSL drown"
    echo -e "\033[35m5. SSL-cert scan"
    echo -e "\033[32m6. SMB signing Disabled"
    echo -e "\033[34m7. SMB OS Discovered"
    echo -e "\033[33m8. IP forwarding Enabled"
    echo -e "\033[34m9. MySQL enum"
    echo -e "\033[35m10. rexecd service"
    echo -e "\033[36m11. rlogin service"
    echo -e "\033[35m12. firewall bypass"
    echo -e "\033[36m13. Conficker worm detection"
    echo -e "\033[32m14. Mongo DB info"
    echo -e "\033[36m15. MSsql info"
    echo -e "\033[31m16. smtp enum"
    echo -e "\033[36m17. RDP enum"
    echo -e "18. SMB system info"
    echo -e "19. MSSQL config"
    echo -e "20. MSSQL hash dump"
    echo -e "21. SMB Unprivileged Access"
    echo -e "22. NTP mode 6 Scanner"
    echo -e "23. NTP moonlight"
    echo -e "\033[35m24. oracle TNS poisoning"
    echo -e "\033[34m25. XDMCP Discover"
    echo -e "\033[36m26. SSH weak hashing algorithm"
    echo -e "\033[36m27. Check all the CVE vulnerabilities"
    echo -e "\033[39mEnter your choice: $count"

    read -r count

    case $count in
        1)
            read -p "Enter IP address: " ip
            sudo nmap -sU -p 53 --script dns-cache-snoop.nse --script-args 'dns-cache-snoop.mode=timed' "$ip"
            ;;
        2)
            read -p "Enter port: " port
            read -p "Enter IP address: " IP
            sudo nmap -sV --version-light --script ssl-poodle -p "$port" "$IP"
            ;;
        3)
            read -p "Enter port: " port
            read -p "Enter IP address: " IP
            sudo nmap -sV --script ssl-enum-ciphers -p "$port" "$IP"
            ;;
        4)
            read -p "Enter IP address: " IP
            sudo nmap -sV --script=sslv2-drown "$IP"
            ;;
        5)
            read -p "Enter IP address: " IP
            sudo nmap -sV -sC "$IP"
            ;;
        6)
            read -p "Enter IP address: " IP
            sudo nmap --script smb-security-mode.nse -p 445 "$IP"
            ;;
        7)
            read -p "Enter IP address: " IP
            sudo nmap --script smb-os-discovery.nse -p 445 "$IP"
            ;;
        8)
            read -p "Enter IP address: " IP
            sudo nmap -sn "$IP" --script ip-forwarding --script-args='target=www.google.com'
            ;;
        9)
            read -p "Enter IP address: " IP
            sudo nmap --script=mysql-enum "$IP"
            ;;
        10)
            read -p "Enter IP address: " IP
            sudo nmap -p 512 --script rexec-brute "$IP"
            ;;
        11)
            read -p "Enter IP address: " IP
            sudo nmap -p 513 --script rlogin-brute "$IP"
            ;;
        12)
            read -p "Enter port: " port
            read -p "Enter IP address: " IP
            sudo nmap --script firewall-bypass "$port" "$IP"
            ;;
        13)
            read -p "Enter IP address: " IP
            sudo nmap --script smb-vuln-conficker.nse -p 445 "$IP"
            ;;
        14)
            read -p "Enter IP address: " IP
            sudo nmap -p 27017 --script mongodb-info "$IP"
            ;;
        15)
            read -p "Enter IP address: " IP
            sudo nmap -p 1433 --script ms-sql-info --script-args mssql.instance-port=1433 "$IP"
            ;;
        16)
            read -p "Enter port: " port
            read -p "Enter IP address: " IP
            sudo nmap --script smtp-enum-users.nse -p "$port" "$IP"
            ;;
        17)
            read -p "Enter IP address: " IP
            sudo nmap -p 3389 --script rdp-enum-encryption "$IP"
            ;;
        18)
            read -p "Enter IP address: " IP
            sudo nmap --script smb-system-info.nse -p 445 "$IP"
            ;;
        19)
            read -p "Enter IP address: " IP
            sudo nmap -p 1433 --script ms-sql-config --script-args mssql.username=sa,mssql.password=admin123 "$IP"
            ;;
        20)
            read -p "Enter IP address: " IP
            sudo nmap -p 1433 --script ms-sql-dump-hashes --script-args mssql.username=sa,mssql.password=admin123 "$IP"
            ;;
        21)
            read -p "Enter IP address: " IP
            sudo smbmap -u anonymous -p anonymous -d WORKGROUP -H "$IP"
            ;;
        22)
            read -p "Enter IP address: " IP
            sudo nmap -sU -p 123 --script ntp-info "$IP"
            ;;
        23)
            read -p "Enter IP address: " IP
            sudo nmap -sU -pU:123 -Pn -n --script=ntp-monlist "$IP"
            ;;
        24)
            read -p "Enter port: " port
            read -p "Enter IP address: " IP
            sudo nmap --script=oracle-tns-poison -p "$port" "$IP"
            ;;
        25)
            read -p "Enter IP address: " ip
            sudo nmap -sU -p 177 --script xdmcp-discover "$ip"
            ;;
        26)
            read -p "Enter IP address: " ip
            sudo nmap -Pn -p 22 --script ssh2-enum-algos "$ip"
            ;;
        27)
            read -p "Enter IP address: " ip
            sudo nmap -sV --script vulners "$ip"
            ;;
        *)
            echo "You are out of stock"
            ;;
    esac
done
