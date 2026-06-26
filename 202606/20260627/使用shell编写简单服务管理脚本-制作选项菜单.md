# 使用shell编写简单服务管理脚本-制作选项菜单

## Context

结合学习的shell脚本知识与自己的理解制作一个简单的服务管理脚本，目前还处于启动阶段，已完成选项列表的编写、以整数为主的判断分支（使用占位符暂时代替实际功能）

---

## Key Takeaway

- 理解并运用`列表`类型变量存储选项
- 学习并运用`终端颜色`突出选项的危险性
- 理解并运用`for循环、while循环`
  - for循环打印选项列表
  - while循环作为脚本的入口，在单次选项判断分支完成后打印选项列表，以此循环直至手动结束脚本
- 理解并运用`case`条件分支，使用read读取输入的字符，传递给case条件分支判断选项

---

## Pratice

```bash
#!/bin/bash

# 颜色定义
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
CYAN='\e[36m'
NC='\e[0m'

# 选项定义
OPTIONS=("Start Service" "Stop Service" "Restart Service" "Check Status" "Exit")

options_list(){
    clear
    echo -e "${GREEN}快捷服务管理${NC}"
    for i in "${!OPTIONS[@]}"; do
        echo -e "$((i + 1)). ${OPTIONS[$i]}${NC}"
    done
}

select_list(){
    options_list

    read -p "$(echo -e "${GREEN}select an option:${NC}")" choice
    case ${choice} in
        1)
            echo -e "${GREEN}Starting service...${NC}"
            read -p "$(echo -e ${GREEN}按任意键继续...${NC})"
            ;;
        2)
            echo -e "${RED}Stopping service...${NC}"
            read -p "$(echo -e ${GREEN}按任意键继续...${NC})"
            ;;
        3)
            echo -e "${YELLOW}Restarting service...${NC}"
            read -p "$(echo -e ${GREEN}按任意键继续...${NC})"
            ;;
        4)
            echo -e "${GREEN}Checking service status...${NC}"
            read -p "$(echo -e ${GREEN}按任意键继续...${NC})"
            ;;
        5)
            echo -e "Exiting...${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}无效选项${NC}"
            read -p "$(echo -e ${GREEN}按任意键继续...${NC})"
            ;;
    esac
}

while true; do
    select_list
done
```

---

## Next Step

继续完善脚本
