# 为OpenEuler2209创建模版

## Context

为系统OpenEuler22.09创建虚拟机与快照模版，以便后续私有云学习的开展

---

## Key Takeaway

- 学习使用qcow2镜像格式创建虚拟机
- 将qcow2格式镜像导入PVE并使用
- 为已归档系统修改软件源

---

## Pratice

```bash
#使用openeuler归档仓库
cat > /etc/yum.repos.d/openEuler-archive.repo << 'EOF'
[OS]
name=openEuler-22.09-archive
baseurl=https://archives.openeuler.openatom.cn/openEuler-22.09/OS/$basearch/
enabled=1
gpgcheck=0

[everything]
name=openEuler-22.09-everything-archive
baseurl=https://archives.openeuler.openatom.cn/openEuler-22.09/everything/$basearch/
enabled=1
gpgcheck=0
EOF

#将qcow2格式镜像导入PVE并添加到虚拟机
qm disk import <vmid> <source> <storge>
```
