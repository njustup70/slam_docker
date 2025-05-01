#!/bin/bash

# 获取脚本所在目录
SCRIPT_DIR=$(dirname "$0")
TAG1="fastlio2-image"
TAG2="fastlio2-pose-image"
# 镜像仓库，可通过环境变量 IMAGE_REPO 设置，默认是 elaina/fastlio2
IMAGE_REPO=${IMAGE_REPO:-elainasuki/rc2025}

# 镜像名称
IMAGE1="$IMAGE_REPO:$TAG1"
IMAGE2="$IMAGE_REPO:$TAG2"

# 默认平台
PLATFORMS="linux/amd64"

# 如果设置了 BUILD_ARM64=true，添加 arm64 平台
if [[ "${BUILD_ARM64}" == "true" ]]; then
    PLATFORMS="linux/amd64,linux/arm64"
fi

# 构建逻辑
if [[ "$1" == "--git-action" ]]; then
    echo "GitHub Action 模式：构建并推送两个镜像"

    docker buildx build \
        --platform "$PLATFORMS" \
        -t "$IMAGE1" \
        -f "$SCRIPT_DIR/Dockerfile" \
        "$SCRIPT_DIR" \
        --push

    docker buildx build \
        --platform "$PLATFORMS" \
        -t "$IMAGE2" \
        -f "$SCRIPT_DIR/pose.Dockerfile" \
        "$SCRIPT_DIR" \
        --push
else
    echo "本地构建逻辑"
    if [[ "$1" == "pose" ]]; then
        docker build -t "$IMAGE2" -f "$SCRIPT_DIR/pose.Dockerfile" "$SCRIPT_DIR"
    else
        docker build -t "$IMAGE1" -f "$SCRIPT_DIR/Dockerfile" "$SCRIPT_DIR"
    fi
fi
