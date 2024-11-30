#FROM osrf/ros:noetic-desktop-full
FROM ghcr.io/sloretz/ros:noetic-desktop-full
# 定义用户和用户组
ARG USERNAME=Elaina
ARG USER_UID=1000
ARG USER_GID=$USER_UID

ENV DEBIAN_FRONTEND=noninteractive
#安装必要软件
RUN apt-get update \
    && apt-get install -y  net-tools nautilus bash-completion clangd git gedit gdb 
# nautilus-extension-gnome-terminal dbus-x11 libcanberra-gtk-module libcanberra-gtk3-module git-lfs
# 创建用户组和用户
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    # 配置环境变量
    && echo "$USERNAME:'" | chpasswd \
    # 允许用户使用 sudo
    && usermod -aG sudo $USERNAME \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && echo 'source /opt/ros/noetic/setup.bash' >> /home/$USERNAME/.bashrc \
    # 使新用户的 `.bashrc` 文件生效
    && chown $USERNAME:$USERNAME /home/$USERNAME/.bashrc
USER ${USERNAME}
WORKDIR /home/${USERNAME}
#安装雷达驱动
RUN mkdir packages && cd packages && git clone https://github.com/Livox-SDK/Livox-SDK.git && cd Livox-SDK/build \
    && cmake .. && make -j8 && sudo make install \
    && echo 'export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH' >> /home/${USERNAME}/.bashrc 
#安装雷达ros驱动
RUN . /opt/ros/noetic/setup.sh \
    && cd packages && mkdir ws_livox && cd ws_livox && mkdir src && cd src \
    && git clone https://github.com/Livox-SDK/livox_ros_driver.git && cd .. && catkin_make

RUN echo 'source ~/slam/fast_lio2/ros_ws/devel/setup.bash' >> /home/${USERNAME}/.bashrc  
#echo 'source ~/slam/fast_lio2/packages/catkin_ws/devel/setup.bash' >> /home/${USERNAME}/.bashrc 

USER $USERNAME
CMD ["/bin/bash"]

