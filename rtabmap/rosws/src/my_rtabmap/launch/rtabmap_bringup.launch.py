from launch import LaunchDescription
from launch_ros.actions import Node
from launch.actions import IncludeLaunchDescription
from launch.substitutions import LaunchConfiguration
from launch.launch_description_sources import PythonLaunchDescriptionSource
from ament_index_python.packages import get_package_share_directory
import yaml
def yaml_load(file_path:str)->dict: 
    with open(file_path) as file:
        data=yaml.safe_load(file)
    return data
def generate_launch_description():
    config_path=get_package_share_directory("my_rtabmap")+"/config/rtabmap.yaml" #配置文件路径  
    rtabmap_launch_file_dir = get_package_share_directory('rtabmap_launch') + '/launch/rtabmap.launch.py'
    yaml_data=yaml_load(config_path)                                                #所有的配置信息
    rtabmap_data=yaml_data.get('rtapmap', {}).get('ros__parameters', {})                #rtabmap的配置信息
    formatted_rtabmap_data = {key: str(value) for key, value in rtabmap_data.items()}   #格式化rtabmap的配置信息,转化为字符串才能被识别
    ld=LaunchDescription()

    #rtabmap_launch
    rtabmap_launch=IncludeLaunchDescription(
        PythonLaunchDescriptionSource(rtabmap_launch_file_dir),
        launch_arguments=formatted_rtabmap_data.items()
    )

    #发布imu数据
    ld.add_action(Node(
            package='imu_filter_madgwick', executable='imu_filter_madgwick_node', output='screen',
            parameters=[config_path],
            remappings=[('/imu/data_raw', '/camera/imu')]
            ))
    ld.add_action(rtabmap_launch)    
    return ld