#!/bin/bash

# 获取当前目录的完整路径
current_dir=$(pwd)
last_dir=$(basename "$current_dir")

echo "当前目录是: $current_dir"
echo "脚本参数: $1"
if [[ "$1" == "pose" ]]; then
    docker build -t elaina/fastlio2-pose-image -f "$current_dir/pose.Dockerfile" "$current_dir"
else
    docker build -t elaina/fastlio2-image "$current_dir"
fi
