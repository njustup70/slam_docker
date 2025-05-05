FROM elainasuki/ros:ros2-humble-full-v3
ARG USERNAME=Elaina
USER root
RUN apt-get update && apt-get install -y libgoogle-glog-dev libgflags-dev libgtest-dev ros-humble-libg2o
# USER ${USERNAME}
WORKDIR /home/${USERNAME}/packages
RUN git clone https://github.com/RainerKuemmerle/g2o.git && \
    cd g2o && mkdir build && cd build && \
    cmake .. && make -j && make install &&\
    rm -rf ../../g2o
RUN sudo mkdir -p funny_slam_ws/src/ && cd funny_slam_ws/src && git clone -b ros2_humble https://github.com/zm0612/funny_lidar_slam.git
RUN . ./ws_livox/install/setup.sh && cd funny_slam_ws && colcon build 
RUN echo "source ~/packages/funny_slam_ws/install/setup.bash" >> /home/${USERNAME}/.bashrc \
    && echo "bass source ~/packages/funny_slam_ws/install/setup.bash" >> /home/${USERNAME}/.config/fish/config.fish