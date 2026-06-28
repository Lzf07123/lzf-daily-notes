#!/bin/bash

# 系统信息
SYSTEM=$(cat /etc/os-release | grep PRETTY_NAME | grep -oE '([^PRETTY_NAME="]*)')
HOSTNAME=$(hostname)
OUTSIDE_IP=$(curl -s ifconfig.me/ip)
UPTIME=$(uptime -p)
MEM=$(free -h | awk '/Mem/ {print $7}')
USER=$(whoami)

# 颜色定义
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
CYAN='\e[36m'
NC='\e[0m'

option=$1

system_info(){
    echo -e "${CYAN}===================================================="
    echo -e "System:\t\t ${SYSTEM}"
    echo -e "Hostname:\t ${HOSTNAME}"
    echo -e "User:\t\t ${USER}"
    echo -e "Outside IP:\t ${OUTSIDE_IP}"
    echo -e "Memory:\t\t ${MEM}"
    echo -e "Uptime:\t\t ${UPTIME}"
    echo -e "====================================================${NC}"
}

start_service(){
    echo -e "${GREEN}Starting service...${NC}"
    systemctl start $1
    if [ $? -ne 0 ]; then
        echo -e "${RED}not found service：$1.service ${NC}"
    else
        echo -e "${GREEN}Service $1 started successfully.${NC}"
    fi
    echo -e "${CYAN}====================================================${NC}"
}

stop_service(){
    echo -e "${RED}Stopping service...${NC}"
    systemctl stop $1
    if [ $? -ne 0 ]; then
        echo -e "${RED}not found service：$1.service ${NC}"
    else
        echo -e "${GREEN}Service $1 stopped successfully.${NC}"
    fi
    echo -e "${CYAN}====================================================${NC}"
}

restart_service(){
    echo -e "${YELLOW}Restarting service...${NC}"
    systemctl restart $1
    if [ $? -ne 0 ]; then
        echo -e "${RED}not found service：$1.service ${NC}"
    else
        echo -e "${GREEN}Service $1 restarted successfully.${NC}"
    fi
    echo -e "${CYAN}====================================================${NC}"
}

status_service(){
    echo -e "${GREEN}Checking service status...${NC}"
    systemctl status $1
    if [ $? -ne 0 ]; then
        echo -e "${RED}not found service：$1.service ${NC}"
    else
        echo -e "${GREEN}Service $1 is running.${NC}"
    fi
    echo -e "${CYAN}====================================================${NC}"
}

not_found_option(){
    echo -e "${RED}无效选项${NC}"
    echo -e "${CYAN}用法：${0} {start|stop|restart|status|info} 服务名${NC}"
    exit 1

}


select_list(){
    case ${option:-help} in
        start)
            shift
            while [[ $# -ne 0 ]]; do
                start_service $1
                shift
            done
            ;;
        stop)
            shift
            while [[ $# -ne 0 ]]; do
                stop_service $1
            done
            ;;
        restart)
            shift
            while [[ $# -ne 0 ]]; do
                restart_service $1
                shift
            done
            ;;
        status)
            shift
            while [[ $# -ne 0 ]]; do
                status_service $1
                shift
            done
            ;;
        info)
            system_info
            ;;
        *)
            not_found_option
            ;;
    esac
}

select_list $@
