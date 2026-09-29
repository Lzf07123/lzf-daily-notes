# 巩固RHCE知识与拓展任务管理内容

## Context

巩固RHCE知识与拓展任务管理内容，复习了`find`查询命令与拓展了`jobs`任务查看命令

---

## Key Takeaway

- `find`还可以对查询到的对象进行操作，例如`-delete`删除，`-exec`执行命令等，可以配合`cp`、`mv`等命令进行操作
- `jobs`可以列出在后台运行、暂停的任务，还有一些操作任务的命令还没有学

---

## Pratice

- `find /mnt/pve/data1 -type f -name '*.iso' -delete`删除/mnt/pve/data1目录下拓展名为iso的文件
- `jobs`列出处于后台的任务

---

## Next Step

巩固知识
