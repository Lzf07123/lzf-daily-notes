# shell-if条件判断的运用

## Context

练习并理解`if条件判断`的基本用法

---

## Key Takeaway

- 理解了if条件判断的语法、用法
- 理解了基础的条件运算用法
- 理解了`continue`的作用；跳出本次循环，不执行本次循环`continue`后的命令，直接进入下一次循环
- 理解了`break`的作用；直接跳出循环，进行接下来循环后的命令

---

## Pratice

```bash
#!/bin/bash

test_data=("1、系统版本" "2、主机名" "3、登陆用户" "4、外部IP地址" "5、运行时间" "6、总内存")

for i in ${!test_data[@]}; do
    if (( ${i} <= 2 )); then
        continue
    fi
    echo ${test_data[i]}
done
```
