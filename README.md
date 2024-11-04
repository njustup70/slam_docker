# 这是建图算法的测试工程
统一采用docker来配置环境**按住ctrl+H解锁.devcontainer隐藏文件**<br>用git fls来追踪大的数据文件
## rtabmap是rgbd点云建图
docker采用了nvidia进行时，安装[按此教程](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)
<br>~/packages文件夹下面是镜像构建的依赖so文件(雷达或者相机驱动)
<br>~/nav/packages中是挂载上去的依赖包
