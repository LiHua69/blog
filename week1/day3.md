# Day 3 - 开发环境搭建

主要内容：
    虚拟环境管理：
    使用venv创建独立的Python环境
    激活和停用虚拟环境
    在虚拟环境中安装包

    主要软件：
    OpenCV：视频处理和图像处理
    FastAPI：Web框架，用于后续API开发
    MySQL连接器：数据库操作
    AWS SDK：连接AWS Bedrock服务


一、环境配置
输入指令，让Amazon Q为你安装OpenCV(视频处理和图像处理),FastAPI(Web框架，用于后续API开发),MySQL连接器(数据库操作),AWS SDK(连接AWS Bedrock服务)。并让它验证环境是否都配置成功。

1：Python环境配置
```bash
# 检查Python版本（需要3.8+）
python --version

# 创建虚拟环境
python -m venv cat_monitor_env

# 激活虚拟环境（Windows）
cat_monitor_env\Scripts\activate

# 激活虚拟环境（Linux/Mac）
source cat_monitor_env/bin/activate
```

2：安装项目依赖
```bash
# 升级pip
pip install --upgrade pip

# 安装核心依赖
pip install opencv-python
pip install fastapi
pip install uvicorn
pip install mysql-connector-python
pip install boto3
pip install requests
pip install python-multipart
pip install pillow
```

3:生成requirements.txt（使用requirements.txt管理项目依赖）
requirements.txt 是确保 "在我的机器上能跑，在你的机器上也能跑" 的关键文件！

```bash
pip freeze > requirements.txt
```

4:创建项目结构
    为了让后面写代码时更好的区分模块
例如：
```
cat_monitor/
├── src/
├── __init__.py
├── main.py
├── config.py
├── utils.py
├── logger.py
├── ai/
│   ├── __init__.py
│   ├── behavior_analyzer.py
│   ├── image_processor.py
│   └── model_manager.py
├── api/
│   ├── __init__.py
│   ├── main.py
│   ├── routes.py
│   ├── models.py
│   └── dependencies.py
├── camera/
│   ├── __init__.py
│   ├── rtsp_handler.py
│   ├── stream_processor.py
│   └── config.py
└── database/
    ├── __init__.py
    ├── connection.py
    ├── models.py
    └── operations.py
```

5：基础配置文件
    在cat-behavior-ai-monitor项目下面创建一个.env文件。同https://github.com/LiHua69/cat-behavior-ai-monitor/blob/main/.env.example这样的文件内容
```
# 摄像头配置
RTSP_URL = "rtsp://admin:password@192.168.1.60:554/stream1"

# 数据库配置
MYSQL_HOST = "localhost"
MYSQL_PORT = 3306
MYSQL_USER = "root"
MYSQL_PASSWORD = "your_password"
MYSQL_DATABASE = "cat_monitor"

# AWS配置
AWS_REGION = "us-east-1"
AWS_ACCESS_KEY_ID = os.getenv("AWS_ACCESS_KEY_ID")
AWS_SECRET_ACCESS_KEY = os.getenv("AWS_SECRET_ACCESS_KEY")
```
