FROM elainasuki/ros:ros-melodic-full


# 定义用户和用户ID


# 定义用户和用户ID
ARG USERNAME=Elaina
ARG USER_UID=1000
ARG USER_GID=$USER_UID


# 切换到 root 用户来执行系统软件包安装
USER root

# RUN apt-get update \
#     && apt install -y software-properties-common \
#     && add-apt-repository -y ppa:borglab/gtsam-release-4.0 \
#     && apt-get update \
#     && apt install -y libgtsam-dev libgtsam-unstable-dev \
#     && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install unzip && mkdir -p /home/${USERNAME}/gtsam \
    && wget https://github.com/borglab/gtsam/archive/4.0.0-alpha2.zip \
    && unzip 4.0.0-alpha2.zip -d /home/${USERNAME}/gtsam \
    && mkdir -p /home/${USERNAME}/gtsam/gtsam-4.0.0-alpha2/build \
    && cd /home/${USERNAME}/gtsam/gtsam-4.0.0-alpha2/build \
    && cmake .. && make install \
    && rm -rf /home/${USERNAME}/gtsam
# 添加 ROS 环境设置到 .bashrc

# 切换回 Nagisa 用户
USER $USERNAME

# 创建工作空间并克隆代码库
RUN mkdir -p ~/fast_lio_ws/src \
    && cd ~/fast_lio_ws/src \  
    && git clone  https://github.com/yanliang-wang/FAST_LIO_LC.git


USER root
RUN echo "source /opt/ros/melodic/setup.bash" >> /home/${USERNAME}/.bashrc

RUN apt-get update || true  && apt-get install -y  libceres-dev 
USER $USERNAME
RUN cd ~/fast_lio_ws \
    && /bin/bash -c "source /opt/ros/melodic/setup.bash && catkin_make "
# 切换回 Nagisa 用户
USER root
RUN echo "source /home/${USERNAME}/fast_lio_ws/devel/setup.bash" >> /home/$USERNAME/.bashrc

# 设置工作目录
# WORKDIR /home/$USERNAME

# 设置容器启动时默认执行的命令，并自动加载工作空间
CMD ["/bin/bash"]

