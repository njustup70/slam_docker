FROM elainasuki/ros:ros-noetic-full
ARG USERNAME=Elaina
USER root
RUN apt-get update && apt-get install -y libgoogle-glog-dev libgflags-dev libgtest-dev \
    libeigen3-dev libspdlog-dev libsuitesparse-dev qtdeclarative5-dev qt5-qmake libqglviewer-dev-qt5 # g2o requirements
# USER ${USERNAME}
WORKDIR /home/${USERNAME}/packages
RUN git clone https://github.com/RainerKuemmerle/g2o.git && \
    cd g2o && mkdir build && cd build && \
    cmake .. && make -j && make install &&\
    rm -rf ../../g2o
RUN  mkdir -p funny_slam_ws/src/ && cd funny_slam_ws/src && git clone  https://github.com/zm0612/funny_lidar_slam.git
RUN . ./ws_livox/devel/setup.sh && cd funny_slam_ws && catkin_make
RUN echo "source ~/packages/funny_slam_ws/devel/setup.bash" >> /home/${USERNAME}/.bashrc 
# && echo "bass source ~/packages/funny_slam_ws/install/setup.bash" >> /home/${USERNAME}/.config/fish/config.fish