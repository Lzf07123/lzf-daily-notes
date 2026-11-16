# 复习podman内容与了解dns权威服务器搭建

## Context

复习podman内容与了解dns权威服务器搭建，练习编写Containerfile构建镜像与使用bind搭建dns服务器

---

## Key Takeaway

- Containerfile/Dockerfile基础编写
- podman build -t name:version .
- 安装bind、bind-utils软件包搭建dns服务器
- 修改配置文件与编写正向解析区域文件
- 重载服务

---

## Pratice

- named-checkzone检查区域无误后重载可以减少错误出现
- 防火墙放行对应服务/端口
- 构建镜像时若Containerfile文件不是标准命名可以使用-f指定

---

## Next Step

巩固知识
