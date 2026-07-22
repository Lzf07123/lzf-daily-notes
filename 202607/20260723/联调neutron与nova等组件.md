# 联调glance与neutron等组件

## Context

无文档从零开始部署前置依赖、keystone、glance、neutron、placement、nova帮助记忆部署流程；因精神不佳本次联调止步与neutron组件controller节点部分

---

## Key Takeaway

- 每个组件都遵循认证、数据库连接、组件特殊配置这个规律编写配置文件
- 认证部分代表[keystone_authtoken]
- 数据库部分代表[database]、[placement_database]、[api_database]
- 组件特殊部分代表[ml2]、[linux_bridge]、[glance_store]、[service_user]、[placement]、[neutron]

---

## Pratice

```bash
#组件特殊部分代表演示
/etc/nova/nova.conf
[placement]
auth_url = http://controller:5000
auth_type = password
region_name = RegionOne
project_domain_name = Default
user_domain_name = Default
project_name = service
username = placement
password = 000000

```
