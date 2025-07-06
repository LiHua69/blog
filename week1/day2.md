# Day 2: 树莓派系统配置

## 今日目标

- 安装和配置Raspberry Pi OS
- 配置SSH和远程访问
- 系统基础优化

## 硬件准备

### 所需硬件
- 树莓派4B (4GB)
- MicroSD卡 (64GB Class 10)
- USB摄像头
- 电源适配器
- 网线或WiFi连接

## 系统安装

### 1. 烧录系统镜像

```bash
# 下载Raspberry Pi Imager
# 选择Raspberry Pi OS (64-bit)
# 烧录到SD卡
```

### 2. 启用SSH

在boot分区创建ssh文件：
```bash
touch /boot/ssh
```

### 3. 配置WiFi（可选）

创建wpa_supplicant.conf：
```bash
country=CN
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
    ssid="你的WiFi名称"
    psk="你的WiFi密码"
}
```

## 系统配置

### 1. 首次启动配置

```bash
# 更新系统
sudo apt update && sudo apt upgrade -y

# 配置时区
sudo timedatectl set-timezone Asia/Shanghai

# 配置locale
sudo dpkg-reconfigure locales
```

### 2. SSH配置

```bash
# 修改SSH配置
sudo nano /etc/ssh/sshd_config

# 重启SSH服务
sudo systemctl restart ssh
```

### 3. 用户配置

```bash
# 修改默认密码
passwd

# 创建项目用户（可选）
sudo adduser catmonitor
sudo usermod -aG sudo catmonitor
```

## 性能优化

### 1. GPU内存分配

```bash
# 编辑config.txt
sudo nano /boot/config.txt

# 添加以下配置
gpu_mem=128
```

### 2. 摄像头启用

```bash
# 启用摄像头
sudo raspi-config
# Interface Options -> Camera -> Enable
```

### 3. 系统监控工具

```bash
# 安装系统监控工具
sudo apt install htop iotop -y
```

## 网络配置

### 1. 静态IP配置（可选）

```bash
# 编辑dhcpcd.conf
sudo nano /etc/dhcpcd.conf

# 添加静态IP配置
interface eth0
static ip_address=192.168.1.100/24
static routers=192.168.1.1
static domain_name_servers=8.8.8.8 8.8.4.4
```

### 2. 防火墙配置

```bash
# 安装ufw
sudo apt install ufw -y

# 配置防火墙规则
sudo ufw allow ssh
sudo ufw allow 8000  # FastAPI端口
sudo ufw enable
```

## 今日完成

- [x] 树莓派系统安装
- [x] SSH远程访问配置
- [x] 基础系统优化
- [x] 摄像头硬件测试

## 明日计划

- 安装Python开发环境
- 配置虚拟环境
- 安装项目依赖

## 遇到的问题

1. **WiFi连接问题**: 需要确保wpa_supplicant.conf格式正确
2. **SSH连接超时**: 检查防火墙设置和网络配置

## 学习笔记

- 树莓派系统配置要点
- SSH安全配置
- 系统性能优化方法
