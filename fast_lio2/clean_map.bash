#!/bin/bash

# 获取脚本所在目录
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

# 删除脚本路径下的 ./map/pose/pcd 目录下的所有 .pcd 文件
rm -f "$SCRIPT_DIR/map/pose/pcd/"*.pcd

# 删除脚本路径下的 ./map/pose/pose.json 文件
rm -f "$SCRIPT_DIR/map/pose/pose.json"

echo "文件已删除"
