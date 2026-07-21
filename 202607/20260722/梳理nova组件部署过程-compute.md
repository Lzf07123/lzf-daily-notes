# 梳理nova组件部署过程-compute

## Context

进入nova计算组件的学习计划，共2日，首日完成了三次无文档自主部署，已对nova组件部署流程有初步了解

---

## Key Takeaway

- nova计算组件负责为虚拟机提供算力，调度虚拟机，管理虚拟机生命周期等工作
- nova作为提供计算能力的组件需要配合前置依赖才可以运行，那么在配置里就需要编写与各组件通讯的配置
- 计算节点主要配置：
  1. 默认配置[DEFAULT]、[oslo_concurrency]
  2. 认证相关配置[keystone_authtoken]、[placement]、[service_user]、[neutron]、[api]
  3. 组件特殊配置[vnc]、[glance]、[libvirt]

---

## Pratice

```bash
#部分特殊组件演示
[DEFAULT]
my_ip = 192.168.100.20
enabled_apis = osapi_compute,metadata
compute_driver = libvirt.LibvirtDriver
state_path = /var/lib/nova
transport_url = rabbit://openstack:000000@controller
[vnc]
enabled = true
server_listen = 0.0.0.0
server_proxyclient_address = $my_ip
novncproxy_base_url = http://controller:6080/vnc_auto.html
```
