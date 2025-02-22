#!/bin/bash
last_dir=$(basename $(pwd))
echo "当前目录是: $last_dir"
cd ./ros_ws
# 如果有install、build、log目录则删除
for dir in install build log; do
    if [ -d "$dir" ]; then
        echo "删除目录: $dir"
        rm -rf "$dir"
    fi
done
#绕过交互式检查,通过-i选项强制bash以交互模式运行

bash -i -c "source ~/.bashrc && catkin_make"
setup_file="$(pwd)/devel/setup.bash"
if ! grep -qFx "source \"$setup_file\"" ~/.bashrc; then
    echo "source \"$setup_file\"" >> ~/.bashrc
fi
#打开终端保持容器运行
exec /bin/bash