# 首次计时练习keystone全过程

## Context

首次计时从零开始配置keystone身份认证服务，一次性配置`mariadb、rabbitmq、memcached、etcd、keystone`用时25分整

---

## Key Takeaway

- 理解从零开始配置keystone服务全流程
- 练习keystone配置文件的修改，数据库连接、认证提供商等
- 练习共享服务组件的部署流程
- 其中除mysql配置文件外其余组件相对容易

---

## Pratice

```bash
su -s /bin/sh -c "keystone-manage db_sync" keystone
keystone-manage fernet_setup --keystone-user keystone --keystone-group keystone
keystone-manage credential_setup --keystone-user keystone --keystone-group keystone
keystone-manage bootstrap --bootstrap-passwod "000000" \
--bootstrap-admin-url http://controller:5000/v3/ \
--bootstrap-internal-url http://controller:5000/v3/ \
--bootstrap-public-url http://controller:5000/v3/ \
--bootstrap-region-id RegionOne
```
