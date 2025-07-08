# Day 2: Hardware Configuration

## Today's Goals

- Configure TP-Link network camera
- Test RTSP stream connection
- Setup basic network configuration

## Hardware Preparation

### Required Equipment
- TP-Link network camera (e.g., Tapo C200, Kasa KC120)
- Stable network connection (WiFi or Ethernet)
- Host computer (Windows/Mac)
- Router with port forwarding capability

### Hardware Setup Photo

<div align="center">
  <img src="../assets/images/day2-guide.jpg" alt="Day2硬件配置指南" width="600">
  <p><em>TP-Link摄像头配置指南</em></p>
</div>

## Camera Setup

### 1. Initial Camera Configuration

```bash
# Connect camera to power
# Use manufacturer's mobile app for initial setup
# Connect camera to WiFi network
# Note down camera's IP address
```

### 2. RTSP Configuration

Enable RTSP stream in camera settings:
```bash
# Access camera web interface
# Navigate to Advanced Settings
# Enable RTSP stream
# Set stream quality (HD/SD)
# Configure authentication credentials
```

#### RTSP配置界面截图
<div align="center">
  <img src="../assets/images/day2-rtsp-config.jpg" alt="RTSP配置界面" width="500">
  <p><em>摄像头RTSP配置界面</em></p>
</div>

### 3. Network Configuration

```bash
# Set static IP for camera (recommended)
# Configure port forwarding if needed
# Test network connectivity
ping [camera_ip_address]
```

## RTSP Connection Testing

### 1. RTSP URL Format

```bash
# Standard RTSP URL format
rtsp://username:password@camera_ip:port/stream_path

# TL-IPC45AW实际配置 (配置成功 ✅)
摄像头IP: 192.168.10.235
用户名: admin
密码: Aa123456
```

### 2. 成功的RTSP URL

```bash
# 主流 (1080P高清) - 推荐录制使用
rtsp://admin:Aa123456@192.168.10.235:554/11

# 子流 (720P标清) - 推荐实时监控使用  
rtsp://admin:Aa123456@192.168.10.235:554/12

# 备用格式
rtsp://admin:Aa123456@192.168.10.235:554/stream1
rtsp://admin:Aa123456@192.168.10.235:554/stream2
```

### 3. 测试结果 ✅

```bash
✅ 网络连通性: 正常
✅ Web管理界面: http://192.168.10.235 可访问
✅ RTSP端口554: 开放
✅ VLC播放测试: 成功
✅ 所有4个RTSP流: 验证通过
```

### 2. Test with VLC Player

```bash
# Open VLC Media Player
# Media -> Open Network Stream
# Enter RTSP URL
# Verify video stream quality
```

### 3. Test with FFmpeg

```bash
# Install FFmpeg
# Test stream capture
ffmpeg -i rtsp://admin:password@192.168.1.100:554/stream1 -t 10 test.mp4
```

## Network Optimization

### 1. Bandwidth Configuration

```bash
# Configure camera bitrate
# Set appropriate resolution
# Adjust frame rate for stability
```

### 2. Quality Settings

```bash
# Main stream: 1080p for recording
# Sub stream: 720p for real-time monitoring
# Night vision: Auto adjustment
```

### 3. Security Configuration

```bash
# Change default passwords
# Enable WPA2/WPA3 encryption
# Configure access control
# Regular firmware updates
```

## Today's Completion

- [x] TP-Link camera physical setup
- [x] WiFi network connection  
- [x] RTSP stream configuration ✅
- [x] Basic connectivity testing ✅
- [x] RTSP URL validation ✅
- [x] VLC playback testing ✅

### RTSP配置成功记录
```bash
设备: TL-IPC45AW
IP: 192.168.10.235
认证: admin/Aa123456
主流: rtsp://admin:Aa123456@192.168.10.235:554/11
子流: rtsp://admin:Aa123456@192.168.10.235:554/12
状态: 全部测试通过 ✅
```

## Tomorrow's Plan

- Setup Python development environment
- Install OpenCV and RTSP libraries
- Create basic video capture script

## Issues Encountered

1. **WiFi Connection**: Ensure camera is within good signal range
2. **RTSP Authentication**: Verify username/password combination
3. **Stream Quality**: Balance between quality and network bandwidth

## Learning Notes

- TP-Link camera configuration essentials
- RTSP protocol basics
- Network security considerations
