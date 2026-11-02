# 运用RHCE所学知识自行构建校园网自动连接脚本

## Context

运用RHCE所学知识自行构建校园网自动连接脚本，使用了Shell变量、Shell脚本、判断语句、位置变量、环境变量、文本处理工具

---

## Key Takeaway

- 使用文本处理工具获取ip地址与mac地址
- 使用位置变量配合case判断语句执行相关操作
- username/password使用变量存储，方便后续复用脚本

---

## Pratice

```
#!/bin/bash
#作者：林知枫
#邮箱：lzf@lizf.cn
#时间：2026-11-03 01:07:22
#作用：自动连接校园网

username=
password=
myip=$(ifconfig en0 | grep netmask | awk '{print $2}')
mymac=$(ifconfig en0 | grep ether | awk '{print $2}' | tr -d :)

cat <<EOF
本机IP地址：$myip
本机MAC地址：$mymac
登录账户：$username
EOF

case ${1:-login} in
  login)
    curl http://10.10.254.34:801/eportal/portal/login\?callback\=dr1003\&login_method\=1\&user_account\=${username}\&user_password\=${password}\&wlan_user_ip\=${myip}\&wlan_user_ipv6\=\&wlan_user_mac\=000000000000\&wlan_ac_ip\=\&wlan_ac_name\=\&jsVersion\=4.2\&terminal_type\=1\&lang\=en\&v\=2596\&lang\=en
    if [ $? -eq 0 ];then
      echo -e "成功使用账号 $username 连接到校园网"
    fi
    ;;
  logout) curl http://10.10.254.34:801/eportal/portal/mac/unbind\?callback\=dr1002\&user_account\=${username}\&wlan_user_mac\=000000000000\&wlan_user_ip\=169020134\&jsVersion\=4.2\&v\=1723\&lang\=en;;
  check) curl -X GET http://10.10.254.34:801/eportal/portal/online_list\?callback\=dr1002\&user_account\=\&user_password\=\&wlan_user_mac\=000000000000\&wlan_user_ip\=169020134\&curr_user_ip\=169020134\&jsVersion\=4.X\&v\=1516\&lang\=en 2>/dev/null;;
  *) echo -e "请输入正确的选项[login|logout|check]"
esac
```

---

## Next Step

构思脚本大概框架，完善脚本，通过实战项目巩固知识
