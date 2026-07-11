# 为工控主机重装系统并按照remmina实现RDP连接

## Context

在半月前接收到家里反馈客厅工控机系统无法正常使用，经检查发现winodws系统过于笨重，8g运行内存、30g存储无法承载，故重装为debian13-kde版，安装`remmina、remmina-plugin-rdp`支持RDP连接

---

## Key Takeaway

- 熟练运用重装系统方法
- 为debian系统更换加速源
- 安装rdp支持软件包`remmina、remmina-plugin-rdp`

---

## Pratice

```bash
sudo apt update
sudo apt install -y upgrade
sudo apt install -y remmina remmina-plugin-rdp
```
