#记录当前路径
export FAST_LIO2_ROOT=$(pwd)
source ~/packages/ws_livox/devel/setup.bash && \
#build FAST_LIVO
cd ~/slam/fast_lio2/packages/catkin_ws && catkin_make && \
source ~/slam/fast_lio2/packages/catkin_ws/devel/setup.bash 

cd $FAST_LIO2_ROOT