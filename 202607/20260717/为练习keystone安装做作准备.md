# 为练习keystone安装做作准备

## Context

为练习keystone安装作准备，提前练习`mariadb数据库、rabbitmq消息队列、memcached、etcd`的安装与配置

---

## Key Takeaway

- 学习手写mysql数据库cnf配置文件
- 学习手动配置rabbitmq消息队列，添加用户，赋予权限
- 学习修改memcached配置文件以便节点连接
- 学习配置etcd数据库，修改配置文件启动etcd数据库
- etcd数据库配置文件主机地址不可使用域名
- 注意检查hosts、selinux、firewall配置
- mysql数据库首次使用需初始化

---

## Pratice

```bash
#openstack.cnf
[mysqld]
bind-address = 192.168.100.10

default-storage-engine = innodb
innodb_file_per_table = on
max_connections = 4096
collation-server = utf8_general_ci
character-set-server = utf8

#rabbitmqctl
rabbitmqctl add_user openstack 000000
rabbitmqctl set_permissions openstack ".*" ".*" ".*"
```
