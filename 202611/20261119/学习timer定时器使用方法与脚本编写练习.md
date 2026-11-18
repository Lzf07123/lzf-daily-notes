# 学习timer定时器使用方法与脚本编写练习

## Context

学习timer定时器使用方法与脚本编写练习，使用已有service与timer单元文件学习编写单元文件，将同步仓库的命令脚本化

---

## Key Takeaway

- systemctl cat service/timer 查看service/timer内容，配合tee可以写到新单元文件里
- systemd-analyze verify service/timer 检查service/timer语法合法性
- systemctl daemon-relaod 重载单元文件
- OnCalendar=年-月-日 时:分:秒、Unit=service、WantedBY=timers.target
- 将crontab计划任务迁移至timer定时器

---

## Pratice

```
# /etc/systemd/system/sync-AppStream.timer
[Unit]
Description=Daily 00:00 06:00 12:00 18:00 Sync Repo

[Timer]
Unit=sync-AppStream.service
OnCalendar=*-*-* 00/6:00:00
Persistent=true

[Install]
WantedBy=timers.target

# /etc/systemd/system/sync-AppStream.service
[Unit]
Description=Sync Rocky Linux 10.2 AppStream Repo
After=network.target

[Service]
Type=oneshot
User=root
ExecStart=/usr/local/bin/sync-mirrors appstream
```

---

## Next Step

巩固知识
