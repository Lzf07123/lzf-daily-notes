# 搭建私有镜像仓库并使用cron定时同步

## Context

搭建私有镜像仓库并使用cron定时同步，在本地搭建rocky10.2私有仓库，提供内网主机获取软件包，通过rsync同步上游镜像

---

## Key Takeaway

- flock：并发锁，使用-n参数使用互斥锁，未获取锁将直接退出不等待，避免两条命令写一个文件，可以避免文件损坏
- rsync：同步工具
- cron：定时任务工具

---

## Pratice

```
root@mirrors:/usr/local/mirrors/rocky10.2# crontab -l
0 */6 * * * /usr/bin/flock -n /var/lock/sync-rocky-AppStream.lock /usr/bin/rsync -avz --delete --timeout=300 --log-file=/var/log/rocky-sync-AppStream.log --exclude-from=/usr/local/mirrors/exclude.list rsync://rsync.mirrors.ustc.edu.cn/rocky/10.2/AppStream/x86_64/os/ /usr/local/mirrors/rocky10.2/AppStream/ > /dev/null 2>&1
10 */6 * * * /usr/bin/flock -n /var/lock/sync-rocky-BaseOS.lock /usr/bin/rsync -avz --delete --timeout=300 --log-file=/var/log/rocky-sync-BaseOS.log --exclude-from=/usr/local/mirrors/exclude.list rsync://rsync.mirrors.ustc.edu.cn/rocky/10.2/BaseOS/x86_64/os/ /usr/local/mirrors/rocky10.2/BaseOS/ > /dev/null 2>&1
20 */6 * * * /usr/bin/flock -n /var/lock/sync-Epel.lock /usr/bin/rsync -avz --delete --timeout=300 --log-file=/var/log/sync-Epel.log --exclude-from=/usr/local/mirrors/exclude.list rsync://rsync.mirrors.ustc.edu.cn/epel/10.2/Everything/x86_64/ /usr/local/mirrors/rocky10.2/Epel/ >/dev/null 2>&1
```

---

## Next Step

巩固知识
