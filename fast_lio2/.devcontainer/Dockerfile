#FROM osrf/ros:noetic-desktop-full
FROM elainasuki/ros:ros-noetic-full
# 定义用户
ARG USERNAME=Elaina
WORKDIR /home/$USERNAME/packages
USER root
# 更新并安装依赖
RUN apt-get update && apt-get install -y \
    libgoogle-glog-dev libgflags-dev libatlas-base-dev libsuitesparse-dev 
# 下载并安装 Ceres-Solver
RUN wget https://github.com/ceres-solver/ceres-solver/archive/refs/tags/2.0.0.tar.gz && \
    tar zxf 2.0.0.tar.gz && \
    cd ceres-solver-2.0.0 && \
    mkdir build && cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    make -j$(nproc) && make install && \
    cd /home/${USERNAME}/packages && rm -rf ceres-solver-2.0.0 2.0.0.tar.gz
USER $USERNAME
RUN mkdir -p catkin_ws/src && cd catkin_ws/src && git clone --recurse-submodules https://github.com/hku-mars/FAST_LIO.git \
    && git clone https://github.com/hku-mars/LiDAR_IMU_Init.git \
    && cd .. && . /home/${USERNAME}/packages/ws_livox/devel/setup.sh && catkin_make \
    && echo 'source ~/packages/catkin_ws/devel/setup.bash' >> /home/${USERNAME}/.bashrc
CMD ["/bin/bash"]

