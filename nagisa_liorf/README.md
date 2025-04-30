<div align="center">
<h1>liorf模块</h1>
</div>

## 维护者
- nagisa 
- QQ：2964793117

## 仓库介绍
- 此模利用SLAM先导地图在提供机器人初始位姿的情况下在地图中提供机器人定位，即激光雷达-imu里程计。

## 使用教程
### 1.进入docker[详细方法链接](https://github.com/njustup70/docker)
### 下面的错误可以忽略，当编译过自己的包后就不会有问题了
![pic](../.github/docker_warning.png)

### 2.启动ros1_bridge与roscore
- 1.roscore
```bash
roscore
```
- 2.启动ros1_bridge [链接](https://github.com/njustup70/docker/tree/master/rosbridge)
```bash
PATH TO rosbridge$./run.bash
```
![pic](./../.github/rosbridge.png)
- 左边为rosbridge右边为roscore

### 3.使用方法
- 1.构建容器
```bash
~/slam_docker/nagisa_liorf/.devcontainer$ docker-compose up --b
```
- 2.进入容器
```bash
~/slam_docker/nagisa_liorf/.devcontainer$ docker-compose up --d && docker exec -it lio_sam_container bash 
```
- 3.source
```bash
~/packages/nagisa_liorf/nagisa_ws$ source install/setup.bash
```
- 4.运行liorf
```bash
~/packages/nagisa_liorf/nagisa_ws$ ros2 launch my_liorf run_localization.launch.py 
```
## 注释部分

### 1.注意事项:上面的三个步骤按顺序执行，记得在打开run_localization.launch.py 后再打开rosbag

### 2.使用的可选项:
- 1.一定注意，yaml文件中的imu参数矩阵对定位的影响及其大，一定要和SLAM建图算法所录制的参数矩阵一样，否则会导致imu乱飘
- 2.更新的定位数据即为odom到base_link的转化矩阵。

## 写给实机部署的开发者的容器联合开发
- 1.提供数据包的容器开启roscore(若为ros1)
- 2.本容器下载[官网数据集](https://drive.google.com/drive/folders/1gJHwfdHCRdjP7vuT556pv8atqrCJPbUq)并运行(在后源码链接中的官方包README中还有更多数据集合)
- 3.按照前述启动该launch文件
- 4.在rviz中2D Pose Estimate提供机器人的初始位姿态


## 源码连接
### [liorf_localization](https://github.com/YJZLuckyBoy/liorf_localization)
 - 官方仓库
