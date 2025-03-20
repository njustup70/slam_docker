# lio_sam_location算法开发
# 维护
维护者:陈成     
QQ:1940275781     
## 使用教程
请严格按照我的构建思路，如果出现报错请联系我
#### 注意事项
#### 1.克隆主播的仓库
选一个你喜欢的地方准备安装仓库。
```bash
>(docker)$ git clone -branch Dlan_lio_sam hhttps://github.com/njustup70/slam_docker.git（按HTTP复制）   
>(docker)$ git clone -branch Dlan_lio_sam git@github.com:njustup70/slam_docker.git（按SSH复制，如果没有配置过SSH密钥则用上面那种）   
```
#### 2.进入下载好的仓库
```bash
>(docker) ~$ cd lio_sam
```
#### 3.构建容器
```bash
>(docker) ~/lio_sam$ cd .devcontainer/
>(docker) ~/lio_sam/.devcontainer$ docker-compose up --build
```
如果构建成功你应该会看到如下式样：  
> Starting lio_sam_container ... done   
> Attaching to lio_sam_container
#### 4.进入容器
```bash
>(docker) ~/lio_sam$ cd .devcontainer/
>(docker) ~/lio_sam/.devcontainer$ docker-compose up -d（-d表示后台运行）
>(docker) ~/lio_sam/.devcontainer$ docker exec -it lio_sam_container bash
```
完成上面的操作之后，你应该顺利进入了我们的lio_sam_container容器当中
#### 5.编译前准备工作
```bash
>(docker) xhost local:
```
以上操作用于添加当前用户进入网络连接
#### 6.编译(此处的编译流程严格按我的流程来，不然很容易斯)
我们将功能包直接装在容器内，防止在本地堆石，共有两个文件夹，LIO—SAM在packages文件夹中     
PS：由于权限问题，sudo必要
```bashcache/mesa_shader_cache
>(bash) cd packages/catkin_ws
>(bash) ~/packages/catkin_ws$ sudo catkin config --extend /opt/ros/noetic/
>(bash) ~/packages/catkin_ws$ sudo catkin init
>(bash) ~/packages/catkin_ws$ sudo catkin build
```
理论上来说，此时应该就可以编译通过了，如果遇到其他报错，可交由我维护     
诡异的是，由于权限问题，部分launch带动的mkdir指令无法执行,于是我们要在下面认为创建并更改权限       
```bash
>(bash) ~/packages/catkin_ws$ sudo mkdir -p /home/yc-dlan/.ros
>(bash) ~/packages/catkin_ws$ sudo chown -R yc-dlan:yc-dlan ~/.ros
```
```bash
>(bash) ~/packages/catkin_ws$ sudo mkdir -p /home/yc-dlan/.rviz
>(bash) ~/packages/catkin_ws$ sudo chown -R yc-dlan:yc-dlan ~/.rviz
```
```bash
>(bash) ~/packages/catkin_ws$ sudo mkdir -p /home/yc-dlan/.cache
>(bash) ~/packages/catkin_ws$ sudo chown -R yc-dlan:yc-dlan ~/.cache
```
```bash
>(bash) ~/packages/catkin_ws$ sudo mkdir -p /home/yc-dlan/.cache/mesa_shader_cache
>(bash) ~/packages/catkin_ws$ sudo chown -R yc-dlan:yc-dlan ~/.cache/mesa_shader_cache
```
#### 7.launch
此时我们仅需要启动launch文件就可以了，并且launch文件有两个，有不同的使用方式
- run.launch
```bash
>(bash) ~/packages/catkin_ws$ source devel/setup.bash
>(bash) ~/packages/catkin_ws$ roslaunch lio_sam_localization run.launch
>(bash) ~/packages/catkin_ws$ rosrun tf2_ros static_transform_publisher 22.748378703042732 -1.1095682571420336 -0.10003287520306003 3.526007880438855e-07 1.0449289132344871e-05 -0.006435430963485527 0.9999792923450977 world map
>(bash) ~/packages/catkin_ws$ rosbag play /home/ubuntu/testVolume-1/highbay_track-5-minutes-highres_2024-05-20-13-53-11.bag --start 115
>(bash) ~/packages/catkin_ws$ rosservice call /lio_sam/save_map 0.2 "/home/ubuntu/testVolume-1/<sample-map-dir-name>/"
```
- run_loc.launch
```bash
>(bash) ~/packages/catkin_ws$ source devel/setup.bash
>(bash) ~/packages/catkin_ws$ roslaunch lio_sam_localization run_loc.launch
>(bash) ~/packages/catkin_ws$ rosrun tf2_ros static_transform_publisher 22.748378703042732 -1.1095682571420336 -0.10003287520306003 3.526007880438855e-07 1.0449289132344871e-05 -0.006435430963485527 0.9999792923450977 world map
>(bash) ~/packages/catkin_ws$ rosbag play /home/ubuntu/testVolume-1/highbay_track-5-minutes-highres_2024-05-20-13-53-11.bag --start 115
```