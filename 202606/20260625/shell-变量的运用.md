# shell-变量的运用

## Context

练习并理解shell脚本`变量`的基础用法。

---

## Key Takeaway

- 理解了变量如何定义、赋值
- 理解了如何使用变量、修改变量值
- 了解了变量的命名规范，例如
  - 常量用大写
  - 变量用小写
  - 使用含义贴切的英文单词/拼音
  - 单词间使用`_`连接

> 变量的值可以动态获取

---

## Pratice

```bash
#!/bin/bash

SYSTEM=$(cat /etc/os-release | grep PRETTY_NAME | grep -oE '"([^"]*)"')
HOSTNAME=$(hostname)
OUTSIDE_IP=$(curl -s ifconfig.me/ip)
UPTIME=$(uptime -p)
MEM=$(free -h | awk '/Mem/ {print $2}')
USER=$(whoami)


echo -e "===================================================="
echo -e "System:\t\t $SYSTEM"
echo -e "Hostname:\t $HOSTNAME"
echo -e "User:\t\t $USER"
echo -e "Outside IP:\t $OUTSIDE_IP"
echo -e "Memory:\t\t $MEM"
echo -e "Uptime:\t\t $UPTIME"
echo -e "===================================================="

```
