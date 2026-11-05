# 完善校园网cli工具

## Context

完善校园网cli工具，支持使用命令行登录校园网，使用环境变量、选项、标准输入等多种方式获取凭据

---

## Key Takeaway

- 使用getopts解析选项
- 构建了三个子命令login｜logout｜check
- 使用sed剥离外壳获取标准json格式并用jq获取json字段

---

## Pratice

```
❯ cat main.sh
#!/bin/bash
#作者：林知枫
#邮箱：lzf@lizf.cn
#时间：2026-11-03 01:07:22
#作用：自动连接校园网

set -eou pipefail

readonly URL="http://10.10.254.34:801/eportal/portal"
readonly myip=$(ifconfig en0 | grep netmask | awk '{print $2}')

USERNAME=${USERNAME:-}
PASSWORD=${PASSWORD:-}

usage(){
  cat <<EOF
用法："$0" [-h] <login|logout|check> -u USERNAME [-p PASSWORD]

子命令：
    login   登录校园网
    logout  登出校园网
    check   检查ip在线情况

选项：
    -h          查看帮助
    -u USERNAME 用户名（选填，可从环境变量获取，若无定义将从标准输入获取）
    -p PASSWORD 用户密码（选填，可从环境变量获取，若无定义将从标准输入获取）
EOF
}

ip_to_int(){
  local a b c d
  IFS=. read a b c d <<< "$myip"
  ip2int=$(( a << 24 | b << 16 | c << 8 | d ))
}

getuser(){
  if [ -z "$USERNAME" ];then
    echo "Please input account: "
    read -r USERNAME
  fi
}

getpass(){
  if [ -z "$PASSWORD" ];then
    echo "Please input account $USERNAME password: "
    read -rs PASSWORD
  fi
}

login(){
  local OPTIND=1 opt
  while getopts :u:p: opt;do
    case $opt in
      u) USERNAME="$OPTARG";;
      p) PASSWORD="$OPTARG";;
      *) echo "-$OPTARG options not exist"; exit 1;;
    esac
  done
  getuser; getpass
  curl --get -sSL $URL/login \
      --data-urlencode "callback=dr1003" \
      --data-urlencode "login_method=1" \
      --data-urlencode "user_account=${USERNAME:?need username}" \
      --data-urlencode "user_password=${PASSWORD:?need password}" \
      --data-urlencode "wlan_user_ip=${myip}" \
      --data-urlencode "wlan_user_ipv6=" \
      --data-urlencode "wlan_user_mac=000000000000" \
      --data-urlencode "wlan_ac_ip=" \
      --data-urlencode "wlan_ac_name=" \
      --data-urlencode "jsVersion=4.2" \
      --data-urlencode "terminal_type=1" \
      --data-urlencode "v=2596" \
      | sed 's/^[^(]*(//; s/);$//' \
      | jq -r '.msg'
}

logout(){
  local OPTIND=1 opt
  while getopts :u: opt;do
    case $opt in
      u) USERNAME="$OPTARG";;
      *) echo "-$OPTARG not exist"; exit 1;;
    esac
  done
  getuser; ip_to_int
  curl --get -sSL $URL/mac/unbind \
    --data-urlencode "callback=dr1002" \
    --data-urlencode "user_account=${USERNAME:?need username}" \
    --data-urlencode "wlan_user_mac=000000000000" \
    --data-urlencode "wlan_user_ip=${ip2int}" \
    --data-urlencode "jsVersion=4.2" \
    --data-urlencode "v=1723" \
    | sed 's/^[^(]*(//; s/);$//' \
    | jq -r '.msg'
}

check(){
  ip_to_int
  curl --get -sSL $URL/online_list \
    --data-urlencode "callback=dr1002" \
    --data-urlencode "wlan_user_mac=000000000000" \
    --data-urlencode "wlan_user_ip=${ip2int}" \
    --data-urlencode "curr_user_ip=${ip2int}" \
    --data-urlencode "jsVersion=4.X" \
    --data-urlencode "v=1516" \
    | sed 's/^[^(]*(//; s/);$//' \
    | jq -r '.msg'
}

while getopts :h opt;do
  case $opt in
    h) usage; exit 0;;
    *) echo "-$OPTARG options not exist"; exit 1;;
  esac
done

action=${1:-}
[ $# -gt 0 ] && shift

case ${action} in
  login)
    login "$@";;
  logout)
    logout "$@";;
  check)
    check;;
  *)
    usage; exit 1;;
esac
```

---

## Next Step

完善cli工具
