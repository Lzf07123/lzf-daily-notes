# 编写NGINX分析脚本分析访问IP排名

## Context

学习数据清洗，使用文本三剑客按特定格式清洗数据，分析IP访问排名

---

## Key Takeaway

- 使用`awk`提取特定字段
- 使用`grep`清洗无用符号，提取IP地址
- 使用`sort`进行排序，方便后续去重
- 使用`uniq -c`去重并统计出现次数
- 使用`head -n N`获取访问排名前N的IP

---

## Pratice

```bash
#!/bin/bash

FILE=$1
NUM=${2:-10}

if [ $# -eq 0 ]; then
  echo "参数不足"
  echo "使用示例：$0 <FILE-NAME> [TOP-NUM]"
  exit 1
fi

ALLLINE=$(wc -l ${FILE} | awk '{print $1}')

check(){
  local num=1
  echo -e "排名\tIP\t\t出现次数"
  while [ ${num} -le ${NUM} ]; do
    IP=$(awk -F" " '{print $12}' ${FILE} | grep -Eo "[^]]*" | sort | uniq -c | sort -rn | head -n ${NUM} | awk -v i="${num}" 'NR==i {print $2}')
    IPNUM=$(awk -F" " '{print $12}' ${FILE} | grep -Eo "[^]]*" | sort | uniq -c | sort -rn | head -n ${NUM} | awk -v i="${num}" 'NR==i {print $1}')
    echo -e "TOP${num}\t${IP}\t ${IPNUM}"
    ((num+=1))
  done
}


check
```
