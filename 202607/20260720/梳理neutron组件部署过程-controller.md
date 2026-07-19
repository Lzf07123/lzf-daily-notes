# 梳理neutron组件部署过程-controller

## Context

进入neutron组件学习计划共2日，首日完成了3次部署练习，对组件的部署流程已有一定了解

---

## Key Takeaway

- 控制节点部署流程
  1. 加载br_netfilter内核模块
  2. 创建neutron数据库与数据库用户
  3. 加载keystone环境变量，创建neutron用户并授予权限
  4. 创建网络服务实体，创建网络服务端点
  5. 安装neutron组件相关软件包，修改配置文件
  6. 启动服务并开启开机自启
- neutron.conf相关配置段
  1. [DEFAULT]
  2. [nova]
  3. [keystone_authtoken]
  4. [oslo_concurrency]
- ml2_conf.ini相关配置段
  1. [ml2]
  2. [ml2_type_flat]
  3. [securitygroup]
- linuxbridge_agent.ini相关配置段
  1. [linux_bridge]
  2. [vxlan]
  3. [securitygroup]
- dhcp_agent.ini相关配置段
  1. [DEFAULT]
- matedata_agent.ini相关配置段
  1. [DEFAULT]

---

## Pratice

```bash
#部分配置演示
#neutron.conf相关配置段
[DEFAULT]
core_plugin = ml2
service_plugins =
auth_strategy = keystone
transport_url = rabbit://openstack:RABBIT_PASS@controller
```
