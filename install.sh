#!/bin/bash

#colors
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
purple='\033[0;35m'
cyan='\033[0;36m'
white='\033[0;37m'
bold='\033[1m'
rest='\033[0m'

case "$(uname -m)" in
x86_64 | x64 | amd64)
	cpu=amd64
	;;
i386 | i686)
	cpu=386
	;;
armv8 | armv8l | arm64 | aarch64)
	cpu=arm64
	;;
armv7l)
	cpu=arm
	;;
*)
	echo "The current architecture is $(uname -m), not supported"
	exit
	;;
esac

cfwarpIP() {
	if [[ ! -f "$PREFIX/bin/warpendpoint" ]]; then
		echo "Downloading warpendpoint program"
		if [[ -n $cpu ]]; then
			curl -L -o warpendpoint -# --retry 2 https://raw.githubusercontent.com/Ptechgithub/warp/main/endip/$cpu
			cp warpendpoint $PREFIX/bin
			chmod +x $PREFIX/bin/warpendpoint
		fi
	fi
}

endipv4() {
	n=0
	iplist=100
	while true; do
		temp[$n]=$(echo 162.159.192.$(($RANDOM % 256)))
		n=$(($n + 1))
		if [ $n -ge $iplist ]; then
			break
		fi
		temp[$n]=$(echo 162.159.193.$(($RANDOM % 256)))
		n=$(($n + 1))
		if [ $n -ge $iplist ]; then
			break
		fi
		temp[$n]=$(echo 162.159.195.$(($RANDOM % 256)))
		n=$(($n + 1))
		if [ $n -ge $iplist ]; then
			break
		fi
		temp[$n]=$(echo 188.114.96.$(($RANDOM % 256)))
		n=$(($n + 1))
		if [ $n -ge $iplist ]; then
			break
		fi
		temp[$n]=$(echo 188.114.97.$(($RANDOM % 256)))
		n=$(($n + 1))
		if [ $n -ge $iplist ]; then
			break
		fi
		temp[$n]=$(echo 188.114.98.$(($RANDOM % 256)))
		n=$(($n + 1))
		if [ $n -ge $iplist ]; then
			break
		fi
		temp[$n]=$(echo 188.114.99.$(($RANDOM % 256)))
		n=$(($n + 1))
		if [ $n -ge $iplist ]; then
			break
		fi
		temp[$n]=$(echo 8.39.6.$(($RANDOM % 256)))
		n=$(($n + 1))
		if [ $n -ge $iplist ]; then
			break
		fi
		temp[$n]=$(echo 8.49.6.$(($RANDOM % 256)))
		n=$(($n + 1))
		if [ $n -ge $iplist ]; then
			break
		fi
		temp[$n]=$(echo 8.47.6.$(($RANDOM % 256)))
		n=$(($n + 1))
		if [ $n -ge $iplist ]; then
			break
		fi
		temp[$n]=$(echo 8.209.$(($RANDOM % 256)).$(($RANDOM % 256)))
		n=$(($n + 1))
		if [ $n -ge $iplist ]; then
			break
		fi
	done
	while true; do
		if [ $(echo "${temp[@]}" | sed -e 's/ /\n/g' | sort -u | wc -l) -ge $iplist ]; then
			break
		else
			temp[$n]=$(echo 162.159.192.$(($RANDOM % 256)))
			n=$(($n + 1))
		fi
		if [ $(echo "${temp[@]}" | sed -e 's/ /\n/g' | sort -u | wc -l) -ge $iplist ]; then
			break
		else
			temp[$n]=$(echo 162.159.193.$(($RANDOM % 256)))
			n=$(($n + 1))
		fi
		if [ $(echo "${temp[@]}" | sed -e 's/ /\n/g' | sort -u | wc -l) -ge $iplist ]; then
			break
		else
			temp[$n]=$(echo 162.159.195.$(($RANDOM % 256)))
			n=$(($n + 1))
		fi
		if [ $(echo "${temp[@]}" | sed -e 's/ /\n/g' | sort -u | wc -l) -ge $iplist ]; then
			break
		else
			temp[$n]=$(echo 188.114.96.$(($RANDOM % 256)))
			n=$(($n + 1))
		fi
		if [ $(echo "${temp[@]}" | sed -e 's/ /\n/g' | sort -u | wc -l) -ge $iplist ]; then
			break
		else
			temp[$n]=$(echo 188.114.97.$(($RANDOM % 256)))
			n=$(($n + 1))
		fi
		if [ $(echo "${temp[@]}" | sed -e 's/ /\n/g' | sort -u | wc -l) -ge $iplist ]; then
			break
		else
			temp[$n]=$(echo 188.114.98.$(($RANDOM % 256)))
			n=$(($n + 1))
		fi
		if [ $(echo "${temp[@]}" | sed -e 's/ /\n/g' | sort -u | wc -l) -ge $iplist ]; then
			break
		else
			temp[$n]=$(echo 188.114.99.$(($RANDOM % 256)))
			n=$(($n + 1))
		fi
		if [ $(echo "${temp[@]}" | sed -e 's/ /\n/g' | sort -u | wc -l) -ge $iplist ]; then
			break
		else
			temp[$n]=$(echo 8.39.6.$(($RANDOM % 256)))
			n=$(($n + 1))
		fi
		if [ $(echo "${temp[@]}" | sed -e 's/ /\n/g' | sort -u | wc -l) -ge $iplist ]; then
			break
		else
			temp[$n]=$(echo 8.49.6.$(($RANDOM % 256)))
			n=$(($n + 1))
		fi
		if [ $(echo "${temp[@]}" | sed -e 's/ /\n/g' | sort -u | wc -l) -ge $iplist ]; then
			break
		else
			temp[$n]=$(echo 8.47.6.$(($RANDOM % 256)))
			n=$(($n + 1))
		fi
		if [ $(echo "${temp[@]}" | sed -e 's/ /\n/g' | sort -u | wc -l) -ge $iplist ]; then
			break
		else
			temp[$n]=$(echo 8.209.$(($RANDOM % 256)).$(($RANDOM % 256)))
			n=$(($n + 1))
		fi
	done
}

endipv6() {
	n=0
	iplist=100
	while true; do
		temp[$n]=$(echo [2606:4700:d0::$(printf '%x\n' $(($RANDOM * 2 + $RANDOM % 2))):$(printf '%x\n' $(($RANDOM * 2 + $RANDOM % 2))):$(printf '%x\n' $(($RANDOM * 2 + $RANDOM % 2))):$(printf '%x\n' $(($RANDOM * 2 + $RANDOM % 2)))])
		n=$(($n + 1))
		if [ $n -ge $iplist ]; then
			break
		fi
		temp[$n]=$(echo [2606:4700:d1::$(printf '%x\n' $(($RANDOM * 2 + $RANDOM % 2))):$(printf '%x\n' $(($RANDOM * 2 + $RANDOM % 2))):$(printf '%x\n' $(($RANDOM * 2 + $RANDOM % 2))):$(printf '%x\n' $(($RANDOM * 2 + $RANDOM % 2)))])
		n=$(($n + 1))
		if [ $n -ge $iplist ]; then
			break
		fi
	done
	while true; do
		if [ $(echo "${temp[@]}" | sed -e 's/ /\n/g' | sort -u | wc -l) -ge $iplist ]; then
			break
		else
			temp[$n]=$(echo [2606:4700:d0::$(printf '%x\n' $(($RANDOM * 2 + $RANDOM % 2))):$(printf '%x\n' $(($RANDOM * 2 + $RANDOM % 2))):$(printf '%x\n' $(($RANDOM * 2 + $RANDOM % 2))):$(printf '%x\n' $(($RANDOM * 2 + $RANDOM % 2)))])
			n=$(($n + 1))
		fi
		if [ $(echo "${temp[@]}" | sed -e 's/ /\n/g' | sort -u | wc -l) -ge $iplist ]; then
			break
		else
			temp[$n]=$(echo [2606:4700:d1::$(printf '%x\n' $(($RANDOM * 2 + $RANDOM % 2))):$(printf '%x\n' $(($RANDOM * 2 + $RANDOM % 2))):$(printf '%x\n' $(($RANDOM * 2 + $RANDOM % 2))):$(printf '%x\n' $(($RANDOM * 2 + $RANDOM % 2)))])
			n=$(($n + 1))
		fi
	done
}

endipresult() {
	echo "${temp[@]}" | sed -e 's/ /\n/g' | sort -u >ip.txt
	ulimit -n 102400
	chmod +x warpendpoint >/dev/null 2>&1
	if command -v warpendpoint &>/dev/null; then
		warpendpoint
	else
		./warpendpoint
	fi

	clear
	
	# Check if result.csv was created and has content
	if [[ ! -f "result.csv" ]] || [[ ! -s "result.csv" ]]; then
		echo -e "${red}╔═══════════════════════════════════════╗${rest}"
		echo -e "${red}║     ${yellow}❌ No results generated!${red}        ║${rest}"
		echo -e "${red}║   ${yellow}Check your internet connection${red}   ║${rest}"
		echo -e "${red}╚═══════════════════════════════════════╝${rest}"
		rm -f warpendpoint ip.txt result.csv >/dev/null 2>&1
		exit 1
	fi
	
	cat result.csv | awk -F, '$3!="timeout ms" {print} ' | sort -t, -nk2 -nk3 | uniq | head -11 | awk -F, '{print "Endpoint "$1" Packet Loss Rate "$2" Average Delay "$3}'
	Endip_v4=$(cat result.csv | grep -oE "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+:[0-9]+" | head -n 1)
	Endip_v6=$(cat result.csv | grep -oE "\[.*\]:[0-9]+" | head -n 1)
	delay=$(cat result.csv | grep -oE "[0-9]+ ms|timeout" | head -n 1)
	echo ""
	echo -e "${green}Results Saved in result.csv${rest}"
	echo ""
	if [ "$Endip_v4" ]; then
		echo -e "${cyan}╔═══════════════════════════════════════╗${rest}"
		echo -e "${cyan}║           ${yellow}Best IPv4:Port${cyan}             ║${rest}"
		echo -e "${cyan}║                                       ║${rest}"
		echo -e "${cyan}║          ${green}$Endip_v4${cyan}      ║${rest}"
		echo -e "${cyan}║           ${blue}Delay: ${yellow}[$delay]${cyan}        ║${rest}"
		echo -e "${cyan}╚═══════════════════════════════════════╝${rest}"
	elif [ "$Endip_v6" ]; then
		echo -e "${cyan}╔═════════════════════════════════════════════════════╗${rest}"
		echo -e "${cyan}║              ${yellow}Best [IPv6]:Port${cyan}                 ║${rest}"
		echo -e "${cyan}║                                                     ║${rest}"
		echo -e "${cyan}║ ${green}$Endip_v6${cyan} ║${rest}"
		echo -e "${cyan}║           ${blue}Delay: ${yellow}[$delay]${cyan}                   ║${rest}"
		echo -e "${cyan}╚═════════════════════════════════════════════════════╝${rest}"
	else
		echo -e "${red} No valid IP addresses found.${rest}"
	fi
	rm warpendpoint >/dev/null 2>&1
	rm -rf ip.txt
	exit
}

#Menu
clear
echo -e "${cyan}╔═══════════════════════════════════════════════════════════╗${rest}"
echo -e "${cyan}║  ${bold}${yellow}Fork by AMiR${rest} ${cyan}• ${bold}${green}https://github.com/EmpressTeam${rest}    ${cyan}║${rest}"
echo -e "${cyan}║               ${blue}Telegram: ${bold}${purple}@Empress_Team${rest}               ${cyan}║${rest}"
echo -e "${cyan}╚═══════════════════════════════════════════════════════════╝${rest}"
echo ""
echo -e "${cyan}╔═══════════════════════════════════════════════════════════╗${rest}"
echo -e "${cyan}║                ${bold}${yellow}🔍 ENDPOINT SCANNER${rest}                ${cyan}║${rest}"
echo -e "${cyan}╚═══════════════════════════════════════════════════════════╝${rest}"
echo ""
echo -e "${white}┌───────────────────────────────────────────────────────────┐${rest}"
echo -e "${white}│                                                           │${rest}"
echo -e "${white}│  ${bold}${green}[1]${rest} ${cyan}►${rest} ${yellow}Preferred IPv4 Scanner${rest}                     ${white}│${rest}"
echo -e "${white}│                                                           │${rest}"
echo -e "${white}│  ${bold}${green}[2]${rest} ${cyan}►${rest} ${yellow}Preferred IPv6 Scanner${rest}                     ${white}│${rest}"
echo -e "${white}│                                                           │${rest}"
echo -e "${white}│  ${bold}${red}[0]${rest} ${cyan}►${rest} ${purple}Exit${rest}                                        ${white}│${rest}"
echo -e "${white}│                                                           │${rest}"
echo -e "${white}└───────────────────────────────────────────────────────────┘${rest}"
echo ""
echo -en "${bold}${cyan}🚀 Enter your choice: ${rest}"
read -r choice
case "$choice" in
1)
	echo -e "${cyan}╔═══════════════════════════════════════════════════════════╗${rest}"
	echo -e "${cyan}║              ${yellow}🔍 Starting IPv4 Scanner${cyan}              ║${rest}"
	echo -e "${cyan}╚═══════════════════════════════════════════════════════════╝${rest}"
	cfwarpIP
	endipv4
	endipresult
	Endip_v4
	;;
2)
	echo -e "${cyan}╔═══════════════════════════════════════════════════════════╗${rest}"
	echo -e "${cyan}║              ${yellow}🔍 Starting IPv6 Scanner${cyan}              ║${rest}"
	echo -e "${cyan}╚═══════════════════════════════════════════════════════════╝${rest}"
	cfwarpIP
	endipv6
	endipresult
	Endip_v6
	;;
0)
	echo -e "${cyan}╔═══════════════════════════════════════════════════════════╗${rest}"
	echo -e "${cyan}║                    ${yellow}👋 Goodbye!${cyan}                     ║${rest}"
	echo -e "${cyan}╚═══════════════════════════════════════════════════════════╝${rest}"
	exit
	;;
*)
	echo -e "${red}╔═══════════════════════════════════════════════════════════╗${rest}"
	echo -e "${red}║          ${yellow}❌ Invalid choice. Please try again.${red}         ║${rest}"
	echo -e "${red}╚═══════════════════════════════════════════════════════════╝${rest}"
	;;
esac
