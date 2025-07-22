# Day 9: 数据库集成与行为数据存储

## 📅 日期：2025年7月22日（第二周第二天）

## 🎯 今日目标
建立完整的数据库系统，实现猫咪行为数据的存储、查询和管理功能，为后续AI分析和报告生成提供数据基础。

## 📋 具体任务清单

### 🗄️ 任务1：数据库架构设计与实现 (2小时)
**文件**: `src/database/models.py`, `src/database/connection.py`

#### 数据库表结构设计
```sql
-- 猫咪基本信息表
CREATE TABLE cats (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    breed VARCHAR(50),
    age INT,
    weight DECIMAL(4,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 行为记录表
CREATE TABLE behavior_records (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cat_id INT,
    behavior_type ENUM('rest', 'eat', 'drink', 'play', 'groom', 'alert', 'sleep'),
    confidence DECIMAL(3,2),
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    duration INT, -- 持续时间（秒）
    location_x INT, -- 检测位置坐标
    location_y INT,
    frame_path VARCHAR(255), -- 关键帧保存路径
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cat_id) REFERENCES cats(id)
);

-- 运动检测记录表
CREATE TABLE motion_events (
    id INT PRIMARY KEY AUTO_INCREMENT,
    motion_intensity DECIMAL(3,2), -- 运动强度 0-1
    motion_area INT, -- 运动区域像素数
    bounding_box JSON, -- 运动边界框坐标
    frame_timestamp TIMESTAMP,
    processed BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 系统健康监控表
CREATE TABLE system_health (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cpu_usage DECIMAL(5,2),
    memory_usage DECIMAL(5,2),
    disk_usage DECIMAL(5,2),
    camera_status ENUM('online', 'offline', 'error'),
    fps_actual DECIMAL(4,1),
    fps_target DECIMAL(4,1),
    error_count INT DEFAULT 0,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

#### 实现内容
- [x] MySQL连接池管理
- [x] 数据库模型类定义
- [x] 连接状态监控
- [x] 自动重连机制
- [x] 事务处理支持

### 🔧 任务2：行为数据管理器 (2小时)
**文件**: `src/database/behavior_manager.py`

#### 核心功能实现
```python
class BehaviorManager:
    def __init__(self, db_connection)
    
    # 行为记录管理
    def record_behavior(self, cat_id, behavior_type, confidence, start_time, location)
    def update_behavior_end(self, record_id, end_time)
    def get_behavior_history(self, cat_id, start_date, end_date)
    
    # 运动事件管理
    def record_motion_event(self, intensity, area, bounding_box, timestamp)
    def get_unprocessed_motions(self, limit=100)
    def mark_motion_processed(self, motion_id)
    
    # 统计分析
    def get_daily_behavior_stats(self, cat_id, date)
    def get_behavior_patterns(self, cat_id, days=7)
    def get_activity_timeline(self, cat_id, date)
```

#### 关键功能
- [x] 行为记录的CRUD操作
- [x] 批量数据插入优化
- [x] 数据查询性能优化
- [x] 行为模式分析
- [x] 异常数据检测和清理

### 🔧 任务3：数据缓存与性能优化 (1.5小时)
**文件**: `src/database/cache_manager.py`

#### 缓存策略实现
```python
class CacheManager:
    def __init__(self, cache_size=1000)
    
    # 内存缓存
    def cache_behavior_data(self, key, data, ttl=300)
    def get_cached_data(self, key)
    def invalidate_cache(self, pattern)
    
    # 批量写入缓存
    def add_to_write_buffer(self, table, data)
    def flush_write_buffer(self)
    
    # 查询结果缓存
    def cache_query_result(self, query_hash, result)
    def get_cached_query(self, query_hash)
```

#### 优化策略
- [x] LRU缓存机制
- [x] 批量写入缓冲
- [x] 查询结果缓存
- [x] 内存使用监控
- [x] 缓存命中率统计

### 🔧 任务4：数据库配置与连接管理 (1小时)
**文件**: `src/database/db_config.py`

#### 配置管理
```python
class DatabaseConfig:
    def __init__(self)
    
    # 连接配置
    def get_connection_params(self)
    def validate_config(self)
    def test_connection(self)
    
    # 性能配置
    def get_pool_settings(self)
    def get_cache_settings(self)
    def get_optimization_params(self)
```

#### 配置项
- [x] 数据库连接参数
- [x] 连接池大小设置
- [x] 查询超时配置
- [x] 缓存大小限制
- [x] 批量操作参数

### 🔧 任务5：数据库集成测试 (1.5小时)

#### 测试内容
1. **连接稳定性测试**
   ```python
   # 测试数据库连接
   def test_database_connection()
   def test_connection_pool()
   def test_reconnection_mechanism()
   ```

2. **数据操作测试**
   ```python
   # 测试CRUD操作
   def test_behavior_record_crud()
   def test_motion_event_crud()
   def test_batch_operations()
   ```

3. **性能测试**
   ```python
   # 测试查询性能
   def test_query_performance()
   def test_cache_effectiveness()
   def test_concurrent_operations()
   ```

#### 测试文件
- `test_database_integration.py` - 数据库集成测试
- `test_behavior_manager.py` - 行为管理器测试
- `test_cache_performance.py` - 缓存性能测试

## 📊 预期成果

### 功能成果
- [x] 完整的数据库架构
- [x] 高效的数据存储机制
- [x] 智能的缓存系统
- [x] 稳定的连接管理

### 性能指标
- 数据库查询响应时间 < 500ms
- 批量插入性能 > 1000条/秒
- 缓存命中率 > 80%
- 连接池利用率 < 80%

### 数据质量
- 数据完整性检查
- 异常数据自动清理
- 数据备份机制
- 查询结果验证

## 🔍 调试和验证

### 数据库性能监控
```python
# 创建性能监控脚本
def monitor_database_performance():
    # 监控查询执行时间
    # 监控连接池状态
    # 监控缓存命中率
    # 监控内存使用情况
```

### 数据一致性检查
```python
# 创建数据一致性验证
def validate_data_consistency():
    # 检查外键约束
    # 验证数据完整性
    # 检查重复数据
    # 验证时间戳逻辑
```

## 🚀 下一步计划

完成今日任务后，明天（Day 10）将重点关注：
- AI模型集成准备
- FastVLM环境配置
- 图像预处理管道
- 行为识别算法框架

## 📝 开发笔记

### 重要提醒
1. **数据库安全**：确保所有SQL查询使用参数化查询，防止SQL注入
2. **性能优化**：合理使用索引，避免N+1查询问题
3. **错误处理**：完善的异常处理和日志记录
4. **数据备份**：定期备份重要数据，设置恢复机制

### 技术要点
- 使用连接池避免频繁建立连接
- 实现读写分离提高性能
- 使用事务确保数据一致性
- 合理设计缓存策略减少数据库压力

### 测试策略
- 单元测试覆盖所有数据库操作
- 集成测试验证组件协作
- 性能测试确保满足指标要求
- 压力测试验证系统稳定性

---

**今日重点**：建立稳定高效的数据存储基础，为后续AI分析提供可靠的数据支撑。
**预计用时**：8小时
**难度等级**：⭐⭐⭐⭐
