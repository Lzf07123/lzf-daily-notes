# 完成RHCE综合作业

## Context

完成RHCE综合作业，学习命令的综合使用

---

## Key Takeaway

- 命令间的组合运用
- RHCE作业完成
- 文件系统命令：`mkdir -p`、`touch`、`stat FILE/DIR`
- 用户管理命令：`useradd -s SHELL -c "INFORMATION" -md "DIR" USER`、`userdel -r USER`、`usermod ... USER`、`chage USER`
- 组管理命令：`groupadd -g GROUP`、`groupdel GROUP`、`groupmod -g GROUP`、`groupmems -g GROUP -a/-l`、`gpasswd -M/-A GROUP`、`newgrp GROUP`
- 权限命令：`chown -R USER:GROUP FILE/DIR`、`chmod 700 FILE/DIR`
- 文本查看工具：`cat`、`less`、`tail`、`head`
- 文本编辑工具：`vim`
- 文本处理工具：`cut -d "" -f NUM FILE`、`grep`、`sort -rn -t ":" -k NUM /etc/passwd`、`uniq -c`、`sed -i[.XXX] -e "p" FILE`

---

## Pratice

```
# 综合作业2

> NAME 黎智锋

## 1、文件系统管理命令

pwd
sudo mkdir -p /home/developer/project/{src,config,logs}
cd /home/developer/project/
sudo touch src/main.py config/setting.cfg logs/app.log
tree /home/developer/
sudo touch /opt/file
sudo mkdir /opt/dir
sudo su
echo "Hello RHEL9" >> /opt/file
mkdir -p /etc/sysconfig/network-scripts
cp /opt/file /etc/sysconfig/network-scripts/opt-file
cp -a /opt/dir/ /tmp/
stat /tmp/dir/
mkdir -p /tmp/dir/year/month/day
cd /tmp/dir/year/month/day
pwd
cp /etc/passwd /etc/ /opt/
cp -r /etc/passwd /etc/ /opt/
stat /opt/passwd
rm -rf /opt/etc/
rm -i /opt/passwd

## 2、用户和用户组管理命令

cat /etc/passwd | grep -iE 'user1|user2|user3'
useradd -md /data -c 'teacher' user1
useradd -u 2000 user2
useradd -s /usr/sbin/nologin user3
cat /etc/passwd | grep -iE 'user1|user2|user3'
su - user3
groupadd -g 2500 itgroup
gpasswd -M user1,user2,user3 itgroup
gpasswd -A user1 itgroup
groupmems -g itgroup -l
cat /etc/group | grep it
usermod -u 2026 -c "RHCE_USER" -md /tmp/user3 user3
cat /etc/passwd | grep -iE 'user1|user2|user3'
gpasswd -a user3 root
gpasswd itgroup
useradd memeda01
su - memeda01
newgrp itgroup
id
chage -m 3 -M 7 -W 1 -E 2026-12-01 memeda01
chage -l memeda01
cat /etc/login.defs | less
sed -n '/^PASS/p' /etc/login.defs
sed -i.bak -e "s/PASS_MAX_DAYS 99999/PASS_MAX_DAYS 30/" /etc/login.defs
sed -n '/^PASS/p' /etc/login.defs
useradd user4
chage user4 -l
userdel -r user1
userdel -r user2
userdel -r user3
userdel -r user4
groupdel itgroup
cat /etc/passwd | grep -E "user1|user2|user3"
cat /etc/group | grep "itgroup"

## 3、文件权限相关

useradd ituser1; groupadd cloud
touch /tmp/rhcsa
chown ituser1:cloud /tmp/rhcsa
chmod 670 /tmp/rhcsa
useradd user1; useradd user2
mkdir -p /tmp/redhat/rhel9
chmod 764 /tmp/redhat/rhel9/
mkdir -p /tmp/centos/base
chown -R user1:user2 /tmp/centos/base/

## 4、IO 重定向和 vim 编辑器

find / -name selinux 1>1.txt 2>2.txt
echo 'redhat#$%' | passwd --stdin bob
echo 'hello, redhat' > hello.txt

## 5、文本处理工具

cat /var/log/access.log | wc -l
cat /var/log/access.log | tail -n 10
cat /var/log/access.log | grep "ERROR"
cut -d " " -f 3 /var/log/access.log | sort | uniq -c | head -n 5
cut -d " " -f 7 /var/log/access.log | sort | uniq -c | grep -E "200|404|500"
cut -d " " -f 5 /var/log/access.log | sort | uniq -c | head -n 3
cat /var/log/access.log | grep "^2025-06-20" | wc -l
cat /etc/passwd | grep -E "/bin/bash$|/bin/sh$"
cat /etc/passwd | grep -E "/bin/bash$|/bin/sh$" | wc -l
cat ip.txt | sort | uniq
less /var/log/messages
cut -d ":" -f 1,3 /etc/passwd > /opt/users.txt
cat /opt/users.txt | sort -n -t ":" -k 2
cat /etc/group | wc -l
ifconfig | grep "inet" | grep "broa" | cut -d " " -f 10
sed -i.bak '/^SELINUX/s\enforcing\disabled\' /etc/selinux/config
sed -i "\|#Port|a\Port 2222" /etc/ssh/sshd_config
sed -i "\|#Port|d" /etc/ssh/sshd_config
ll /root/ | wc -l
```

---

## Next Step

巩固知识
