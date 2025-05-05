#!/bin/bash
last_dir=$(basename $(pwd))
echo "当前目录是: $last_dir"
cd ./nagisa_ws

# 如果有install、build、log目录则删除（可选）
# for dir in install build log devel; do
#     if [ -d "$dir" ]; then
#         echo "删除目录: $dir"
#         rm -rf "$dir"
#     fi
# done

# 绕过交互式检查，通过-i选项强制bash以交互模式运行
bash -i -c "source ~/.bashrc;catkin_make"
# 持久化配置到.bashrc
setup_file="$(pwd)/../ros_manager/devel/setup.bash"
if ! grep -qFx "source \"$setup_file\"" ~/.bashrc; then
    echo "source \"$setup_file\"" >> ~/.bashrc
fi

# 可选：保持容器运行
# exec /bin/bash