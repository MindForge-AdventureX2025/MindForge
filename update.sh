#!/bin/bash

# update.sh - 自动更新网站和服务器代码

# 设置错误处理（任何命令失败时立即退出）
set -e

# 定义仓库和目录
WEBSITE_REPO="https://github.com/MindForge-AdventureX2025/MindForgeWebsite.git"
WEBSITE_DIR="./website"

SERVER_REPO="https://github.com/MindForge-AdventureX2025/MindForgeServer.git"
SERVER_DIR="./server"

# 更新网站仓库
echo "正在处理网站仓库..."
if [ -d "$WEBSITE_DIR" ]; then
    # 如果目录已存在，执行git pull更新
    echo "检测到现有网站目录，执行更新..."
    cd "$WEBSITE_DIR"
    git pull origin main
    cd ..
else
    # 如果目录不存在，执行git clone克隆
    echo "未找到网站目录，执行克隆..."
    git clone "$WEBSITE_REPO" "$WEBSITE_DIR"
fi

# 更新服务器仓库
echo "正在处理服务器仓库..."
if [ -d "$SERVER_DIR" ]; then
    # 如果目录已存在，执行git pull更新
    echo "检测到现有服务器目录，执行更新..."
    cd "$SERVER_DIR"
    git pull origin main
    cd ..
else
    # 如果目录不存在，执行git clone克隆
    echo "未找到服务器目录，执行克隆..."
    git clone "$SERVER_REPO" "$SERVER_DIR"
fi

echo "更新完成！"