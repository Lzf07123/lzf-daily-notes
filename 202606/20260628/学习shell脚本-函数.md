# 学习shell脚本-函数

## Context

发现脚本内有许多命令块需要重复使用，了解到shell脚本语法中还有一个叫函数的语法可以将命令块打包重复使用

---

## Key Takeaway

- 理解并运用`函数`打包命令块
- `函数`使用`函数名(){}`的方式定义，只需在函数内定义命令块就可以通过函数调用命令
- 函数之间可以互相调用，使用函数直接写入函数名就可以使用

---

## Pratice

```bash
check_service(){
    systemctl status ${service_name}
    if [ $? -ne 0 ]; then
        clear
        echo -e "${RED}服务：${service_name} 未找到${NC}"
        exit 1
    fi
}
```

---
