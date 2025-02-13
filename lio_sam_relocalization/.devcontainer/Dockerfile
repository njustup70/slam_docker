#FROM osrf/ros:noetic-desktop-full
FROM elainasuki/ros:ros-noetic-full
# 定义用户和用户组
ARG USERNAME=Elaina
USER ${USERNAME}
WORKDIR  /home/${USERNAME}/packages

RUN sudo add-apt-repository ppa:borglab/gtsam-release-4.0 \ 
    && sudo apt-get install -y ros-noetic-navigation  ros-noetic-robot-localization ros-noetic-robot-state-publisher libgtsam-dev libgtsam-unstable-dev
RUN mkdir -p catkin_ws/src && cd catkin_ws/src \
    &&  git clone https://github.com/harshalkataria/LIO-SAM-Localization.git \
    && cd .. && . /opt/ros/noetic/setup.sh && catkin_make \
    && echo 'source ~/packages/catkin_ws/devel/setup.bash' >> /home/${USERNAME}/.bashrc