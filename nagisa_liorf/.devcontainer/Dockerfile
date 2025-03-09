FROM elainasuki/ros:ros2-humble-full-v3

# 定义用户和用户组
ARG USERNAME=Nagisa
ARG USER_UID=1001
ARG USER_GID=1000
ARG GROUP_NAME=wheel

# 创建用户并指定 UID 和 GID
RUN useradd -m -u $USER_UID -g $GROUP_NAME -G sudo,wheel $USERNAME \
    && echo "umask 002" | sudo tee -a /etc/profile /etc/bash.bashrc

# 设置工作目录
WORKDIR /home/$USERNAME
# 切换回root用户
USER root

# 更新并安装必要的软件包
RUN apt-get update && apt-get install -y \
    ros-humble-robot-localization \
    ros-humble-slam-toolbox \
    ros-humble-pointcloud-to-laserscan \
    sudo \
    git \
    software-properties-common \
    && apt-get clean

# 安装 GTSAM
RUN add-apt-repository ppa:borglab/gtsam-release-4.1 && sudo apt install -y libgtsam-dev libgtsam-unstable-dev

# 切换回 Nagisa 用户
USER $USERNAME
# 设置工作空间并克隆代码
RUN cd ~ && mkdir -p ~/liorf_ws/src \
    && cd ~/liorf_ws/src && git clone https://github.com/YJZLuckyBoy/liorf_localization.git \
    && cd liorf_localization && git checkout liorf_localization-ros2 
RUN cd ~/liorf_ws && /bin/bash -c "source /opt/ros/humble/setup.bash && colcon build --symlink-install"

# 安装导航依赖
RUN sudo apt-get install -y ros-humble-nav2-bringup

# 配置用户环境
RUN mkdir -p /home/$USERNAME/.config/fish \
    && echo "source /opt/ros/humble/setup.bash" >> /home/$USERNAME/.bashrc \
    && echo "source ~/liorf_ws/install/setup.bash" >> /home/$USERNAME/.bashrc \
    && echo "source ~/packages/nagisa_liorf/nagisa_ws/install/setup.bash" >> /home/$USERNAME/.bashrc \
    && echo "bass source ~/packages/nagisa_liorf/nagisa_ws/install/setup.bash" >> /home/$USERNAME/.config/fish/config.fish \
    && echo "bass source source ~/liorf_ws/install/setup.bash" >> /home/$USERNAME/.config/fish/config.fish
   



# 设置默认命令
CMD ["/bin/bash"]

