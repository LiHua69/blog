#!/bin/bash

# GitBook 项目初始化脚本
# 用于快速搭建猫咪行为监控系统文档

echo "🐱 初始化猫咪行为监控系统 GitBook 项目..."

# 检查Node.js和npm是否安装
if ! command -v node &> /dev/null; then
    echo "❌ Node.js 未安装，请先安装 Node.js"
    echo "   Ubuntu/Debian: sudo apt install nodejs npm"
    echo "   CentOS/RHEL: sudo yum install nodejs npm"
    exit 1
fi

if ! command -v npm &> /dev/null; then
    echo "❌ npm 未安装，请先安装 npm"
    exit 1
fi

echo "✅ Node.js 和 npm 已安装"

# 安装GitBook CLI
echo "📚 安装 GitBook CLI..."
if ! command -v gitbook &> /dev/null; then
    npm install -g gitbook-cli
    echo "✅ GitBook CLI 安装完成"
else
    echo "✅ GitBook CLI 已存在"
fi

# 安装项目依赖
echo "📦 安装项目依赖..."
if [ -f "package.json" ]; then
    npm install
    echo "✅ 项目依赖安装完成"
fi

# 安装GitBook插件
echo "🔌 安装 GitBook 插件..."
gitbook install

# 创建剩余的文档文件
echo "📝 创建文档模板..."

# 创建第一周剩余文件
for day in {3..7}; do
    if [ ! -f "week1/day$day.md" ]; then
        cat > "week1/day$day.md" << EOF
# Day $day: 待完成

## 今日目标

待补充...

## 实施步骤

待补充...

## 今日完成

- [ ] 任务1
- [ ] 任务2

## 明日计划

待补充...

## 遇到的问题

暂无

## 学习笔记

待补充...
EOF
    fi
done

# 创建其他周的文件
for week in {2..4}; do
    for day in {1..7}; do
        day_num=$((($week-1)*7 + $day + 7))
        if [ $day_num -le 25 ] && [ ! -f "week$week/day$day_num.md" ]; then
            cat > "week$week/day$day_num.md" << EOF
# Day $day_num: 待完成

## 今日目标

待补充...

## 实施步骤

待补充...

## 今日完成

- [ ] 任务1
- [ ] 任务2

## 明日计划

待补充...

## 遇到的问题

暂无

## 学习笔记

待补充...
EOF
        fi
    done
done

# 创建附录文件
if [ ! -f "appendix/api.md" ]; then
    cat > "appendix/api.md" << EOF
# API 文档

## 接口概览

本系统提供RESTful API接口，支持以下功能：

### 认证接口
- POST /api/auth/login - 用户登录
- POST /api/auth/logout - 用户登出

### 监控接口
- GET /api/monitor/status - 获取监控状态
- POST /api/monitor/start - 启动监控
- POST /api/monitor/stop - 停止监控

### 数据接口
- GET /api/data/behaviors - 获取行为数据
- GET /api/data/alerts - 获取告警数据
- GET /api/data/reports - 获取分析报告

详细接口文档待补充...
EOF
fi

if [ ! -f "appendix/troubleshooting.md" ]; then
    cat > "appendix/troubleshooting.md" << EOF
# 故障排除

## 常见问题

### 1. 系统启动问题

**问题**: 服务无法启动
**解决方案**: 
- 检查配置文件
- 查看系统日志
- 验证依赖安装

### 2. 摄像头问题

**问题**: 摄像头无法识别
**解决方案**:
- 检查USB连接
- 验证设备权限
- 重启系统

### 3. 网络连接问题

**问题**: 无法连接AWS服务
**解决方案**:
- 检查网络连接
- 验证API密钥
- 确认服务可用性

更多问题解决方案待补充...
EOF
fi

echo "✅ 文档模板创建完成"

# 构建GitBook
echo "🔨 构建 GitBook..."
gitbook build

echo "🎉 GitBook 项目初始化完成！"
echo ""
echo "📖 使用方法："
echo "   开发模式: gitbook serve (访问 http://localhost:4000)"
echo "   构建文档: gitbook build"
echo "   生成PDF: gitbook pdf . ./cat-monitoring-system.pdf"
echo ""
echo "📁 项目结构："
echo "   ├── README.md          # 项目介绍"
echo "   ├── SUMMARY.md         # 目录结构"
echo "   ├── book.json          # GitBook配置"
echo "   ├── week1/             # 第一周文档"
echo "   ├── week2/             # 第二周文档"
echo "   ├── week3/             # 第三周文档"
echo "   ├── week4/             # 第四周文档"
echo "   └── appendix/          # 附录文档"
echo ""
echo "🚀 现在可以运行 'gitbook serve' 开始编写文档！"
EOF

chmod +x init-gitbook.sh
