# 联调keystone与glance等组件

## Context

无文档从零开始部署前置依赖、keystone、glance帮助记忆部署流程，修改keystone模板配置文件错误

---

## Key Takeaway

- 部署流程间需加强记忆
- 新创建系统用户需要赋予角色
- 已记忆80%流程，部分细节需加强
- privider与provider相近，易混

---

## Pratice

```bash
#赋权演示
openstack role add --project service --user SERVICE_USER admin

#keystone配置文件
[token]
provider = fernet
```
