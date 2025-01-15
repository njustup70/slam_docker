export FAST_LIO2_ROOT=$(pwd)
export FAST_LIO2_WS=~/slam/fast_lio2/packages/catkin_ws
export FAST_LIO2_LOCATION_WS=~/slam/fast_lio2/packages/location_ws
#清理build devel
rm -rf $FAST_LIO2_WS/build $FAST_LIO2_WS/devel
rm -rf $FAST_LIO2_LOCATION_WS/build $FAST_LIO2_LOCATION_WS/devel
rm -rf $FAST_LIO2_ROOT/build $FAST_LIO2_ROOT/devel