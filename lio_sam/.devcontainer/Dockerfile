FROM osrf/ros:kinetic-desktop-full-xenial

# 定义用户和用户ID
ARG USERNAME=Nagisa
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# 创建用户
RUN groupadd -g $USER_GID $USERNAME && \
    useradd -m -u $USER_UID -g $USER_GID -s /bin/bash $USERNAME

# 切换到 root 用户来执行系统软件包安装
USER root

RUN apt-get update \
    && apt-get install -y curl \
    && curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add - \
    && apt-get update \
    && apt-get install -y ros-kinetic-navigation \
    && apt-get install -y ros-kinetic-robot-localization \
    && apt-get install -y ros-kinetic-robot-state-publisher \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
    && apt install -y software-properties-common \
    && add-apt-repository -y ppa:borglab/gtsam-release-4.0 \
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
    && git clone --depth 1 --branch master https://github.com/TixiaoShan/LIO-SAM.git \
    && cd .. \
    && /bin/bash -c "source /opt/ros/kinetic/setup.bash && catkin_make"



# 添加 ROS 环境设置到 .bashrc
USER root
RUN echo 'export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH' >> /home/${USERNAME}/.bashrc \
    && echo "source /opt/ros/kinetic/setup.bash" >> /home/${USERNAME}/.bashrc

# 设置容器启动时默认执行的命令
CMD ["/bin/bash"]
WORKDIR /home/$USERNAME

