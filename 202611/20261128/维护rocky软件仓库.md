# 维护rocky软件仓库

## Context

维护rocky软件仓库，由于rocky10.3上线，远程仓库将软件源迁移至10.3路径，原10.2路径无法正常同步。

---

## Key Takeaway

- 修改同步脚本设置的版本代号
- yum仓库引用的源地址

---

## Pratice

- sed -i 's/10.2/10.3/' /etc/yum.repos.d/\*.repo：修改仓库引用源代号

---

## Next Step

巩固知识
