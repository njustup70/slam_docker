## 使用教程
- 1.编译镜像,运行.devcontainer/build.sh脚本
- 2.打开容器,自动运行程序,`并不启动rviz`
```bash
docker compose up #启动fast lio官方镜像 
```
```bash
docker compose up -f pose-docker-compose.yml #启动带有雷达姿态信息输出的fast lio 
```
## 参数说明 
**mapping_mid360.launch**与**mid360.yaml**是使用的配置文件
- 1.lid_topic:雷达话题
- 2.imu_topic:imu话题并且默认与雷达在同一个坐标系
## 源码连接
### [fast_lio](https://github.com/hku-mars/FAST_LIO)