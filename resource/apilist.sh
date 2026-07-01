#!/bin/bash

# =====================================
#           快捷切换claude端点
# =====================================

# DeepSeek

DEEPSEEK_BASE_URI="https://api.deepseek.com/anthropic"
DEEPSEEK_API_KEY="<YOUR_DEEPSEEK_API_KEY>"
DEEPSEEK_MODEL="deepseek-v4-pro[1m]"    # MODEL: deepseek-v4-pro[1m]、deepseek-v4-flash

# 智谱清言

ZHIPU_BASE_URI="https://open.bigmodel.cn/api/anthropic"
ZHIPU_API_KEY=""
ZHIPU_MODEL="GLM-5.2"                          # MODEL: GLM-5.2、GLM-5.1、GLM-5V-Turbo；更多模型参考官网https://docs.bigmodel.cn/cn/guide/start/model-overview

if [ $# -eq 0 ]; then
    echo "请输入需要切换的端点"
    echo "用法示例：$0 {DeepSeek|智谱清言}"
    exit 1
fi

clear_env(){
    unset ANTHROPIC_BASE_URL
    unset ANTHROPIC_AUTH_TOKEN
    unset ANTHROPIC_MODEL
    unset ANTHROPIC_DEFAULT_OPUS_MODEL
    unset ANTHROPIC_DEFAULT_SONNET_MODEL
    unset ANTHROPIC_DEFAULT_HAIKU_MODEL
    unset CLAUDE_CODE_SUBAGENT_MODEL
}

case $1 in
    "DeepSeek"|"deepseek"|"ds")
        echo "切换到 DeepSeek 端点"
        export ANTHROPIC_BASE_URL=${DEEPSEEK_BASE_URI}
        export ANTHROPIC_AUTH_TOKEN=${DEEPSEEK_API_KEY}
        export ANTHROPIC_MODEL=${DEEPSEEK_MODEL}
        export ANTHROPIC_DEFAULT_OPUS_MODEL=${DEEPSEEK_MODEL}
        export ANTHROPIC_DEFAULT_SONNET_MODEL=${DEEPSEEK_MODEL}
        export ANTHROPIC_DEFAULT_HAIKU_MODEL=${DEEPSEEK_MODEL}
        export CLAUDE_CODE_SUBAGENT_MODEL=${DEEPSEEK_MODEL}
        ;;
    "智谱清言"|"Zhipu"|"zhipu"|"zp")
        echo "切换到 智谱清言 端点"
        export ANTHROPIC_BASE_URL=${ZHIPU_BASE_URI}
        export ANTHROPIC_AUTH_TOKEN=${ZHIPU_API_KEY}
        export ANTHROPIC_MODEL=${ZHIPU_MODEL}
        export ANTHROPIC_DEFAULT_OPUS_MODEL=${ZHIPU_MODEL}
        export ANTHROPIC_DEFAULT_SONNET_MODEL=${ZHIPU_MODEL}
        export ANTHROPIC_DEFAULT_HAIKU_MODEL=${ZHIPU_MODEL}
        export CLAUDE_CODE_SUBAGENT_MODEL=${ZHIPU_MODEL}
        ;;
    *)
        echo "未知的端点选项: $1"
        echo "用法示例：$0 {DeepSeek|智谱清言}"
esac