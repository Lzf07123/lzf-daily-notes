# 调整openeuler克隆模板并重新包装

## Context

旧模板在使用过程中发现分区过小与软件源未更新等问题，重新使用官方镜像制作模板并更新软件源

---

## Key Takeaway

- 学习从零开始安装openeuler22.09
- 新模板使用图形化引导安装系统，使用lvm分区以便后续扩容分区
- 熟练编写yum软件源配置文件

---

## Pratice

```bash
#使用内网网络软件源
#/etc/yum.repos.d/local.repo
[local]
name=openeuler22.09-local-source
baseurl=http://local.repo:8080/
enabled=1
gpgcheck=0
```
