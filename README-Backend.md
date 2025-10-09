# 文件管理系统 - 后端开发文档

## 📁 项目结构

```
src/main/kotlin/com/zzy/multifunctional_backend/
├── controller/              # 控制层
│   └── FileController.kt   # 文件管理API
├── service/                 # 服务层
│   ├── FileService.kt      # 文件业务逻辑
│   └── StorageService.kt   # MinIO存储服务
├── entity/                  # 实体类
│   └── FileMetadata.kt     # 文件元数据
├── mapper/                  # 数据访问层
│   └── FileMapper.kt       # MyBatis映射
├── dto/                     # 数据传输对象
│   ├── ApiResponse.kt      # 统一响应
│   ├── FileResponse.kt     # 文件响应
│   ├── FileListResponse.kt # 文件列表响应
│   └── FileUploadRequest.kt# 文件上传请求
├── config/                  # 配置类
│   ├── CorsConfig.kt       # 跨域配置
│   ├── RedisConfig.kt      # Redis配置
│   ├── MinioConfig.kt      # MinIO配置
│   └── MyBatisPlusConfig.kt# MyBatis-Plus配置
├── exception/               # 异常处理
│   ├── GlobalExceptionHandler.kt
│   └── CustomException.kt
└── util/                    # 工具类
    ├── FileUtil.kt         # 文件工具
    └── RedisUtil.kt        # Redis工具
```

## 🚀 快速开始

### 1. 环境准备

**必需环境：**
- JDK 17+
- Maven 3.6+
- MySQL 8.0+
- Redis 7.0+
- MinIO (可选，使用Docker启动)

### 2. 启动依赖服务

#### 使用Docker启动（推荐）

```bash
# 启动MySQL
docker run -d --name mysql \
  -e MYSQL_ROOT_PASSWORD=root123 \
  -e MYSQL_DATABASE=filedb \
  -p 3306:3306 \
  mysql:8.0

# 启动Redis
docker run -d --name redis \
  -p 6379:6379 \
  redis:7

# 启动MinIO
docker run -d --name minio \
  -p 9000:9000 -p 9001:9001 \
  -e MINIO_ROOT_USER=admin \
  -e MINIO_ROOT_PASSWORD=admin123 \
  minio/minio server /data --console-address ":9001"
```

#### 使用Docker Compose（一键启动）

创建 `docker-compose.yml`:

```yaml
version: '3.8'

services:
  mysql:
    image: mysql:8.0
    container_name: filedb-mysql
    environment:
      MYSQL_ROOT_PASSWORD: root123
      MYSQL_DATABASE: filedb
    ports:
      - "3306:3306"
    volumes:
      - mysql-data:/var/lib/mysql

  redis:
    image: redis:7
    container_name: filedb-redis
    ports:
      - "6379:6379"

  minio:
    image: minio/minio
    container_name: filedb-minio
    command: server /data --console-address ":9001"
    environment:
      MINIO_ROOT_USER: admin
      MINIO_ROOT_PASSWORD: admin123
    ports:
      - "9000:9000"
      - "9001:9001"
    volumes:
      - minio-data:/data

volumes:
  mysql-data:
  minio-data:
```

启动：
```bash
docker-compose up -d
```

### 3. 初始化数据库

```bash
# 连接MySQL并执行初始化脚本
mysql -h localhost -u root -proot123 < src/main/resources/sql/schema.sql
```

或者使用MySQL客户端工具（如Navicat、DBeaver）执行 `src/main/resources/sql/schema.sql` 文件。

### 4. 配置应用

编辑 `src/main/resources/application.properties`，根据实际情况修改配置：

```properties
# 数据库配置
spring.datasource.url=jdbc:mysql://localhost:3306/filedb?useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Shanghai&useSSL=false&allowPublicKeyRetrieval=true
spring.datasource.username=root
spring.datasource.password=root123

# Redis配置
spring.data.redis.host=localhost
spring.data.redis.port=6379

# MinIO配置
minio.endpoint=http://localhost:9000
minio.access-key=admin
minio.secret-key=admin123
minio.bucket-name=file-storage
```

### 5. 启动应用

```bash
# 方式1：使用Maven
mvn spring-boot:run

# 方式2：使用IDE
# 在IDEA中右键运行 MultifunctionalBackendApplication.kt

# 方式3：打包后运行
mvn clean package
java -jar target/multifunctional-backend-0.0.1-SNAPSHOT.jar
```

应用启动后访问：
- **后端API**: http://localhost:8080
- **Swagger文档**: http://localhost:8080/doc.html
- **MinIO控制台**: http://localhost:9001 (admin/admin123)

## 📚 API文档

### 1. 文件上传

**接口**: `POST /api/files/upload`

**请求参数**:
- `file`: 文件（multipart/form-data）
- `userId`: 用户ID（可选）

**示例**:
```bash
curl -X POST "http://localhost:8080/api/files/upload" \
  -H "Content-Type: multipart/form-data" \
  -F "file=@/path/to/file.pdf" \
  -F "userId=1"
```

**响应**:
```json
{
  "code": 200,
  "message": "文件上传成功",
  "data": {
    "id": 1,
    "fileName": "example.pdf",
    "fileSize": 2621440,
    "fileSizeFormatted": "2.5 MB",
    "fileType": "application/pdf",
    "uploadTime": "2025-10-09 14:30:25",
    "downloadUrl": "/api/files/1/download"
  }
}
```

### 2. 获取文件列表

**接口**: `GET /api/files`

**请求参数**:
- `page`: 页码（默认1）
- `size`: 每页数量（默认10）
- `keyword`: 搜索关键词（可选）
- `sortBy`: 排序字段（默认uploadTime）
- `order`: 排序方式：asc/desc（默认desc）

**示例**:
```bash
curl "http://localhost:8080/api/files?page=1&size=10&keyword=pdf"
```

### 3. 下载文件

**接口**: `GET /api/files/{id}/download`

**示例**:
```bash
curl -O "http://localhost:8080/api/files/1/download"
```

### 4. 删除文件

**接口**: `DELETE /api/files/{id}`

**示例**:
```bash
curl -X DELETE "http://localhost:8080/api/files/1"
```

### 5. 批量删除

**接口**: `DELETE /api/files/batch`

**请求体**:
```json
{
  "ids": [1, 2, 3, 4, 5]
}
```

## 🎯 核心功能

### 1. 文件上传
- ✅ 支持多种文件类型
- ✅ 文件大小限制（默认100MB）
- ✅ 文件类型验证
- ✅ MD5秒传（相同文件直接返回）
- ✅ 自动生成UUID文件名

### 2. 文件下载
- ✅ 支持断点续传
- ✅ 中文文件名支持
- ✅ 下载次数统计
- ✅ 文件流式传输

### 3. 文件管理
- ✅ 分页查询
- ✅ 关键词搜索
- ✅ 排序功能
- ✅ 逻辑删除
- ✅ 批量操作

### 4. 缓存优化
- ✅ Redis缓存文件列表
- ✅ Redis缓存文件详情
- ✅ 自动缓存失效

### 5. 存储方案
- ✅ MinIO对象存储
- ✅ 支持扩展云存储（OSS、COS）

## 🔧 配置说明

### 文件上传配置

```properties
# 文件大小限制
spring.servlet.multipart.max-file-size=100MB
spring.servlet.multipart.max-request-size=100MB

# 允许的文件类型
file.allowed-types=jpg,jpeg,png,gif,pdf,doc,docx,xls,xlsx,ppt,pptx,zip,rar,txt,mp4,mp3
```

### Redis缓存策略

- 文件列表缓存：5分钟
- 文件详情缓存：10分钟
- 缓存Key格式：
  - `file:list:{page}:{size}:{keyword}:{sortBy}:{order}`
  - `file:info:{id}`

### MinIO配置

访问 http://localhost:9001 登录MinIO控制台：
- 用户名: admin
- 密码: admin123

创建bucket: `file-storage` (应用会自动创建)

## 🧪 测试

### 使用Postman测试

导入以下请求集合：

**1. 上传文件**
```
POST http://localhost:8080/api/files/upload
Content-Type: multipart/form-data
Body: 
  - file: [选择文件]
  - userId: 1 (可选)
```

**2. 获取列表**
```
GET http://localhost:8080/api/files?page=1&size=10
```

**3. 下载文件**
```
GET http://localhost:8080/api/files/1/download
```

### 使用cURL测试

```bash
# 上传文件
curl -X POST http://localhost:8080/api/files/upload \
  -F "file=@test.pdf"

# 获取列表
curl http://localhost:8080/api/files

# 下载文件
curl -O http://localhost:8080/api/files/1/download

# 删除文件
curl -X DELETE http://localhost:8080/api/files/1
```

## 📊 性能优化

### 1. 数据库优化
- 为常用查询字段添加索引
- 使用逻辑删除避免物理删除
- 分页查询避免全表扫描

### 2. 缓存优化
- Redis缓存热点数据
- 缓存自动过期机制
- 数据变更时清除缓存

### 3. 文件存储优化
- MinIO分布式存储
- 文件MD5去重（秒传）
- 流式传输大文件

## 🐛 常见问题

### 1. 连接MySQL失败
```
检查MySQL是否启动
检查端口是否正确（3306）
检查用户名密码是否正确
```

### 2. Redis连接失败
```
检查Redis是否启动
检查端口是否正确（6379）
如果设置了密码，需要在配置中添加
```

### 3. MinIO连接失败
```
检查MinIO是否启动
检查endpoint配置（http://localhost:9000）
检查access-key和secret-key
```

### 4. 文件上传失败
```
检查文件大小是否超限
检查文件类型是否支持
检查MinIO bucket是否存在
查看日志获取详细错误信息
```

## 📝 开发建议

### 1. 代码规范
- 使用Kotlin标准命名规范
- 添加必要的注释
- 遵循SOLID原则

### 2. 异常处理
- 使用全局异常处理器
- 自定义业务异常
- 记录详细日志

### 3. 日志记录
- 使用SLF4J + Logback
- 区分日志级别（debug、info、error）
- 记录关键业务操作

## 🚀 后续扩展

### 1. 用户认证
- Spring Security + JWT
- 用户注册登录
- 权限控制

### 2. 文件分享
- 生成分享链接
- 设置过期时间
- 访问密码保护

### 3. 实时通知
- WebSocket
- 上传进度推送
- 文件变更通知

### 4. 云存储集成
- 阿里云OSS
- 腾讯云COS
- 七牛云存储

## 📄 许可证

本项目采用 MIT 许可证

---

**作者**: ZZY  
**更新时间**: 2025-10-09  
**版本**: v1.0


