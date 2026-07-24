# 梳理cinder组件部署流程

## Context

按照计划补回cinder组件的部署训练计划，由于时间紧凑状态不佳无法完成swift组件的训练，暂时忽略swift组件

---

## Key Takeaway

- 学习使用fdisk为块设备分区
- 学习使用mkfs.ext4格式化硬盘
- 学习lvm逻辑卷pv物理卷、vg卷组的创建
- 使用通用组件思路填写配置文件

---

## Pratice

注意python类命名差异：填写volume_driver时还使用老思路最后一节函数使用单词首字母大写，导致无法找到相应类无法正常启动cinder-volume

---

## Next Step

进入ISCSI训练计划，梳理部署思维导图，加强cinder组件部署记忆
