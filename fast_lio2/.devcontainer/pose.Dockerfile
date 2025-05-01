#FROM osrf/ros:noetic-desktop-full
FROM elainasuki/ros:ros-noetic-full
# 定义用户
ARG USERNAME=Elaina
WORKDIR /home/$USERNAME/packages
USER root
RUN mkdir -p catkin_ws/src && cd catkin_ws/src && git clone --recurse-submodules https://github.com/YWL0720/FAST_LIO.git
COPY  include /home/$USERNAME/packages/catkin_ws/devel/include/fast_lio
RUN cd catkin_ws && . /home/${USERNAME}/packages/ws_livox/devel/setup.sh && catkin_make \
    && echo 'source ~/packages/catkin_ws/devel/setup.bash' >> /home/${USERNAME}/.bashrc
CMD ["/bin/bash"]

