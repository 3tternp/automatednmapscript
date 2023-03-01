#!/bin/bash

while true ;
do
echo -e "\033[30m"
echo -e "Choose the operation you want to  perform ? ""\033[31m"
echo -e "1. DNS_cache_snoop " "\033[32m"
echo -e "2. Poodle " "\033[33m"
echo -e "3. sweet32 " "\033[39m"
echo -e "4. SSL drown  ""\033[34m"
echo -e "5. SSL-cert scan ""\033[35m"
echo -e "6. SMB signing Disabled ""\033[32m"
echo -e "7. SMB OS Discovered " "\033[34m"
echo -e "8. IP forwarding Enabled " "\033[33m"
echo -e "9. MySQL enum" "\033[34m"
echo -e "10. rexecd service ""\033[35m"
echo -e "11. rlogin service""\033[36m"
echo -e "12. firewall bypass""\033[35m"
echo -e "13. Conficker worm detection""\033[36m"
echo -e "14. Mongo DB info""\033[32m"
echo -e "15. MSsql info""\033[36m"
echo -e "16. smtp enum""\033[31m"
echo -e "17. RDP enum""\033[36m"
echo -e "18. SMB system info"
echo -e "19. MSSQL config"
echo -e "20. MSSQL hash dump"
echo -e "21. SMB Unprivilleged Access"
echo -e "22. NTP mode 6 Scanner"
echo -e "23. NTP moonlight "
echo -e "24. oracle TNS poisoning:""\033[35m"
echo -e "25. XDMCP Discover: ""\033[34m"
echo -e "26. SSH weak hashing algorithm""\033[36m"
echo -e "27. Check all the CVE vulnerabilities""\033[36m"
echo -e "Enter your  choice : $count""\033[39m"

read count
if [ $count -eq 1 ]
then
read -p "nmap -sU -p 53 --script dns-cache-snoop.nse --script-args 'dns-cache-snoop.mode=timed' " ip
nmap -sU -p 53 --script dns-cache-snoop.nse --script-args 'dns-cache-snoop.mode=timed' $ip
exit

elif [ $count -eq 2 ]
then
read -p "nmap -sV --version-light --script ssl-poodle -p " port
read -p "nmap -sV --version-light --script ssl-poodle -p $port " IP
nmap -sV --version-light --script ssl-poodle -p $port $IP
exit

elif [ $count -eq 3 ]
then 
read -p "nmap -sV --script ssl-enum-ciphers -p " port
read -p "nmap -sV --script ssl-enum-ciphers -p $port" IP
nmap -sV --script ssl-enum-ciphers -p $port $IP
exit

elif [ $count -eq 4 ]
then 
read -p "nmap -sV --script=sslv2-drown " IP
nmap -sV --script=sslv2-drown $IP
exit

elif [ $count -eq 5 ]
then 
read -p "nmap -sV -sC " IP
nmap -sV -sC $IP
exit

elif [ $count -eq 6 ]
then 
read -p "nmap --script smb-security-mode.nse -p 445 " IP
nmap --script smb-security-mode.nse -p 445 $IP 
exit

elif [ $count -eq 7 ]
then 
read -p "nmap --script smb-os-discovery.nse -p 445 " IP
nmap --script smb-os-discovery.nse -p 445 $IP 
exit

elif [ $count -eq 8 ]
then 
read -p "nmap -sn targeted IP --script ip-forwarding --script-args='target=www.google.com'" IP
nmap -sn $IP --script ip-forwarding --script-args='target=www.google.com'
exit

elif [ $count -eq 9 ]
then 
read -p "nmap --script=mysql-enum " IP
nmap --script=mysql-enum  $IP 
exit

elif [ $count -eq 10 ]
then 
read -p "nmap -p 512 --script rexec-brute " IP
nmap -p 512 --script rexec-brute  $IP 
exit

elif [ $count -eq 11 ]
then 
read -p "nmap -p 513 --script rlogin-brute " IP
nmap -p 513 --script rlogin-brute  $IP 
exit

elif [ $count -eq 12 ]
then 
read -p "nmap --script firewall-bypass " port
read -p "nmap --script firewall-bypass $port " IP
nmap --script firewall-bypass $port $IP
exit

elif [ $count -eq 13 ]
then 
read -p "nmap --script smb-vuln-conficker.nse -p 445" IP 
nmap --script smb-vuln-conficker.nse -p 445  $IP
exit
elif [ $count -eq 14 ]
then 
read -p "nmap -p 27017 --script mongodb-info" IP 
nmap -p 27017 --script mongodb-info  $IP
exit
elif [ $count -eq 15 ]
then 
read -p "nmap -p 1433 --script ms-sql-info --script-args mssql.instance-port=1433" IP 
nmap -p 1433 --script ms-sql-info --script-args mssql.instance-port=1433 $IP
exit
elif [ $count -eq 16 ]
then 
read -p "nmap --script smtp-enum-users.nse" port 
read -p "nmap --script smtp-enum-users.nse $port" IP 
nmap --script smtp-enum-users.nse -p $port  $IP
exit
elif [ $count -eq 17 ]
then 
read -p "nmap -p 3389 --script rdp-enum-encryption" IP
nmap -p 3389 --script rdp-enum-encryption $IP
exit

elif [ $count -eq 18 ]
then 
read -p "nmap --script smb-system-info.nse -p 445 " IP 
nmap --script smb-system-info.nse -p 445 $IP
exit
elif [ $count -eq 19 ]
then 
read -p "nmap -p 1433 --script ms-sql-config --script-args mssql.username=sa,mssql.password=admin123 " IP 
nmap -p 1433 --script ms-sql-config --script-args mssql.username=sa,mssql.password=admin123 $IP
exit
elif [ $count -eq 20 ]
then 
read -p "nmap -p 1433 --script ms-sql-dump-hashes --script-args mssql.username=sa,mssql.password=admin123 " IP 
nmap -p 1433 --script ms-sql-dump-hashes --script-args mssql.username=sa,mssql.password=admin123 $IP
exit
elif [ $count -eq 21 ]
then 
read -p "smbmap -u anonymous -p anonymous -d WORKGROUP -H " IP 
smbmap -u anonymous -p anonymous -d WORKGROUP -H $IP
exit
elif [ $count -eq 22 ]
then
read -p "nmap -sU -p 123 --script ntp-info " IP
nmap -sU -p 123 --script ntp-info $IP
exit
elif [ $count -eq 23 ]
then
read -p "nmap  -sU -pU:123 -Pn  -n  --script=ntp-monlist " IP
nmap -sU -pU:123 -Pn -n --script=ntp-monlist $IP
exit

elif [ $count -eq 24 ]
then
read -p "nmap --script=oracle-tns-poison -p: " port
read -p "nmap --script=oracle-tns-poison -p $port: " IP
nmap --script=oracle-tns-poison -p $port $IP
exit

elif [ $count -eq 25 ]
then
read -p "nmap -sU -p 177 --script xdmcp-discover" ip
nmap -sU -p 177 --script xdmcp-discover $ip
exit

elif [ $count -eq 26 ]
then
read -p "nmap -Pn -p 22 --script ssh2-enum-algos " ip
nmap -Pn -p 22 --script ssh2-enum-algos  $ip
exit

elif [ $count -eq 27 ]
then
read -p "nmap -sV --script vulners " ip
nmap -sV --script vulners $ip
exit

else 
echo "you are out of stock"

fi
done

