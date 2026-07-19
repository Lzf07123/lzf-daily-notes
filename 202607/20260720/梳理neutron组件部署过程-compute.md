# 梳理neutron组件部署过程-compute

## Context

进入neutron组件学习计划共2日，首日完成了3次部署练习，对组件的部署流程已有一定了解

---

## Key Takeaway

- 计算节点部署流程
  1. 加载br_netfilter内核模块，关闭selinux
  2. 安装neutron组件相关软件包，修改配置文件
  3. 启动服务并开启开机自启
- neutron.conf相关配置段
  1. [DEFAULT]
  2. [keystone_authtoken]
  3. [oslo_concurrency]
- linuxbridge_agent.ini相关配置段
  1. [linux_bridge]
  2. [vxlan]
  3. [securitygroup]

---

## Pratice

```bash
#部分配置演示
#linuxbridge_agent.ini相关配置段
[linux_bridge]
physical_interface_mappings = provider:INTERFACE_NAME
[vxlan]
enable_vxlan = false
[securitygroup]
enable_security_group = true
firewall_driver = neutron.agent.linux.iptables_firewall.IptablesFirewallDriver
```
