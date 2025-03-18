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
>(docker) ~/lio_sam/.devcontainer$ docker exec -it moveit2_container bash
```
完成上面的操作之后，你应该顺利进入了我们的lio_sam_container容器当中
![image 1](images/1.png)
#### 5.编译
```bash
>(bash) ~/lio_sam/ros2_ws$ colcon build
>(bash) ~/lio_sam/ros2_ws$ source install/setup.bash
```
此时你以及完成了功能包的拷贝，主要包含`panda_moveit_config`&`my_moveit2driver`两个文件，屏幕中也会显示：  
> Summary: 2 packages finisher [times]
![image 2](images/2.png)
#### 6.launch
此时我们仅需要启动launch文件就可以了
```bash
>(bash) ~/Dlancy_moveit2/ros2_ws$ ros2 launch my_moveit2driver my_moveit2driver.launch.py
```