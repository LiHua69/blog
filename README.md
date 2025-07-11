# 项目介绍

基于FastVLM和AWS Bedrock Claude3的智能猫咪行为监控与分析系统

{% content-ref url="./" %}
[.](./)
{% endcontent-ref %}

## 项目概述

本项目是一个为期25天的猫咪行为监控系统开发项目，结合了计算机视觉、大语言模型和物联网技术，实现对猫咪行为的实时监控、智能分析和异常告警。

### 硬件架构变更记录

**2025年7月6日更新：**
- 硬件平台采用Windows/Mac主机方案
- 摄像头方案改为TP-Link网络摄像头
- 视频数据通过RTSP协议获取
- Python检测程序运行在主机上，通过RTSP流截取视频帧进行分析

## 技术栈

- **硬件平台**: Windows/Mac + TP-Link摄像头
- **视频流**: RTSP协议视频流
- **视觉模型**: FastVLM
- **大语言模型**: AWS Bedrock Claude3
- **数据库**: MySQL
- **后端框架**: Python FastAPI
- **视频处理**: OpenCV + RTSP流处理
- **通知系统**: 飞书机器人API
- **前端界面**: HTML/CSS/JavaScript

## 项目仓库

GitHub: [https://github.com/LiHua69/blog.git](https://github.com/LiHua69/blog.git)

## 开发进度

本项目分为四个阶段，共25天的开发周期。详细的每日开发计划请参考：[博客大纲](blog-outline.md)

### 第一周：基础环境搭建

* 项目启动和需求分析
* 硬件环境配置
* 开发环境搭建
* 基础服务集成

### 第二周：核心功能开发

* 视频流处理
* 行为识别引擎
* 数据存储模块
* 告警系统集成

### 第三周：LLM智能分析

* 提示词工程设计
* AWS Bedrock集成
* 智能分析优化
* 系统集成测试

### 第四周：测试优化和界面

* 实际环境测试
* 性能优化
* 用户界面开发
* 项目总结

## 快速开始

详细的安装和配置说明请参考各章节内容。
