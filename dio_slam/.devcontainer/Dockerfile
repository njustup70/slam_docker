#FROM osrf/ros:noetic-desktop-full
FROM elainasuki/ros:ros-noetic-full
# 定义用户和用户组
ARG USERNAME=Elaina
# USER ${USERNAME}
USER root
WORKDIR  /home/${USERNAME}/packages

RUN  sudo apt-get install -y  libomp-dev libpcl-dev libeigen3-dev 
RUN mkdir -p catkin_ws/src && cd catkin_ws/src \
    && git clone https://github.com/vectr-ucla/direct_lidar_odometry.git
COPY  include /home/${USERNAME}/packages/catkin_ws/devel/include
RUN cd catkin_ws &&  . /home/${USERNAME}/packages/ws_livox/devel/setup.sh && catkin_make \
    && echo 'source ~/packages/catkin_ws/devel/setup.bash' >> /home/${USERNAME}/.bashrc