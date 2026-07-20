# 联调glance与neutron等组件

## Context

无文档从零开始部署前置依赖、keystone、glance、neutron、placement帮助记忆部署流程

---

## Key Takeaway

- 每个组件都遵循认证、数据库连接、组件特殊配置这个规律编写配置文件
- 认证部分代表[keystone_authtoken]
- 数据库部分代表[database]、[placement_database]
- 组件特殊部分代表[ml2]、[linux_bridge]、[glance_store]

---

## Pratice

```bash
#组件特殊部分代表演示
[ml2]
type_drivers = flat,vlan
tenant_network_types =
mechanism_drivers = linuxbridge
extension_drivers = port_security

[linux_bridge]
physical_interface_mappings = provider:ens20

[glance_store]
stores = file,http
default_store = file
filesystem_store_datadir = /var/lib/glance/images/
```
