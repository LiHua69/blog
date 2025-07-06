# 部署指南

## 环境要求

### 硬件要求
- Windows 10+ / macOS 10.15+ 主机
- TP-Link网络摄像头 (支持RTSP协议)
- 稳定的网络连接 (WiFi或有线)
- 充足的存储空间 (用于截图和日志)

### 软件要求
- Windows 10+ / macOS 10.15+
- Python 3.8+
- MySQL 8.0+
- Git
- OpenCV 4.5+

## 快速部署

### 1. 克隆项目

```bash
git clone https://github.com/LiHua69/blog.git
cd blog
```

### 2. 环境配置

```bash
# 创建虚拟环境
python3 -m venv venv
source venv/bin/activate

# 安装依赖
pip install -r requirements.txt
```

### 3. 数据库配置

```bash
# 安装MySQL
sudo apt install mysql-server -y

# 创建数据库
mysql -u root -p
CREATE DATABASE cat_monitoring;
CREATE USER 'catuser'@'localhost' IDENTIFIED BY 'your_password';
GRANT ALL PRIVILEGES ON cat_monitoring.* TO 'catuser'@'localhost';
FLUSH PRIVILEGES;
```

### 4. 配置文件

创建 `.env` 文件：
```bash
# 数据库配置
DB_HOST=localhost
DB_PORT=3306
DB_USER=catuser
DB_PASSWORD=your_password
DB_NAME=cat_monitoring

# AWS配置
AWS_ACCESS_KEY_ID=your_access_key
AWS_SECRET_ACCESS_KEY=your_secret_key
AWS_REGION=us-east-1

# 飞书配置
FEISHU_WEBHOOK_URL=your_webhook_url
```

### 5. 启动服务

```bash
# 启动主服务
python main.py

# 或使用systemd服务
sudo systemctl start cat-monitoring
sudo systemctl enable cat-monitoring
```

## 详细部署步骤

### 系统服务配置

创建systemd服务文件：
```bash
sudo nano /etc/systemd/system/cat-monitoring.service
```

服务文件内容：
```ini
[Unit]
Description=Cat Monitoring System
After=network.target mysql.service

[Service]
Type=simple
User=pi
WorkingDirectory=/home/pi/blog
Environment=PATH=/home/pi/blog/venv/bin
ExecStart=/home/pi/blog/venv/bin/python main.py
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
```

### 自动启动配置

```bash
# 重载systemd配置
sudo systemctl daemon-reload

# 启用服务
sudo systemctl enable cat-monitoring

# 启动服务
sudo systemctl start cat-monitoring

# 检查状态
sudo systemctl status cat-monitoring
```

### 日志配置

```bash
# 查看服务日志
sudo journalctl -u cat-monitoring -f

# 配置日志轮转
sudo nano /etc/logrotate.d/cat-monitoring
```

## 性能优化

### 1. 系统优化

```bash
# GPU内存分配
echo 'gpu_mem=128' | sudo tee -a /boot/config.txt

# 禁用不必要的服务
sudo systemctl disable bluetooth
sudo systemctl disable cups
```

### 2. 数据库优化

```sql
-- MySQL配置优化
SET GLOBAL innodb_buffer_pool_size = 256M;
SET GLOBAL max_connections = 50;
```

### 3. 应用优化

```python
# 配置文件优化
CAMERA_RESOLUTION = (640, 480)  # 降低分辨率提高性能
FRAME_RATE = 15  # 适当的帧率
BUFFER_SIZE = 10  # 缓冲区大小
```

## 监控和维护

### 1. 系统监控

```bash
# 安装监控工具
sudo apt install htop iotop nethogs -y

# 监控系统资源
htop
iotop
nethogs
```

### 2. 应用监控

```bash
# 检查服务状态
sudo systemctl status cat-monitoring

# 查看实时日志
sudo journalctl -u cat-monitoring -f

# 检查端口占用
sudo netstat -tlnp | grep :8000
```

### 3. 定期维护

```bash
# 清理日志文件
sudo journalctl --vacuum-time=7d

# 更新系统
sudo apt update && sudo apt upgrade -y

# 备份数据库
mysqldump -u catuser -p cat_monitoring > backup_$(date +%Y%m%d).sql
```

## 故障排除

### 常见问题

1. **服务启动失败**
   - 检查配置文件
   - 查看系统日志
   - 验证依赖安装

2. **摄像头无法访问**
   - 检查设备权限
   - 验证摄像头连接
   - 确认驱动安装

3. **数据库连接失败**
   - 检查MySQL服务状态
   - 验证用户权限
   - 确认网络连接

### 调试命令

```bash
# 检查Python环境
python --version
pip list

# 检查系统资源
free -h
df -h
lscpu

# 检查网络连接
ping google.com
curl -I http://localhost:8000
```
