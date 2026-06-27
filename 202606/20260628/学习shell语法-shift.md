# 学习shell语法-shift

## Context

受到linux基础命令可以传递多个参数的启发，查阅资料后学习并运用`shift`语法

---

## Key Takeaway

- 一个命令可以接受多个参数
- `shift`可以将参数往右移1位，即丢弃第一个参数；还可以使用`shift N`决定往右移的位数，即丢弃前N个参数

---

## Pratice

```bash
system-info.sh # shift丢弃第一个参数
#!/bin/bash
echo $@
shift
echo $@

--------------------
./system-info.sh "你好" "hello" "world" "世界"
你好 hello world 世界
hello world 世界

--------------------
system-info.sh 丢弃前两个参数
#!/bin/bash
echo $@
shift 2
echo $@

--------------------
./system-info.sh "你好" "hello" "world" "世界"
你好 hello world 世界
world 世界
```

---

## Next Step

为脚本增加子命令
