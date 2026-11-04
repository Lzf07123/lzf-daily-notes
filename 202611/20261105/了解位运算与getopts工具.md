# 了解位运算与getopts工具

## Context

了解位运算与getopts工具，在校园网登录cli中真实运用位运算与getopts工具

---

## Key Takeaway

- getopts
- $(())
- while
- case

---

## Pratice

```
login(){
  local OPTIND=1 opt username="" password=""
  while getopts :u:p: opt;do
    case $opt in
      u) username="$OPTARG";;
      p) password="$OPTARG";;
      *) echo "-$OPTARG options not exist"; exit 1;;
    esac
  done
  curl --get -sSL $URL/login \
      --data-urlencode "callback=dr1003" \
      --data-urlencode "login_method=1" \
      --data-urlencode "user_account=${username}" \
      --data-urlencode "user_password=${password}" \
      --data-urlencode "wlan_user_ip=${myip}" \
      --data-urlencode "wlan_user_ipv6=" \
      --data-urlencode "wlan_user_mac=000000000000" \
      --data-urlencode "wlan_ac_ip=" \
      --data-urlencode "wlan_ac_name=" \
      --data-urlencode "jsVersion=4.2" \
      --data-urlencode "terminal_type=1" \
      --data-urlencode "v=2596"
}
```

---

## Next Step

继续完善脚本
