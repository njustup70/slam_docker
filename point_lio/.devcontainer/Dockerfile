#FROM osrf/ros:noetic-desktop-full
FROM elainasuki/ros:ros-noetic-full
# 定义用户
ARG USERNAME=Elaina
WORKDIR /home/$USERNAME/packages
USER root
# 安装必要的POINT-LIO依赖
RUN apt-get update && apt-get install -y \
    libgoogle-glog-dev \    
    libgflags-dev \        
    libeigen3-dev \
    libpcl-dev \
    ros-noetic-pcl-ros \
    ros-noetic-tf2-sensor-msgs \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir -p pointlio_ws/src && cd pointlio_ws/src && git clone --recurse-submodules https://github.com/hku-mars/Point-LIO.git
RUN cd pointlio_ws && . /home/${USERNAME}/packages/ws_livox/devel/setup.sh && catkin_make 
RUN echo "source /home/${USERNAME}/packages/pointlio_ws/devel/setup.bash" >> /home/$USERNAME/.bashrc
CMD ["/bin/bash"]
