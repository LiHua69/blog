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
