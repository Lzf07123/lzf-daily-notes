# shell-for循环的运用

## Context

练习并理解`for循环`的基础用法。

---

## Key Takeaway

- 理解了for循环语句的语法、用法
- 学习了使用for循环遍历数组并打印数组内的值

> `for循环`通常用于遍历目录或一些无法知悉数量的集合。

---

## Pratice

```bash
#!/bin/bash

test_data=("系统版本" "主机名" "登陆用户" "外部IP地址" "运行时间" "总内存")

for i in ${test_data[@]}; do
    echo ${i}
done

```
