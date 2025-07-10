# Day 4 - 基础代码开发
五、今日任务清单
  42, 42:
  43, 43: - [ ] 安装python-dotenv包：`pip install python-dotenv`
  44, 44: - [ ] 创建所有必要的Python文件和目录结构
  45, 45: - [ ] 配置.env文件中的RTSP_URL为你的摄像头地址
  46, 46: - [ ] 运行测试脚本验证基础功能
  47, 47: - [ ] 运行主程序测试视频流显示
  48, 48: - [ ] 测试运动检测功能
  49, 49: - [ ] 检查日志文件是否正常生成
  50, 50:
  51, 51: 六、预期成果
  52, 52:
  53, 53: 完成今天的任务后，你应该能够：
  54, 54: - 成功连接摄像头RTSP流
  55, 55: - 实时显示视频画面
  56, 56: - 基础的运动检测功能
  57, 57: - 完整的日志记录系统
  58, 58: - 模块化的代码结构
  59, 59:
  60, 60: 七、常见问题解决
  61, 61:
  62, 62: 1. **RTSP连接失败**：
  63, 63:    - 检查摄像头IP地址和端口
  64, 64:    - 确认用户名密码正确
  65, 65:    - 检查网络连接
  66, 66:
  67, 67: 2. **OpenCV显示窗口问题**：
  68, 68:    - 在Linux环境可能需要安装GUI支持
  69, 69:    - 可以先注释掉cv2.imshow相关代码
  70, 70:
  71, 71: 3. **导入模块错误**：
  72, 72:    - 确保在项目根目录运行
  73, 73:    - 检查Python路径设置

  
主要内容：
    RTSP视频流处理：
    连接摄像头RTSP流
    实时视频帧捕获和处理
    视频流的基本操作

    核心功能模块：
    摄像头连接模块：建立RTSP连接
    图像处理模块：基础的OpenCV操作
    配置管理模块：读取.env配置文件
    日志系统：记录程序运行状态

一、RTSP视频流连接开发

1：创建摄像头连接模块
在 `src/camera/rtsp_handler.py` 中实现基础的RTSP连接功能

 

2：配置管理模块
在 `src/config.py` 中创建配置管理

```python
import os
from dotenv import load_dotenv

# 加载.env文件
load_dotenv()

class Config:
    # 摄像头配置
    RTSP_URL = os.getenv("RTSP_URL", "rtsp://admin:password@192.168.1.60:554/stream1")
    
    # 数据库配置
    MYSQL_HOST = os.getenv("MYSQL_HOST", "localhost")
    MYSQL_PORT = int(os.getenv("MYSQL_PORT", "3306"))
    MYSQL_USER = os.getenv("MYSQL_USER", "root")
    MYSQL_PASSWORD = os.getenv("MYSQL_PASSWORD", "your_password")
    MYSQL_DATABASE = os.getenv("MYSQL_DATABASE", "cat_monitor")
    
    # AWS配置
    AWS_REGION = os.getenv("AWS_REGION", "us-east-1")
    AWS_ACCESS_KEY_ID = os.getenv("AWS_ACCESS_KEY_ID")
    AWS_SECRET_ACCESS_KEY = os.getenv("AWS_SECRET_ACCESS_KEY")
    
    # 应用配置
    DEBUG = os.getenv("DEBUG", "True").lower() == "true"
    LOG_LEVEL = os.getenv("LOG_LEVEL", "INFO")

config = Config()
```

3：日志系统设置
在 `src/logger.py` 中设置日志系统


二、基础图像处理模块

4：图像处理基础功能
在 `src/ai/image_processor.py` 中实现基础图像处理



三、主程序开发

5：创建主程序
在 `src/main.py` 中创建主程序



四、测试和验证

6：环境测试脚本
创建 `test_basic_functions.py` 测试基础功能


五、今日任务清单

- [ ] 安装python-dotenv包：`pip install python-dotenv`
- [ ] 创建所有必要的Python文件和目录结构
- [ ] 配置.env文件中的RTSP_URL为你的摄像头地址
- [ ] 运行测试脚本验证基础功能
- [ ] 运行主程序测试视频流显示
- [ ] 测试运动检测功能
- [ ] 检查日志文件是否正常生成

六、预期成果

完成今天的任务后，你应该能够：
- 成功连接摄像头RTSP流
- 实时显示视频画面
- 基础的运动检测功能
- 完整的日志记录系统
- 模块化的代码结构

七、常见问题解决

1. **RTSP连接失败**：
   - 检查摄像头IP地址和端口
   - 确认用户名密码正确
   - 检查网络连接

2. **OpenCV显示窗口问题**：
   - 在Linux环境可能需要安装GUI支持
   - 可以先注释掉cv2.imshow相关代码

3. **导入模块错误**：
   - 确保在项目根目录运行
   - 检查Python路径设置

# Day 4 - 基础代码开发

   1.安装python-dotenv包

   pip install python-dotenv

      这是一个Python包管理工具。主要用于从 .env 文件中加载环境变量到 Python 程序中。

   2.创建所有必要的Python文件和目录结构
   在day3的基础上完善了目录结构

   gitbooktest/
├── .env                    # 环境配置文件 ✓
├── requirements.txt        # 依赖管理文件 ✓
├── cat_monitor_env/        # 虚拟环境 ✓
└── src/                    # 源代码目录 ✓
    ├── __init__.py         # 包初始化文件 ✓
    ├── main.py             # 主程序入口 ✓
    ├── config.py           # 配置管理 ✓
    ├── utils.py            # 工具函数 ✓
    ├── logger.py           # 日志管理 ✓
    ├── ai/                 # AI模块 ✓
    │   ├── __init__.py
    │   └── image_processor.py
    ├── api/                # API模块 ✓
    │   ├── __init__.py
    │   └── main.py
    ├── camera/             # 摄像头模块 ✓
    │   ├── __init__.py
    │   └── rtsp_handler.py
    └── database/           # 数据库模块 ✓
        ├── __init__.py
        └── connection.py


   3.运行测试脚本验证基础功能
         https://github.com/LiHua69/cat-behavior-ai-monitor/blob/main/run_all_tests.py

   4.运行主程序测试视频流显示

      在WSL(Windows Subsystem for Linux)进行代码执行。 （推荐）

      由于您当前在 /mnt/c/Users/26559/ 路径下工作，这表明您正在使用WSL环境。

      在WSL终端中执行：
      bash
      cd /mnt/c/Users/26559/cat-behavior-ai-monitor       //根据你的路径进行修改
      source venv/bin/activate
      python test_video_stream.py --connection-only


      Windows命令提示符 (CMD)
      cmd
      cd C:\Users\26559\cat-behavior-ai-monitor           //根据你的路径进行修改
      venv\Scripts\activate
      python test_video_stream.py --connection-only


   5.测试运动检测功能

• ✅ ConfigManager (src/config.py) - 配置管理
• ✅ ReportGenerator (src/report_generator.py) - 报告生成
• ✅ Utils (src/utils.py) - 辅助函数工具集
• ✅ MotionDetector (src/camera/motion_detector.py) - 运动检测核心
• ✅ 各种测试脚本和示例


   6.检查日志文件是否正常生成
   https://github.com/LiHua69/cat-behavior-ai-monitor/blob/main/src/logger.py

常见问题解决：

   1. **RTSP连接失败**：
      检查摄像头IP地址和端口
      确认用户名密码正确
      检查网络连接
  
   2. **OpenCV显示窗口问题**：
      在Linux环境可能需要安装GUI支持
      可以先注释掉cv2.imshow相关代码


