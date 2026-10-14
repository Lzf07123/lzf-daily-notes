# 完成RHCE第六节课综合作业

## Context

完成RHCE第六节课综合作业，优先自行编写命令，培养自己的思路，然后使用AI助手辅助理解命令含义

---

## Key Takeaway

- `grep`
- `find`
- `sed`
- `nmcli`
- `ps`
- `head`
- `nohup`
- `updatedb`
- `locate`
- `tee`

---

## Pratice

<学习成果展示>

- `grep -i 'error' FILE`找出FILE文件中包含error的行，忽略大小写
- `grep -oE '([0-9]{1,3}\.){3}([0-9]{1,3})' FILE`找出FILE文件中的ip地址，不验证合法性
- `find /var/log -size +100M -delete`找出大于100M的日志文件并删除
- `find /home/ -mtime -7 -uid +999 -print0 | tar --null -czvf FILE -T -`找出home目录下七天内修改过的普通用户的文件或目录并使用tar压缩打包
- `sed -i.bak 's/localhost/servera.lab.example.com/g' /etc/hosts`将hosts文件内localhost全部替换为servera.lab.example.com，在操作前先备份为hosts.bak
- `ps -axo comm,%mem,pid --sort=-%mem | head -n 6`查看所有进程并以进程名、内存使用率、pid使用内存倒序进行排序，仅显示前五个内存占用最高的进程
- `updatedb`更新文件数据库
- `locate FILE`在文件数据库内查找FILE文件
- `tee`三通管道，同时输出在屏幕与文件
- `nmcli`网络控制命令

---

## Next Step

继续学习，重复练习综合作业
