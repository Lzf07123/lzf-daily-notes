# 全量克隆openeuler软件源部署本地镜像站

## Context

在学习过程中发现openeuler软件源均已归档，获取速度较慢，全量克隆软件搭建本地镜像站

---

## Key Takeaway

- 学习使用`reposync`全量同步远程软件镜像站
- 使用nginx暴露本地文件为局域网内机器提供软件源
- 使用`createrepo`为仓库创建元数据索引
- 使用`tar`打包软件源共享给队员

---

## Pratice

```bash
#reposync同步远程软件镜像站
reposync --download-metadata -p /opt/repo --repo OS --repo everything --repo EPOL

#repocreate为仓库创建元数据索引
createrepo /opt/repo

#openeuler22.09软件源共享
链接：https://pan.baidu.com/s/1NTvxY6AmAXDLvdl85g39bw?pwd=VD82
```
