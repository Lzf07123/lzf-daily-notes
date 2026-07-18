#梳理glance部署过程优化顺序

## Context

继前置依赖于keystone身份验证组件部署完成，练习了glance镜像组件的部署于使用，梳理出glance镜像组件部署流程并进行优化

---

## Key Takeaway

- 优化部署顺序
  1. 为glance组件创建数据库并授权
  2. 加载keystone认证环境变量
  3. 向keystone注册service项目
  4. 向keystone注册glance用户、服务、数据端点。为用户授权
  5. 安装glance软件包，修改配置文件`数据库、keystone认证、认证提供、存储配置`配置段，启动服务并开启开机自启

---

## Pratice

```bash
#数据库操作演示(部分)
create database glance;
create user 'glance'@'localhost' identified by 'GLANCE_PASS'
create user 'glance'@'%' identified by 'GLANCE_PASS'
grant all privileges on glance.* to 'glance'@'localhost'
grant all privileges on glance.* to 'glance'@'%'
#keystone注册项目演示
openstack project create --domain default service
openstack user create --password-prompt --domain default glance
openstack role add --project service --user admin
openstack service create --name glance image
openstack endpoint create --region RegionOne image admin http://controller:9292
openstack endpoint create --region RegionOne image internal http://controller:9292
openstack endpoint create --region RegionOne image public http://controller:9292
```
