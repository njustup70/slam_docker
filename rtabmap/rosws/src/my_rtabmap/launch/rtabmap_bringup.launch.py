from launch import LaunchDescription
from launch_ros.actions import Node
from launch.actions import IncludeLaunchDescription
from launch.substitutions import LaunchConfiguration
from launch.launch_description_sources import PythonLaunchDescriptionSource
from ament_index_python.packages import get_package_share_directory
def generate_launch_description():
    config_path=get_package_share_directory("my_rtabmap")+"/config/rtabmap.yaml"
    ld=LaunchDescription()

    #发布imu数据
    ld.add_action(Node(
            package='imu_filter_madgwick', executable='imu_filter_madgwick_node', output='screen',
            parameters=[config_path],
            remappings=[('/imu/data_raw', '/camera/imu')]
            ))
    return ld