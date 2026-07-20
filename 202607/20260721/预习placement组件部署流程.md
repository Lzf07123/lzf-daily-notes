# 预习placement组件部署流程

## Context

完成neutron阶段模版制作后，预先了解了placement组件的部署流程

---

## Key Takeaway

- placement组件配置依然遵循认证、数据库、组件特殊配置段的编写规律
- 认证配置段[keystone_authtoken]，[api]
- 数据库配置段[placement_database]

---

## Pratice

```bash
#部分配置段演示
[api]
auth_strategy = keystone
```
