#FROM osrf/ros:noetic-desktop-full
FROM elainasuki/ros:ros-noetic-full
# 定义用户
ARG USERNAME=Elaina
WORKDIR /home/$USERNAME/packages
USER root
RUN apt-get update \
    && apt install -y software-properties-common \
    && add-apt-repository -y ppa:borglab/gtsam-release-4.0 \
    && apt-get update \
    && apt install -y libgtsam-dev libgtsam-unstable-dev \
    && rm -rf /var/lib/apt/lists/*
USER $USERNAME
RUN mkdir -p catkin_ws/src && cd catkin_ws/src && git clone --recurse-submodules https://github.com/hku-mars/Voxel-SLAM
RUN cd catkin_ws && . /home/${USERNAME}/packages/ws_livox/devel/setup.sh && catkin_make \
    && echo 'source ~/packages/catkin_ws/devel/setup.bash' >> /home/${USERNAME}/.bashrc
CMD ["/bin/bash"]

