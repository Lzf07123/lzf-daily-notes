# 梳理nova组件部署过程-comtroller

## Context

进入nova计算组件的学习计划，共2日，首日完成了三次无文档自主部署，已对nova组件部署流程有初步了解

---

## Key Takeaway

- nova计算组件负责为虚拟机提供算力，调度虚拟机，管理虚拟机生命周期等工作
- nova作为提供计算能力的组件需要配合前置依赖才可以运行，那么在配置里就需要编写与各组件通讯的配置
- 控制节点主要配置：
  1. 默认配置[DEFAULT]、[oslo_concurrency]
  2. 数据库链接配置[api_database]、[database]
  3. 认证相关配置[keystone_authtoken]、[placement]、[service_user]、[neutron]、[api]
  4. 组件特殊配置[vnc]、[glance]

---

## Pratice

```bash
#部分特殊组件演示
[vnc]
enabled = true
server_listen = $my_ip
server_proxyclient_address = $my_ip
[service_user]
send_service_user_token = true
auth_url = http://controller:5000
auth_strategy = keystone
auth_type = password
project_domain_name = Default
user_domain_name = Default
project_name = service
username = nova
password = 000000
```
