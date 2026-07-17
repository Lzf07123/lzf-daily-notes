# 梳理keystone部署过程优化顺序

## Context

梳理keystone组件部署流程优化依赖部署顺序，记录相关部署过程

---

## Key Takeaway

- 优化依赖部署循序
  1. 做部署前准备，修改主机名，为网卡设定静态地址，添加hosts域名解析，将selinux强度调整至宽松，关闭firewall防火墙
  2. 安装mariadb数据库软件包，添加openstack数据库配置文件,开启服务并设置开机自启
  3. 安装rabbitmq消息队列软件包，添加openstack用户，为openstack用户授予权限,开启服务并设置开机自启
  4. 安装memcached令牌存储软件包，修改配置文件支持从控制节点域名或ip访问,开启服务并设置开机自启
  5. 安装etcd数据库软件包，修改配置文件以支持从控制节点地址访问,开启服务并设置开机自启
  6. 安装keystone组件、httpd、mod_wsgi、python3-openstackclient

---

## Pratice

```bash
#展示部分
# 1、部署前准备(省略部分编辑)
hostnamectl hostname controller
nmtui
vi /etc/hosts
vi /etc/selinux/config
systemctl disable firewall.service
systemctl stop firewall.service
#2、安装mariadb数据库(省略部分编辑)
dnf install -y mariadb mariadb-server python3-PyMySQL
vi /etc/my.cnf.d/openstack.cnf
systemctl enable mariadb
systemctl start mariadb
```
