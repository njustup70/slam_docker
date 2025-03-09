import pcl
import numpy as np
import os

def concatenate_pcd(pcd_files, output_file):
    # 初始化一个空的numpy数组用于存储点云数据
    combined_points = np.empty((0, 3), dtype=np.float32)  # 假设点云为XYZ类型

    for file in pcd_files:
        try:
            # 加载点云文件
            cloud = pcl.load(file)
            if cloud.size == 0:
                print(f"警告: 文件 {file} 是空点云，已跳过")
                continue
            
            # 转换为numpy数组
            points = cloud.to_array()
            
            # 检查点云维度是否兼容
            if points.shape[1] != 3:
                print(f"错误: 文件 {file} 的点云维度不兼容 (应为XYZ格式)")
                continue
                
            # 合并点云
            combined_points = np.vstack((combined_points, points))
            print(f"已合并: {file} ({points.shape[0]} 个点)")
            
        except Exception as e:
            print(f"加载 {file} 失败: {str(e)}")
            continue

    if combined_points.size == 0:
        raise ValueError("没有有效的点云数据可供合并")
    
    # 创建pcl点云对象并保存
    combined_cloud = pcl.PointCloud()
    combined_cloud.from_array(combined_points.astype(np.float32))
    pcl.save(combined_cloud, output_file)
    print(f"\n合并完成! 总点数: {combined_points.shape[0]}")
    print(f"输出文件: {os.path.abspath(output_file)}")

if __name__ == "__main__":
    # 获取当前目录所有.pcd文件
    pcd_files = [f for f in os.listdir('.') if f.endswith('.pcd')]
    pcd_files.sort()  # 按文件名排序
    
    if not pcd_files:
        print("错误: 当前目录未找到.pcd文件")
        exit(1)
        
    output_file = "combined_output.pcd"
    
    print("正在合并以下点云文件:")
    for f in pcd_files:
        print(f" - {f}")
    
    try:
        concatenate_pcd(pcd_files, output_file)
    except Exception as e:
        print(f"合并过程中发生错误: {str(e)}")