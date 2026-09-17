# 了解nmcli命令使用方法并创建集训服务器模板

## Context

了解nmcli命令使用方法并创建集训服务器模板，学习nmcli命令方便为集训服务器修改ip地址，创建模板方便快速创建服务器

---

## Key Takeaway

- 添加连接：`nmcli connection add type TYPE ifname NETDEV con-name "NAME" ipv4.addersses IPADDERSS...`
- 修改配置：`nmcli connection modify NAME ipv4.*...`
- 关闭连接：`nmcli connection down NAME`
- 开启连接：`nmcli connection up NAME`
- 重载网卡：`nmcli device reapply NETDEV`
- 探测端口：`nc -zv HOST PORT`
- 了解一些podman知识

---

## Pratice

- 使用`nmcli connection add type TYPE ifname NETDEV con-name "NAME" ipv4.addersses IPADDERSS...`快速新增网卡
- 使用`nmcli connection modify NETDEV ipv4.*...`快速修改网卡配置
- 使用`nmcli device reapply NETDEV`重载网卡
- 使用`nc -zv HOST PORT`探测端口

---

## Next Step

深入了解podman
