#替换官方镜像 osrf/ros:noetic-desktop-full
FROM elainasuki/ros:ros-noetic-full

#定义用户
ARG USERNAME=yc-dlan

# 添加用户
USER root

RUN useradd -m -u 1001 -G wheel -s /bin/bash yc-dlan \
    && echo "umask 002" | sudo tee -a /etc/profile /etc/bash.bashrc

# 安装基础依赖
RUN apt-get update \
    && apt-get install -y \
    net-tools \
    nautilus \
    bash-completion \
    clangd \
    git \
    gedit \
    gdb \
    python3-pip \
    # 添加ROS Noetic编译工具
    ros-noetic-catkin \
    python3-catkin-pkg \
    python3-catkin-tools \
    python3-osrf-pycommon \
    ros-noetic-ros-base \
    && pip3 install -U colcon-common-extensions

RUN add-apt-repository -y ppa:borglab/gtsam-release-4.0

RUN apt-get install -y \
    libgtsam-dev \
    libgtsam-unstable-dev

# 安装必要的包
RUN apt-get update && apt-get install -y \
    ros-noetic-gazebo-ros \
    ros-noetic-ros-controllers \
    terminator \
    ros-noetic-ackermann-msgs \
    ros-noetic-geometry2 \
    ros-noetic-hector-gazebo \
    ros-noetic-hector-models \
    ros-noetic-jsk-rviz-plugins \
    ros-noetic-ros-control \
    ros-noetic-gtsam \
    ros-noetic-tf \
    ros-noetic-tf2\
    ros-noetic-navigation \
    ros-noetic-robot-localization \
    ros-noetic-robot-state-publisher \
    ros-noetic-velodyne-simulator \
    git \
    wget \
    bash-completion \
    && apt-get upgrade -y

RUN mkdir -p /ros_ws/src

USER ${USERNAME}

CMD [ "/bin/bash" ]