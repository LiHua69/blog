# Day 3 - 开发环境搭建

## 学习目标
- [ ] 配置Python开发环境
- [ ] 安装项目所需依赖包
- [ ] 验证开发环境配置正确性
- [ ] 创建项目基础代码结构

## 今日内容

### 理论部分
#### 核心概念
- **Python虚拟环境**：隔离项目依赖，避免版本冲突
- **依赖管理**：使用requirements.txt管理项目依赖
- **项目结构**：合理的代码组织方式

#### 重要知识点
1. **虚拟环境管理**
   - 使用venv创建独立的Python环境
   - 激活和停用虚拟环境
   - 在虚拟环境中安装包

2. **项目依赖**
   - OpenCV：视频处理和图像处理
   - FastAPI：Web框架，用于后续API开发
   - MySQL连接器：数据库操作
   - AWS SDK：连接AWS Bedrock服务

### 实践部分
#### 练习1：Python环境配置
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

#### 练习2：安装项目依赖
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

# 生成requirements.txt
pip freeze > requirements.txt
```

#### 练习3：创建项目结构
```
cat_monitor/
├── src/
│   ├── __init__.py
│   ├── camera/
│   │   ├── __init__.py
│   │   └── rtsp_handler.py
│   ├── ai/
│   │   ├── __init__.py
│   │   └── behavior_analyzer.py
│   ├── database/
│   │   ├── __init__.py
│   │   └── mysql_handler.py
│   └── api/
│       ├── __init__.py
│       └── main.py
├── config/
│   └── settings.py
├── tests/
│   └── __init__.py
├── requirements.txt
└── README.md
```

#### 练习4：基础配置文件
```python
# config/settings.py
import os

class Settings:
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
    
    # 应用配置
    DEBUG = True
    LOG_LEVEL = "INFO"

settings = Settings()
```

## 重点总结
- Python虚拟环境是项目开发的最佳实践
- 合理的项目结构有助于代码维护和扩展
- 配置文件应该集中管理，便于环境切换
- 依赖管理要明确版本，确保环境一致性

## 作业/任务
- [ ] 完成Python虚拟环境创建和激活
- [ ] 安装所有必需的依赖包
- [ ] 创建项目基础目录结构
- [ ] 编写基础配置文件
- [ ] 测试OpenCV是否能正常导入
- [ ] 验证RTSP连接（使用Day 2的摄像头配置）

## 参考资料
- [Python虚拟环境官方文档](https://docs.python.org/3/tutorial/venv.html)
- [OpenCV Python教程](https://opencv-python-tutroals.readthedocs.io/)
- [FastAPI官方文档](https://fastapi.tiangolo.com/)
- [AWS Boto3文档](https://boto3.amazonaws.com/v1/documentation/api/latest/index.html)

## 学习笔记
### 疑问记录
- 虚拟环境激活后如何确认是否成功？
- requirements.txt中的版本号是否需要固定？
- 项目结构是否需要根据实际需求调整？

### 心得体会
- 今日收获：学会了Python项目的标准化搭建流程
- 需要改进：需要更深入了解各个依赖包的具体用途

## 环境验证脚本
```python
# test_environment.py
import sys

def test_python_version():
    version = sys.version_info
    if version.major >= 3 and version.minor >= 8:
        print(f"✓ Python版本: {version.major}.{version.minor}.{version.micro}")
        return True
    else:
        print(f"✗ Python版本过低: {version.major}.{version.minor}.{version.micro}")
        return False

def test_imports():
    packages = [
        'cv2', 'fastapi', 'mysql.connector', 
        'boto3', 'PIL', 'uvicorn'
    ]
    
    success = True
    for package in packages:
        try:
            __import__(package)
            print(f"✓ {package} 导入成功")
        except ImportError:
            print(f"✗ {package} 导入失败")
            success = False
    
    return success

if __name__ == "__main__":
    print("=== 环境验证 ===")
    python_ok = test_python_version()
    imports_ok = test_imports()
    
    if python_ok and imports_ok:
        print("\n🎉 开发环境配置成功！")
    else:
        print("\n❌ 环境配置存在问题，请检查")
```

---
*创建日期：2025-07-08*
*更新日期：2025-07-08*
