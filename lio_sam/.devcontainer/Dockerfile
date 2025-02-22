# 使用 ROS Humble 的官方镜像作为基础镜像
FROM osrf/ros:humble-desktop-full-jammy

# 定义用户和用户ID
ARG USERNAME=Nagisa
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# 创建用户
RUN groupadd -g $USER_GID $USERNAME && \
    useradd -m -u $USER_UID -g $USER_GID -s /bin/bash $USERNAME

# 切换到 root 用户来执行系统软件包安装
USER root

# 更新包列表，安装 curl 和其它依赖
RUN apt-get update \
    && apt-get install -y curl \
    && curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add - \
    && apt-get update \
    && apt install -y python3-colcon-common-extensions \
    && apt-get install -y ros-humble-navigation2 \
    && apt-get install -y ros-humble-robot-localization \
    && apt-get install -y ros-humble-robot-state-publisher \
    && apt install -y ros-humble-perception-pcl \
    && apt install -y ros-humble-pcl-msgs \
    && apt install -y ros-humble-vision-opencv \
    && apt install -y ros-humble-xacro \
    && rm -rf /var/lib/apt/lists/*

# 安装 GTSAM 和相关依赖
RUN apt-get update \
    && apt install -y software-properties-common \
    && add-apt-repository -y ppa:borglab/gtsam-release-4.1 \
    && apt-get update \
    && apt install -y libgtsam-dev libgtsam-unstable-dev \
    && rm -rf /var/lib/apt/lists/*

# 切换回 Nagisa 用户
USER $USERNAME


# 创建工作空间并克隆代码库
RUN mkdir -p ~/liosam_ws/src \
    && cd ~/liosam_ws/src \
    && git config --global http.postBuffer 524288000 \
    && git config --global http.timeout 300 \
    && git clone --depth 1 --branch ros2 https://github.com/TixiaoShan/LIO-SAM.git \
    && cd .. \
    && /bin/bash -c "source /opt/ros/humble/setup.bash && colcon build"



# 添加 ROS 环境设置到 .bashrc
USER root
RUN echo 'export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH' >> /home/${USERNAME}/.bashrc \
    && echo "source /opt/ros/humble/setup.bash" >> /home/${USERNAME}/.bashrc

# 设置容器启动时默认执行的命令
CMD ["/bin/bash"]

