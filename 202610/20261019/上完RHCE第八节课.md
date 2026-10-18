# 上完RHCE第八节课

## Context

上完RHCE第八节课，了解ssh两种认证方式的加密解密过程与ssh基本的用法

---

## Key Takeaway

- ssh连接远程主机
- sshd_config服务端配置
- ssh-keygen创建密钥等一系列密钥操作
- ssh-copy-id传递公钥至远程主机
- ssh-agent托管密钥密码
- ssh本地转发、远程转发、动态端口转发
- shell基本概念

---

## Pratice

- `ssh USER@HOST`最基本的ssh client操作，可以用于连接远程主机
- `sshd_config`是sshd服务端的配置文件，通过修改里面的内容可以控制服务端的配置，例如设置密钥登录，禁止密码登录，运行ssh登录到root用户等操作；生产环境建议将ssh配置为：仅监听控制平面网卡、关闭密码登录，仅允许密钥登录、关闭ssh直接登录到root、通过黑白名单控制允许连接的主机、密钥文件尽量使用物理介质传输
- `ssh-keygen`直接使用命令可以创建一个密钥对，为私钥设置密码可以增强安全性，即使私钥泄漏，不知道密码也无法使用
- `ssh-keygen -R HOST`从已知的主机公钥里移除HOST主机
- `ssh-keygen -l KEYFILE`查看密钥文件的指纹信息
- `ssh-keygen -p -f KEYFILE`为密钥文件设置密码/去除密码
- `ssh-copy-id USER@HOST`方便的传输公钥文件，自动在USER家目录下.ssh目录生成authorized_keys文件记录公钥，若没有.ssh目录或authorized_keys文件，命令将自动创建；authorized_keys文件各用户独立不互通，若需要免密登录同一个主机的不同用户，就需要给每个用户都传递或复制一个公钥
- `ssh -Nf -L LOCALPORT:REMOTEHOST:REMOTEPORT 中间主机`将远程服务通过ssh隧道转发到本地端口，适合开发环境测试使用
- `ssh -Nf -R REMOTEPORT:LOCALHOST:LOCALPORT 中间主机`将本地服务通过ssh隧道转发到远程端口，若远程主机具备公网，可以将本地服务暴露到公网
- `ssh -Nf -D LOCALHOST:LOCALPORT 中间主机`在本地开启一个端口，配置代理等相关配置后请求从LOCALPORT端口转发至中间主机，由中间主机代理访问互联网，典型的正向代理，可以访问一般访问不到的地方

---

## Next Step

巩固知识
