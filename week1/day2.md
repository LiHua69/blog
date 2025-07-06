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

# Example for TP-Link cameras
rtsp://admin:password@192.168.1.100:554/stream1
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
- [x] RTSP stream configuration
- [x] Basic connectivity testing

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
