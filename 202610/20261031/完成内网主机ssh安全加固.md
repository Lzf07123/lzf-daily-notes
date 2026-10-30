# 完成内网主机ssh安全加固

## Context

完成内网主机ssh安全加固，修改sshd_config配置文件

---

## Key Takeaway

- Addresslisten
- AllowUser
- 关闭密码登录，仅允许公钥登录
- 了解wrapgate轻量跳板机
- 了解rsyslog集中日志服务器

---

## Pratice

- ssh黑白名单规则为黑名单优先，一切的白名单规则会被有相同条目的黑名单规则覆盖

---

## Next Step

上RHCE第十一节课
