from launch import LaunchDescription
from launch_ros.actions import Node
from launch.actions import IncludeLaunchDescription
from launch.substitutions import LaunchConfiguration
from launch.launch_description_sources import PythonLaunchDescriptionSource
from ament_index_python.packages import get_package_share_directory
def generate_launch_description():
    launchDescription = LaunchDescription()
    realsense_pkg_prefix = get_package_share_directory('realsense2_camera')
    align_depth=LaunchConfiguration('align_depth.enable', default='true')
    root_path=LaunchConfiguration('camera_namespace',default='/')
    realsense_bringup=IncludeLaunchDescription(
        PythonLaunchDescriptionSource([realsense_pkg_prefix + '/launch/rs_launch.py']),
        launch_arguments={'align_depth.enable':align_depth,'camera_namespace':root_path}.items()
    )
    launchDescription.add_action(realsense_bringup)
    return launchDescription