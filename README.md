<div align="center">
<h1>slam仓库</h1>
</div>

## 版本和发布记录
### 当前版本
~~Elaina_v0.1~~
## 仓库介绍
- 本仓库包括slam环境以及使用的教程
- 包括ros1与ros2的建图算法,使用ros1需要开一个[ros_bridge](https://github.com/njustup70/docker/tree/master/rosbridge)
- 数据来源是[docker/ros2](https://github.com/njustup70/docker/tree/master/ros2)
## 包含子模块
| 模块 | 说明|
| --- |---|
|[`fast_lio2`](./fast_lio2/README.md) |3d点云|
|[`fast_livo`](./fast_livo/README.md) |激光雷达相机融合无定位|
|[`rtab`](./rtabmap/README.md)|激光雷达相机融合|
## 仓库依赖
- 1.nvdia进行时,安装使用可以看[docker仓库教程](https://github.com/njustup70/docker)
- 2.可能需要ros1_bridge
## 使用教程
### 注意事项
ros2/packages/librealsense$ 中ros2/packages/librealsense表示的是执行命令的目录 ,**$及之前不要复制**
### 1.更新子模块
```bash
PATH_TO_SLAM/slam$ git submodule init && git submodule update
```
### 2.看各个子模块的具体readme

## 注意事项
### 1.如果没有.devcontainer
### 按CTRL+H解锁隐藏文件
### 2.ROS1有source 覆盖的问题,只有ros1有
### [解决方法连接](https://blog.csdn.net/SoftwarerRJY/article/details/125586138)(不一定有效)最好的办法是在相互依赖的工作路径中source被依赖的工作路径再catkin_make