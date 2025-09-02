#!/bin/bash

# 获取脚本所在目录
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

# 删除脚本路径下的 ./map/pose/pcd 目录下的所有 .pcd 文件
rm -rf "$SCRIPT_DIR/../map/bag"

# 删除脚本路径下的 ./map/pose/pose.json 文件
rm -f "$SCRIPT_DIR/../map/edge.txt"

echo "文件已删除"
