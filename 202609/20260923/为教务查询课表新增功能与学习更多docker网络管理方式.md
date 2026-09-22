# 为教务查询课表新增功能与学习更多docker网络管理方式

## Context

使用codex为教务查询课表新增网络日历订阅功能与学习更多docker网络管理方式

---

## Key Takeaway

- 需求表达能力，与codex对话较少轮次完成任务
- 使用firewall控制docker暴露端口
- 使用一个共享网络为docker服务定义别名，从而快速路由业务
- 使用find查找近期创建的文件

---

## Pratice

- 使用`firewall-cmd --permanent --zone=ZONE --add-forward-port=...`添加端口转发至容器
- 创建共享网络；在compose文件networks字段下定义服务别名，使得服务可以快速被发现
- 使用`find . -mmin -30`查找当前目录下30分钟以内修改过的文件

---

## Next Step

巩固知识
