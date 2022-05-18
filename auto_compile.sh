#!/usr/bin/env bash
set -eo pipefail

bs_dir="$(dirname $(readlink -f $0))"

#terminal colors
COLOR_NC=$(tput sgr0)
export COLOR_NC
COLOR_RED=$(tput setaf 1)
export COLOR_RED
COLOR_GREEN=$(tput setaf 2)
export COLOR_GREEN
COLOR_YELLOW=$(tput setaf 3)
export COLOR_YELLOW
COLOR_BLUE=$(tput setaf 4)
export COLOR_BLUE

#variables
INITIAL_PARAMS="$*"
GLOBAL="y"


help_function() {
    echo -e "\nAutomated shell script that installs all dependencies and then compiles cgminer"
    echo -e "\nUsage: ./auto_compile.sh\n"
    echo -e "Options:"
    echo -e "  --help ==> Show this menu"
    exit 0
}


install_dep() {
 echo -e "\n\n${COLOR_YELLOW}Installing dependencies...${COLOR_NC}\n\n"
 # sudo apt install -y build-essential curl
 sudo apt install -y libcurl4-openssl-dev pkg-config libtool ocl-icd-* opencl-headers
}

compile(){
  echo -e "\n\n${COLOR_YELLOW}Compiling cgminer....${COLOR_NC}\n\n"
  "$bs_dir"/autogen.sh
   CFLAGS="-O2 -Wall -march=native"
  "$bs_dir"/configure --enable-opencl
  "$bs_dir"/make
}
#******************#
# End of functions
#******************#

echo -e "\n\n${COLOR_YELLOW}*** STARTING INSTALL ***${COLOR_NC}\n\n"

install_dep
compile


printf "
 ____ _____ _______ ___   ___  
|  _ \_   _|__   __/ _ \ / _ \ 
| |_) || |    | | | (_) | | | |
|  _ < | |    | |  \__, | | | |
| |_) || |_   | |    / /| |_| |
|____/_____|  |_|   /_/  \___/ 
Made with ♥ by BIT90
"
echo -e "\n\n${COLOR_GREEN}CGMINER successfully installed!!${COLOR_NC}"
echo -e "\n\n${COLOR_GREEN}For Troubleshooting visit https://t.me/Bit90Pool OR https://help.bit90.io${COLOR_NC}"
echo -e "\n\n${COLOR_GREEN}RUN CGMINER using the following command${COLOR_NC}"
echo -e "${COLOR_YELLOW}- ./cgminer -o stratum+tcp://mine.bit90.io:3333 -u pubkey.workername -p pubkey ${COLOR_NC}\n"
