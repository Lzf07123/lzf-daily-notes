# 完成RHCE第十二节课

## Context

完成RHCE第十二节课，讲述了LVM逻辑卷管理，存储概念，软硬链接，firewall防火墙工具等

---

## Key Takeaway

- LVM三层模型
- LVM工具系列命令：pv/vg/lv
- 软硬链接创建工具：ln
- 网络存储概念
- 防火墙概念

---

## Pratice

- LVM三层模型：创建时从pv-vg-lv由下而上创建，移除时反之
- ln软硬链接：-s为软链接，链接指向源文件，不加选项为硬链接，链接指向同一个inode编号；软连接可以跨文件系统，硬链接不可以，受文件系统inode数量影响
- NAS网络附属存储：注意防火墙与SELinux

---

## Next Step

巩固知识
