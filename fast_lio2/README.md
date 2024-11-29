<div align="center">
<h1>fast_lio2模块</h1>
</div>

## 仓库介绍
- 此模利用mid360与Imu进行3d点云建图
## 使用教程
### 1.进入docker[详细方法链接](https://github.com/njustup70/docker)
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

### 3.如果第一次进入容器
- 1.在fast_lio2 的路径下source livox包
```bash
~/slam/fast_lio2/packages/catkin_ws$ source ~/packages/livox_ws/devel/setup.bash
```
- 2.编译fast_lio2官方包
```bash
~/slam/fast_lio2/packages/catkin_ws$ catkin_make
```
- 3.在自己的工作空间中source fast_lio2官方包 
```bash
~/slam/fast_lio2/ros_ws$source ~/slam/fast_lio2/packages/catkin_ws/devel/setup.bash
```
- 3.编译自己的包并source 才能用
```bash
~/slam/fast_lio2/ros_ws$ catkin_make 
```
``` bash
~/slam/fast_lio2/ros_ws$ source devel/setup.bash
```
``` bash
roslaunch my_fast_lio2 mapping_mid360.launch
```
### 注意事项:上面的三个步骤一定一定按顺序执行，不然会出现ROS 的source 覆盖问题
### 解决办法:把自己工作空间与fast_lio2官方包工作空间下面的devel与build文件删除重新操作
### 4.第二次启动可以直接调用launch 文件
```bash
roslaunch my_fast_lio2 mapping_mid360.launch
```
## 源码连接
### [fast_lio](https://github.com/hku-mars/FAST_LIO)
 - 官方仓库