# 完成部分RHCE第四次综合作业

## Context

完成部分RHCE第四次综合作业，练习了shell脚本、位置变量、从标准输入获取变量、包管理器安装/卸载/查找/根据文件反推包、两种软件安装办法、flatpak替换国内加速源、flatpak安装软件/运行软件

---

## Key Takeaway

- shell script
- rpm/yum/dnf
- flatpak
- journal

---

## Pratice

- rpm -ivh：安装rpm包并显示详细信息与进度哈希
- rpm -evh：卸载rpm包并显示详细信息与进度哈希
- rpm -q：查询rpm包
- rpm -ql：查询rpm包释放的文件
- rpm -qf：从文件反推rpm包
- 现代版本yum为dnf的别名，使用的是yum命令但实际上是链接到dnf
- yum search：查询相关软件包
- yum provides：反推相关软件包
- yum install/remove：安装/卸载软件包
- flatpak remotes：查看所有远程仓库
- flatpak remote-add：添加仓库
- flatpak install：安装软件
- flatpak uninstall：卸载软件
- flatpak run：运行软件
- flatpak安装软件时会一同安装软件环境，软件间环境互相隔离互不干扰
- journal是系统日志，使用journalctl查看日志

---

## Next Step

继续完成练习
