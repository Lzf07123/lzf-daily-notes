# 上完RHCE第十节课

## Context

上完RHCE第十节课，继续学习了包管理的内容，jounal与rsyslog日志管理，计划任务等知识

---

## Key Takeaway

- yum/dnf
- flatpak
- jounalctl/rsyslog
- at/crontab/timer

---

## Pratice

- at/crontab：allow白名单策略，配置文件默认不存在，若文件存在但文件为空，会导致系统上无人可以使用计划任务
- jounalctl/rsyslog都是用来查看日志的工具，rsyslog可以用来搭建集中日志服务器
- yum/dnf：使用search可以查找软件包，使用privides可以从文件反推软件包，localinstall可以从本地rpm文件安装并且自动处理依赖，yum/dnf就是新时代用来处理依赖关系的安装工具

---

## Next Step

巩固知识
