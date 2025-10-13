# Android开发者的Spring Boot后端开发完整教程
> 基于 Spring Boot 3.x + Kotlin + Docker 的文件管理系统实战教程
>
> 作者：面向Android开发者的后端入门指南
>

---

## 📚 教程说明
本教程专门为有 Java/Kotlin 基础的 Android 开发者设计，通过一个完整的**文件管理系统**项目，带你从零开始学习后端开发。

### 你将学到什么
+ ✅ 如何创建和配置 Spring Boot 项目
+ ✅ 如何设计数据库表和编写实体类
+ ✅ 如何使用 MyBatis-Plus 操作数据库
+ ✅ 如何开发 RESTful API（普通接口 + 文件接口）
+ ✅ 如何集成 Redis 缓存
+ ✅ 如何使用 MinIO 对象存储
+ ✅ 如何处理全局异常
+ ✅ 如何使用 Docker 部署项目

### 项目技术栈
| 技术 | 版本 | 说明 |
| --- | --- | --- |
| Spring Boot | 3.5.6 | 后端框架 |
| Kotlin | 1.9.25 | 开发语言 |
| MyBatis-Plus | 3.5.5 | ORM框架（类似Android的Room） |
| MySQL | 8.0 | 关系型数据库 |
| Redis | 7.0 | 缓存数据库 |
| MinIO | 最新版 | 对象存储（用于存储文件） |
| Docker | 最新版 | 容器化部署 |
| Knife4j | 4.4.0 | API文档（类似Postman） |


---

## 📖 目录
+ [第一章：环境准备与项目创建](#第一章环境准备与项目创建)
+ [第二章：Docker环境搭建](#第二章docker环境搭建)
+ [第三章：数据库设计与实体类](#第三章数据库设计与实体类)
+ [第四章：配置文件详解](#第四章配置文件详解)
+ [第五章：依赖管理（pom.xml）](#第五章依赖管理pomxml)
+ [第六章：Mapper层开发（数据访问层）](#第六章mapper层开发数据访问层)
+ [第七章：Service层开发（业务逻辑层）](#第七章service层开发业务逻辑层)
+ [第八章：Controller层开发（接口层）](#第八章controller层开发接口层)
+ [第九章：配置类详解](#第九章配置类详解)
+ [第十章：全局异常处理](#第十章全局异常处理)
+ [第十一章：启动与测试](#第十一章启动与测试)
+ [第十二章：总结与进阶](#第十二章总结与进阶)

> **注：** 云服务器部署内容请查阅单独文档《[部署到阿里云Ubuntu服务器指南.md](./部署到阿里云Ubuntu服务器指南.md)》

---

## 第一章：环境准备与项目创建
### 1.1 前置知识对比
作为 Android 开发者，你已经具备了很多后端开发所需的基础知识。让我们对比一下：

| Android 概念 | 后端对应概念 | 说明 |
| --- | --- | --- |
| Activity/Fragment | Controller | 接收用户请求，返回响应 |
| ViewModel | Service | 处理业务逻辑 |
| Repository | Mapper/DAO | 数据访问层 |
| Room Database | MyBatis-Plus | ORM框架 |
| Entity | Entity | 数据实体类（完全一样！） |
| SharedPreferences | Redis | 键值对存储 |
| Retrofit | RestTemplate/HttpClient | HTTP客户端 |
| Gson/Moshi | Jackson | JSON序列化 |


### 1.2 环境准备
#### 1.2.1 必需软件
1. **JDK 17**
    - 下载地址：[https://www.oracle.com/java/technologies/downloads/](https://www.oracle.com/java/technologies/downloads/)
    - 验证安装：`java -version`
2. **Maven**（项目构建工具，类似Android的Gradle）
    - 下载地址：[https://maven.apache.org/download.cgi](https://maven.apache.org/download.cgi)
    - 验证安装：`mvn -version`
3. **Docker Desktop**（容器化工具）
    - 下载地址：[https://www.docker.com/products/docker-desktop/](https://www.docker.com/products/docker-desktop/)
    - 验证安装：`docker -version`
4. **IDE推荐**
    - IntelliJ IDEA（首选，社区版免费）
    - 或者继续使用 Android Studio（也支持Spring Boot开发）

### 1.3 创建Spring Boot项目
#### 方法一：使用 Spring Initializr（推荐）
1. 访问：[https://start.spring.io/](https://start.spring.io/)
2. 配置项目：
    - **Project**: Maven
    - **Language**: Kotlin
    - **Spring Boot**: 3.5.6
    - **Group**: com.zzy
    - **Artifact**: multifunctional-backend
    - **Packaging**: Jar
    - **Java**: 17
3. 添加依赖：
    - Spring Web（必需）
    - Spring Data Redis
    - MySQL Driver
    - Validation
4. 点击"Generate"下载项目

#### 方法二：使用 IntelliJ IDEA
1. 打开 IDEA，点击 `New Project`
2. 选择 `Spring Initializr`
3. 按照上述配置填写
4. 点击"Create"

### 1.4 项目结构说明
创建完成后，你会看到如下结构（对比Android项目）：

```plain
multifunctional-backend/
├── src/
│   ├── main/
│   │   ├── kotlin/                          # 源代码目录（类似Android的java/kotlin）
│   │   │   └── com/zzy/multifunctional_backend/
│   │   │       ├── config/                  # 配置类（类似Android的di包）
│   │   │       ├── controller/              # 控制器（类似Activity/Fragment）
│   │   │       ├── service/                 # 服务层（类似ViewModel）
│   │   │       ├── mapper/                  # 数据访问层（类似Room DAO）
│   │   │       ├── entity/                  # 实体类（类似Room Entity）
│   │   │       ├── dto/                     # 数据传输对象（类似网络请求的data class）
│   │   │       ├── exception/               # 异常处理
│   │   │       └── util/                    # 工具类
│   │   │       └── MultifunctionalBackendApplication.kt  # 启动类（类似Application）
│   │   └── resources/
│   │       ├── application.properties       # 配置文件（类似gradle.properties）
│   │       ├── sql/                         # SQL脚本
│   │       └── static/                      # 静态资源
│   └── test/                                # 测试代码（类似androidTest）
├── pom.xml                                   # Maven配置（类似build.gradle）
└── docker-compose.yml                        # Docker配置
```

### 1.5 项目启动类
打开 `MultifunctionalBackendApplication.kt`，这是项目的入口（类似Android的Application类）：

```kotlin
package com.zzy.multifunctional_backend

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

/**
 * Spring Boot 应用启动类
 * 
 * @SpringBootApplication 注解说明：
 * 1. @Configuration - 表示这是一个配置类
 * 2. @EnableAutoConfiguration - 启动自动配置
 * 3. @ComponentScan - 自动扫描组件（类似Dagger/Hilt的组件扫描）
 */
@SpringBootApplication
class MultifunctionalBackendApplication

/**
 * main 函数 - 应用程序入口
 * 
 * @param args 命令行参数
 */
fun main(args: Array<String>) {
    // 启动Spring Boot应用
    // 类似Android的 onCreate()，但这是启动整个后端服务
    runApplication<MultifunctionalBackendApplication>(*args)
}
```

**关键概念解释：**

+ `@SpringBootApplication`：这是一个组合注解，告诉Spring这是一个Spring Boot应用
+ `runApplication()`：启动内置的Web服务器（默认是Tomcat），开始监听HTTP请求
+ 启动后，服务器会监听8080端口（可在配置文件中修改）

### 1.6 验证项目是否创建成功
在项目根目录执行：

```bash
# Windows
mvnw.cmd spring-boot:run

# Mac/Linux  
./mvnw spring-boot:run
```

如果看到类似以下输出，说明项目创建成功：

```plain
  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::                (v3.5.6)

Started MultifunctionalBackendApplication in 2.3 seconds
```

**恭喜！你已经成功创建了第一个Spring Boot项目！** 🎉

---

## 第二章：Docker环境搭建
### 2.1 为什么使用Docker？
作为Android开发者，你可能遇到过这些问题：

+ "在我电脑上能运行啊"
+ 需要安装各种数据库、中间件，配置复杂
+ 团队成员环境不一致导致的问题

Docker就是用来解决这些问题的！它类似于Android模拟器，但更轻量级：

+ **Docker = 标准化的运行环境**
+ **Docker Container = 独立的小型虚拟机**
+ **Docker Image = 类似APK，打包好的应用**

### 2.2 Docker基本概念
| Docker概念 | Android对应概念 | 说明 |
| --- | --- | --- |
| Image（镜像） | APK | 打包好的应用程序 |
| Container（容器） | 运行的App进程 | 镜像运行时的实例 |
| Docker Compose | 多个App协同工作 | 管理多个容器 |
| Volume（数据卷） | 持久化存储 | 容器的数据持久化 |


### 2.3 创建 docker-compose.yml
在项目根目录创建 `docker-compose.yml` 文件：

```yaml
version: '3.8'  # Docker Compose版本

# 定义服务（类似定义多个App）
services:
  # MySQL数据库服务
  mysql:
    image: mysql:8.0                    # 使用MySQL 8.0镜像
    container_name: filedb-mysql        # 容器名称
    environment:                        # 环境变量（类似Android的BuildConfig）
      MYSQL_ROOT_PASSWORD: root123      # root用户密码
      MYSQL_DATABASE: filedb            # 自动创建的数据库名
      TZ: Asia/Shanghai                 # 时区设置
    ports:
      - "3306:3306"                     # 端口映射：宿主机端口:容器端口
    volumes:
      # 数据持久化（类似Android的内部存储）
      - mysql-data:/var/lib/mysql
      # 初始化SQL脚本
      - ./src/main/resources/sql/schema.sql:/docker-entrypoint-initdb.d/schema.sql
    command: --default-authentication-plugin=mysql_native_password
    networks:
      - filedb-network                  # 加入自定义网络

  # Redis缓存服务
  redis:
    image: redis:7                      # 使用Redis 7镜像
    container_name: filedb-redis
    ports:
      - "6379:6379"                     # Redis默认端口
    volumes:
      - redis-data:/data                # 数据持久化
    networks:
      - filedb-network

  # MinIO对象存储服务（类似阿里云OSS、AWS S3）
  minio:
    image: minio/minio                  # MinIO镜像
    container_name: filedb-minio
    command: server /data --console-address ":9001"
    environment:
      MINIO_ROOT_USER: admin            # MinIO管理员用户名
      MINIO_ROOT_PASSWORD: admin123     # MinIO管理员密码
      TZ: Asia/Shanghai
    ports:
      - "9000:9000"                     # API端口
      - "9001:9001"                     # Web控制台端口
    volumes:
      - minio-data:/data                # 文件存储位置
    networks:
      - filedb-network

# 定义数据卷（持久化存储）
volumes:
  mysql-data:    # MySQL数据
  redis-data:    # Redis数据
  minio-data:    # MinIO文件

# 定义网络（让容器之间可以互相通信）
networks:
  filedb-network:
    driver: bridge  # 桥接网络模式
```

### 2.4 启动Docker服务
#### 2.4.1 启动所有服务
在项目根目录打开终端，执行：

```bash
# 启动所有服务（后台运行）
docker-compose up -d

# 查看服务状态
docker-compose ps

# 查看日志
docker-compose logs -f
```

**预期输出：**

```plain
✔ Container filedb-mysql  Started
✔ Container filedb-redis  Started
✔ Container filedb-minio  Started
```

#### 2.4.2 验证服务是否启动成功
1. **MySQL验证**

```bash
# 使用docker命令连接MySQL
docker exec -it filedb-mysql mysql -uroot -proot123

# 进入后执行
SHOW DATABASES;
# 应该能看到 filedb 数据库
```

1. **Redis验证**

```bash
# 连接Redis
docker exec -it filedb-redis redis-cli

# 测试
ping
# 应该返回 PONG
```

1. **MinIO验证**
+ 打开浏览器访问：[http://localhost:9001](http://localhost:9001)
+ 用户名：admin
+ 密码：admin123
+ 应该能看到MinIO管理界面

### 2.5 常用Docker命令
```bash
# 启动服务
docker-compose up -d

# 停止服务
docker-compose down

# 停止服务并删除数据卷（危险操作！会删除所有数据）
docker-compose down -v

# 重启服务
docker-compose restart

# 查看日志
docker-compose logs -f [服务名]

# 进入容器内部
docker exec -it [容器名] /bin/bash

# 查看所有容器
docker ps -a

# 查看Docker资源占用
docker stats
```

### 2.6 故障排查
**问题1：端口被占用**

```plain
Error: bind: address already in use
```

解决方法：

+ 修改 `docker-compose.yml` 中的端口映射
+ 或者关闭占用端口的程序

**问题2：Docker Desktop未启动**

```plain
Error: Cannot connect to the Docker daemon
```

解决方法：启动 Docker Desktop

**问题3：网络问题导致镜像下载慢**

```plain
# 配置Docker镜像加速（阿里云）
# 在Docker Desktop设置中添加镜像源：
https://mirror.aliyuncs.com
```

### 2.7 小结
完成本章后，你应该：

+ ✅ 理解Docker的基本概念
+ ✅ 成功启动MySQL、Redis、MinIO三个服务
+ ✅ 能够使用基本的Docker命令

**下一章我们将设计数据库表结构和创建实体类！**

---

## 第三章：数据库设计与实体类
### 3.1 数据库设计思维
在Android开发中，你可能用过Room数据库。后端的数据库设计类似，但规模更大：

| Android Room | 后端MySQL | 说明 |
| --- | --- | --- |
| @Entity | CREATE TABLE | 定义表结构 |
| @Dao | Mapper接口 | 数据访问接口 |
| @Database | DataSource | 数据库连接 |
| SQLite | MySQL | 数据库引擎 |


### 3.2 创建数据库初始化脚本
创建文件：`src/main/resources/sql/schema.sql`

```sql
-- ============================================
-- 文件管理系统数据库初始化脚本
-- ============================================

-- 创建数据库（如果不存在）
CREATE DATABASE IF NOT EXISTS filedb 
DEFAULT CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

-- 使用该数据库
USE filedb;

-- ============================================
-- 文件元数据表
-- ============================================
CREATE TABLE IF NOT EXISTS file_metadata (
    -- 主键，自增ID（类似Room的@PrimaryKey(autoGenerate = true)）
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '文件ID',
    
    -- 文件基本信息
    file_name VARCHAR(255) NOT NULL COMMENT '原始文件名',
    stored_name VARCHAR(255) NOT NULL COMMENT '存储文件名(UUID)',
    file_size BIGINT NOT NULL COMMENT '文件大小(字节)',
    file_type VARCHAR(100) COMMENT '文件MIME类型',
    file_extension VARCHAR(20) COMMENT '文件扩展名',
    file_path VARCHAR(500) COMMENT '文件存储路径',
    
    -- 秒传功能字段
    file_md5 VARCHAR(64) COMMENT '文件MD5值(用于秒传)',
    
    -- 统计信息
    download_count INT DEFAULT 0 COMMENT '下载次数',
    
    -- 时间戳
    upload_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    
    -- 状态管理（软删除）
    status TINYINT DEFAULT 1 COMMENT '状态(1:正常 0:已删除)',
    
    -- 关联用户（可选）
    user_id BIGINT COMMENT '上传用户ID(可选)',
    
    -- 索引优化查询性能
    INDEX idx_file_name (file_name),        -- 文件名索引（提升搜索速度）
    INDEX idx_upload_time (upload_time),    -- 时间索引（提升排序速度）
    INDEX idx_file_md5 (file_md5),          -- MD5索引（秒传功能）
    INDEX idx_status (status)               -- 状态索引（过滤已删除数据）
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文件元数据表';

-- ============================================
-- 用户表（可选扩展）
-- ============================================
CREATE TABLE IF NOT EXISTS user (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '用户ID',
    username VARCHAR(50) NOT NULL UNIQUE COMMENT '用户名',
    password VARCHAR(255) NOT NULL COMMENT '密码',
    email VARCHAR(100) COMMENT '邮箱',
    
    -- 存储配额管理
    storage_quota BIGINT DEFAULT 1073741824 COMMENT '存储配额(默认1GB)',
    used_storage BIGINT DEFAULT 0 COMMENT '已用存储',
    
    -- 时间戳
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    
    -- 状态
    status TINYINT DEFAULT 1 COMMENT '状态(1:正常 0:禁用)',
    
    -- 索引
    INDEX idx_username (username),
    INDEX idx_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';
```

**设计要点说明：**

1. **COMMENT注释**：每个字段都有注释，方便维护
2. **索引INDEX**：为常用查询字段添加索引，提升性能
3. **软删除**：用status字段标记删除，而不是真正删除数据
4. **时间戳**：记录创建和更新时间，方便追踪
5. **utf8mb4**：支持emoji和特殊字符

### 3.3 创建实体类（Entity）
创建文件：`src/main/kotlin/com/zzy/multifunctional_backend/entity/FileMetadata.kt`

```kotlin
package com.zzy.multifunctional_backend.entity

import com.baomidou.mybatisplus.annotation.IdType
import com.baomidou.mybatisplus.annotation.TableId
import com.baomidou.mybatisplus.annotation.TableName
import java.time.LocalDateTime

/**
 * 文件元数据实体类
 * 
 * 这个类对应数据库的 file_metadata 表
 * 类似于Android Room的 @Entity 注解类
 * 
 * @author ZZY
 * @date 2025-10-09
 */
@TableName("file_metadata")  // 指定对应的数据库表名（类似Room的@Entity(tableName = "...")）
data class FileMetadata(
    
    /**
     * 主键ID
     * @TableId 注解说明：
     * - type = IdType.AUTO：主键自增策略
     * - 类似Room的 @PrimaryKey(autoGenerate = true)
     */
    @TableId(type = IdType.AUTO)
    var id: Long? = null,
    
    /**
     * 原始文件名
     * 用户上传时的文件名，例如："春节照片.jpg"
     */
    var fileName: String? = null,
    
    /**
     * 存储文件名(UUID)
     * 为了避免文件名冲突，使用UUID生成唯一文件名
     * 例如："a1b2c3d4e5f6.jpg"
     */
    var storedName: String? = null,
    
    /**
     * 文件大小(字节)
     * 用于显示文件大小和验证上传限制
     */
    var fileSize: Long? = null,
    
    /**
     * 文件MIME类型
     * 例如："image/jpeg", "application/pdf"
     * 用于HTTP响应的Content-Type设置
     */
    var fileType: String? = null,
    
    /**
     * 文件扩展名
     * 例如："jpg", "pdf", "mp4"
     */
    var fileExtension: String? = null,
    
    /**
     * 文件存储路径
     * MinIO中的对象路径
     */
    var filePath: String? = null,
    
    /**
     * 文件MD5值
     * 用途：
     * 1. 实现秒传功能（相同文件不重复上传）
     * 2. 验证文件完整性
     */
    var fileMd5: String? = null,
    
    /**
     * 下载次数
     * 用于统计文件热度
     */
    var downloadCount: Int = 0,
    
    /**
     * 上传时间
     * 使用LocalDateTime而不是Date（更现代的时间API）
     */
    var uploadTime: LocalDateTime? = null,
    
    /**
     * 更新时间
     * 每次修改记录时自动更新
     */
    var updateTime: LocalDateTime? = null,
    
    /**
     * 状态(1:正常 0:已删除)
     * 软删除标记，删除时只修改这个字段，不真正删除数据
     * 好处：可以恢复数据，便于审计
     */
    var status: Int = 1,
    
    /**
     * 上传用户ID(可选)
     * 如果系统有用户系统，可以关联用户
     */
    var userId: Long? = null
)
```

**关键知识点：**

1. **data class**：Kotlin的数据类，自动生成equals、hashCode、toString等方法
2. **可空类型**：使用`?`表示字段可以为null
3. **默认值**：某些字段提供默认值（如status = 1）
4. **LocalDateTime**：Java 8+的时间API，比旧的Date更好用

### 3.4 对比Android Room
让我们对比一下Android Room的写法：

**Android Room写法：**

```kotlin
@Entity(tableName = "file_metadata")
data class FileMetadata(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    
    @ColumnInfo(name = "file_name")
    val fileName: String,
    
    // ... 其他字段
)
```

**后端MyBatis-Plus写法：**

```kotlin
@TableName("file_metadata")  // 对应 @Entity
data class FileMetadata(
    @TableId(type = IdType.AUTO)  // 对应 @PrimaryKey
    var id: Long? = null,
    
    var fileName: String? = null,  // MyBatis-Plus自动映射驼峰命名
    
    // ... 其他字段
)
```

**区别：**

+ Room需要`@ColumnInfo`指定列名，MyBatis-Plus自动驼峰转下划线
+ Room用`val`（不可变），后端用`var`（可变，方便更新）
+ Room的ID用0作默认值，后端用null

### 3.5 字段命名规范
| 数据库字段 | Java/Kotlin属性 | 说明 |
| --- | --- | --- |
| file_name | fileName | 下划线转驼峰（自动） |
| upload_time | uploadTime | 下划线转驼峰（自动） |
| user_id | userId | 下划线转驼峰（自动） |


MyBatis-Plus会自动进行驼峰命名转换，无需手动配置！

### 3.6 验证表是否创建成功
启动Docker后，MySQL会自动执行`schema.sql`脚本。验证方法：

```bash
# 1. 连接MySQL
docker exec -it filedb-mysql mysql -uroot -proot123

# 2. 查看数据库
SHOW DATABASES;

# 3. 使用filedb数据库
USE filedb;

# 4. 查看表结构
DESC file_metadata;

# 5. 查看表数据
SELECT * FROM file_metadata;
```

### 3.7 小结
完成本章后，你应该：

+ ✅ 理解数据库设计的基本原则
+ ✅ 掌握SQL建表语句
+ ✅ 创建了Entity实体类
+ ✅ 理解MyBatis-Plus与Room的异同

**下一章我们将学习如何配置项目的各种参数！**

---

## 第四章：配置文件详解
### 4.1 配置文件的作用
在Android中，你可能用过：

+ `gradle.properties`：Gradle配置
+ `AndroidManifest.xml`：应用配置
+ `build.gradle`：构建配置

在Spring Boot中，`application.properties` 相当于这些配置的合集！

### 4.2 application.properties 完整配置
创建/编辑文件：`src/main/resources/application.properties`

```properties
# ============================================
# 应用基础配置
# ============================================
# 应用名称（类似Android的app_name）
spring.application.name=multifunctional-backend

# 服务器端口（默认8080，类似Android的网络端口）
# 启动后访问：http://localhost:8080
server.port=8080

# ============================================
# 数据库配置 - MySQL
# ============================================
# MySQL驱动类（类似Android的JDBC Driver）
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver

# 数据库连接URL（重要！）
# localhost:3306 - MySQL地址和端口
# filedb - 数据库名
# useUnicode=true - 使用Unicode编码
# characterEncoding=utf8 - 字符编码UTF-8
# serverTimezone=Asia/Shanghai - 时区设置
# useSSL=false - 关闭SSL（本地开发）
# allowPublicKeyRetrieval=true - 允许公钥检索
spring.datasource.url=jdbc:mysql://localhost:3306/filedb?useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Shanghai&useSSL=false&allowPublicKeyRetrieval=true

# 数据库用户名（Docker中配置的）
spring.datasource.username=root

# 数据库密码（Docker中配置的）
spring.datasource.password=root123

# ============================================
# MyBatis-Plus 配置
# ============================================
# 实体类包路径（类似Room的entities配置）
mybatis-plus.type-aliases-package=com.zzy.multifunctional_backend.entity

# 开启驼峰命名转换（file_name -> fileName）
mybatis-plus.configuration.map-underscore-to-camel-case=true

# SQL日志输出（开发时打开，生产环境关闭）
# 类似Android的Log.d()，会打印SQL语句
mybatis-plus.configuration.log-impl=org.apache.ibatis.logging.stdout.StdOutImpl

# 主键类型：自增
mybatis-plus.global-config.db-config.id-type=auto

# 逻辑删除配置（软删除）
mybatis-plus.global-config.db-config.logic-delete-field=deleted
mybatis-plus.global-config.db-config.logic-delete-value=1
mybatis-plus.global-config.db-config.logic-not-delete-value=0

# ============================================
# Redis 配置（类似Android的SharedPreferences，但更强大）
# ============================================
# Redis服务器地址
spring.data.redis.host=localhost

# Redis端口（默认6379）
spring.data.redis.port=6379

# Redis密码（我们的Docker配置没有密码）
spring.data.redis.password=

# Redis数据库索引（0-15，默认0）
spring.data.redis.database=0

# 连接超时时间
spring.data.redis.timeout=5000ms

# 连接池配置
spring.data.redis.lettuce.pool.max-active=8   # 最大连接数
spring.data.redis.lettuce.pool.max-idle=8     # 最大空闲连接
spring.data.redis.lettuce.pool.min-idle=0     # 最小空闲连接
spring.data.redis.lettuce.pool.max-wait=-1ms  # 最大等待时间

# ============================================
# 文件上传配置
# ============================================
# 启用文件上传
spring.servlet.multipart.enabled=true

# 单个文件最大大小（100MB）
spring.servlet.multipart.max-file-size=100MB

# 整个请求最大大小（100MB）
spring.servlet.multipart.max-request-size=100MB

# 文件大小阈值（超过此值写入磁盘）
spring.servlet.multipart.file-size-threshold=2KB

# ============================================
# MinIO 对象存储配置
# ============================================
# MinIO服务器地址（Docker中配置的）
minio.endpoint=http://localhost:9000

# MinIO访问密钥（类似Android的API Key）
minio.access-key=admin

# MinIO密钥（类似Android的API Secret）
minio.secret-key=admin123

# 存储桶名称（类似文件夹）
minio.bucket-name=file-storage

# ============================================
# 文件存储配置（本地存储备用方案）
# ============================================
# 本地上传目录
file.upload-dir=./uploads

# 文件大小限制（字节）
file.max-size=104857600

# 允许的文件类型（白名单）
file.allowed-types=jpg,jpeg,png,gif,pdf,doc,docx,xls,xlsx,ppt,pptx,zip,rar,txt,mp4,mp3

# ============================================
# Knife4j API文档配置（类似Postman）
# ============================================
# 启用API文档
springdoc.api-docs.enabled=true
springdoc.swagger-ui.enabled=true

# 启用Knife4j增强
knife4j.enable=true

# 中文界面
knife4j.setting.language=zh_cn

# ============================================
# Jackson 配置（JSON序列化，类似Gson）
# ============================================
# 日期格式化
spring.jackson.date-format=yyyy-MM-dd HH:mm:ss

# 时区设置
spring.jackson.time-zone=GMT+8

# 忽略null值（类似Gson的serializeNulls）
spring.jackson.default-property-inclusion=non_null

# ============================================
# 日志配置
# ============================================
# 日志级别：trace < debug < info < warn < error
# 开发环境用debug，生产环境用info
logging.level.com.zzy.multifunctional_backend=debug

# 日志输出格式
# %d - 日期时间
# %thread - 线程名
# %level - 日志级别
# %logger - 类名
# %msg - 日志消息
logging.pattern.console=%d{yyyy-MM-dd HH:mm:ss} [%thread] %-5level %logger{50} - %msg%n
```

### 4.3 配置项分类说明
#### 4.3.1 数据库配置详解
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/filedb?参数1=值1&参数2=值2
```

**URL参数说明：**

+ `useUnicode=true`：支持中文字符
+ `characterEncoding=utf8`：使用UTF-8编码
+ `serverTimezone=Asia/Shanghai`：设置时区（避免时间差8小时）
+ `useSSL=false`：本地开发关闭SSL，生产环境建议开启
+ `allowPublicKeyRetrieval=true`：MySQL 8.0新特性，允许客户端获取公钥

#### 4.3.2 MyBatis-Plus日志
```properties
mybatis-plus.configuration.log-impl=org.apache.ibatis.logging.stdout.StdOutImpl
```

**开启后会打印SQL：**

```plain
==>  Preparing: SELECT * FROM file_metadata WHERE id = ?
==> Parameters: 1(Long)
<==    Columns: id, file_name, file_size, ...
<==        Row: 1, test.jpg, 102400, ...
<==      Total: 1
```

### 4.4 不同环境的配置
实际项目中，开发环境和生产环境的配置不同。可以创建多个配置文件：

```plain
application.properties          # 公共配置
application-dev.properties      # 开发环境
application-prod.properties     # 生产环境
```

**激活配置：**

```properties
# 在 application.properties 中指定
spring.profiles.active=dev
```

**或者启动时指定：**

```bash
java -jar app.jar --spring.profiles.active=prod
```

### 4.5 配置的优先级
从高到低：

1. 命令行参数
2. 系统环境变量
3. application-{profile}.properties
4. application.properties
5. 代码中的@Value默认值

### 4.6 使用配置值
在代码中读取配置：

```kotlin
import org.springframework.beans.factory.annotation.Value
import org.springframework.stereotype.Component

@Component
class FileConfig {
    
    // 读取配置值（类似Android的BuildConfig）
    @Value("\${file.max-size}")
    private var maxFileSize: Long = 0
    
    @Value("\${file.allowed-types}")
    private lateinit var allowedTypes: String
    
    fun getMaxSize(): Long = maxFileSize
}
```

### 4.7 小结
完成本章后，你应该：

+ ✅ 理解配置文件的结构和作用
+ ✅ 掌握数据库、Redis、MinIO的配置
+ ✅ 了解如何读取配置值
+ ✅ 知道如何区分不同环境的配置

---

## 第五章：依赖管理（pom.xml）
### 5.1 Maven vs Gradle
作为Android开发者，你熟悉Gradle。Maven是另一个构建工具，概念类似：

| Gradle (Android) | Maven (Spring Boot) | 说明 |
| --- | --- | --- |
| build.gradle | pom.xml | 构建配置文件 |
| dependencies {} | <dependencies> | 依赖声明 |
| implementation | <dependency> | 添加依赖 |
| repositories {} | <repositories> | 仓库配置 |
| ./gradlew | ./mvnw | 构建命令 |


### 5.2 pom.xml 文件结构
```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" 
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 
         https://maven.apache.org/xsd/maven-4.0.0.xsd">
    
    <!-- Maven模型版本 -->
    <modelVersion>4.0.0</modelVersion>

    
    <!-- ============================================ -->
    <!-- 父项目继承（类似Android的父module） -->
    <!-- ============================================ -->
    <parent>
        <groupId>org.springframework.boot</groupId>

        <artifactId>spring-boot-starter-parent</artifactId>

        <version>3.5.6</version>

        <relativePath/> <!-- 从Maven仓库查找 -->
    </parent>

    
    <!-- ============================================ -->
    <!-- 项目基本信息 -->
    <!-- ============================================ -->
    <!-- 组织ID（类似Android的applicationId前缀） -->
    <groupId>com.zzy</groupId>

    
    <!-- 项目ID（类似Android的模块名） -->
    <artifactId>multifunctional-backend</artifactId>

    
    <!-- 版本号 -->
    <version>0.0.1-SNAPSHOT</version>

    
    <!-- 项目名称 -->
    <name>multifunctional-backend</name>

    
    <!-- 项目描述 -->
    <description>Demo project powered by Spring Boot</description>

    
    <!-- ============================================ -->
    <!-- 属性配置（类似Gradle的ext{}） -->
    <!-- ============================================ -->
    <properties>
        <!-- Java版本 -->
        <java.version>17</java.version>

        
        <!-- Kotlin版本 -->
        <kotlin.version>1.9.25</kotlin.version>

        
        <!-- 第三方库版本统一管理 -->
        <mybatis-plus.version>3.5.5</mybatis-plus.version>

        <minio.version>8.5.7</minio.version>

        <knife4j.version>4.4.0</knife4j.version>

        <hutool.version>5.8.24</hutool.version>

    </properties>

    
    <!-- ============================================ -->
    <!-- 依赖声明（类似Gradle的dependencies{}） -->
    <!-- ============================================ -->
    <dependencies>
        
        <!-- Spring Boot Web - 提供Web功能 -->
        <!-- 相当于添加了：Tomcat服务器 + Spring MVC + REST支持 -->
        <dependency>
            <groupId>org.springframework.boot</groupId>

            <artifactId>spring-boot-starter-web</artifactId>

        </dependency>

        
        <!-- Kotlin支持库 -->
        <!-- Jackson Kotlin模块：JSON序列化Kotlin类 -->
        <dependency>
            <groupId>com.fasterxml.jackson.module</groupId>

            <artifactId>jackson-module-kotlin</artifactId>

        </dependency>

        
        <!-- Kotlin反射库（必需） -->
        <dependency>
            <groupId>org.jetbrains.kotlin</groupId>

            <artifactId>kotlin-reflect</artifactId>

        </dependency>

        
        <!-- Kotlin标准库 -->
        <dependency>
            <groupId>org.jetbrains.kotlin</groupId>

            <artifactId>kotlin-stdlib</artifactId>

        </dependency>

        
        <!-- MyBatis-Plus：增强版MyBatis（类似Room） -->
        <!-- 提供：CRUD接口、分页插件、代码生成器等 -->
        <dependency>
            <groupId>com.baomidou</groupId>

            <artifactId>mybatis-plus-boot-starter</artifactId>

            <version>${mybatis-plus.version}</version>

        </dependency>

        
        <!-- 修复Spring 6.1+兼容性问题 -->
        <dependency>
            <groupId>org.mybatis</groupId>

            <artifactId>mybatis-spring</artifactId>

            <version>3.0.3</version>

        </dependency>

        <dependency>
            <groupId>org.mybatis</groupId>

            <artifactId>mybatis</artifactId>

            <version>3.5.15</version>

        </dependency>

        
        <!-- MySQL数据库驱动 -->
        <!-- scope=runtime：只在运行时需要，编译时不需要 -->
        <dependency>
            <groupId>com.mysql</groupId>

            <artifactId>mysql-connector-j</artifactId>

            <scope>runtime</scope>

        </dependency>

        
        <!-- Redis支持（类似Android的SharedPreferences） -->
        <!-- 提供：缓存、会话管理、分布式锁等 -->
        <dependency>
            <groupId>org.springframework.boot</groupId>

            <artifactId>spring-boot-starter-data-redis</artifactId>

        </dependency>

        
        <!-- MinIO客户端：对象存储（类似阿里云OSS） -->
        <!-- 用于存储文件、图片、视频等 -->
        <dependency>
            <groupId>io.minio</groupId>

            <artifactId>minio</artifactId>

            <version>${minio.version}</version>

        </dependency>

        
        <!-- Knife4j：API文档工具（Swagger增强版） -->
        <!-- 自动生成API文档，类似Postman的集合 -->
        <dependency>
            <groupId>com.github.xiaoymin</groupId>

            <artifactId>knife4j-openapi3-jakarta-spring-boot-starter</artifactId>

            <version>${knife4j.version}</version>

        </dependency>

        
        <!-- Commons IO：文件操作工具类 -->
        <dependency>
            <groupId>commons-io</groupId>

            <artifactId>commons-io</artifactId>

            <version>2.15.1</version>

        </dependency>

        
        <!-- Hutool：Java工具类库 -->
        <!-- 提供：加密、文件、日期等常用工具 -->
        <dependency>
            <groupId>cn.hutool</groupId>

            <artifactId>hutool-all</artifactId>

            <version>${hutool.version}</version>

        </dependency>

        
        <!-- Lombok：简化代码（可选） -->
        <!-- 自动生成getter/setter等（Kotlin不太需要） -->
        <dependency>
            <groupId>org.projectlombok</groupId>

            <artifactId>lombok</artifactId>

            <optional>true</optional>

        </dependency>

        
        <!-- 数据校验（类似Android的表单验证） -->
        <!-- 提供：@NotNull、@Size等注解 -->
        <dependency>
            <groupId>org.springframework.boot</groupId>

            <artifactId>spring-boot-starter-validation</artifactId>

        </dependency>

        
        <!-- 开发工具：热重载（类似Android的Instant Run） -->
        <dependency>
            <groupId>org.springframework.boot</groupId>

            <artifactId>spring-boot-devtools</artifactId>

            <scope>runtime</scope>

            <optional>true</optional>

        </dependency>

        
        <!-- 测试依赖 -->
        <dependency>
            <groupId>org.springframework.boot</groupId>

            <artifactId>spring-boot-starter-test</artifactId>

            <scope>test</scope>

        </dependency>

        <dependency>
            <groupId>org.jetbrains.kotlin</groupId>

            <artifactId>kotlin-test-junit5</artifactId>

            <scope>test</scope>

        </dependency>

    </dependencies>

    
    <!-- ============================================ -->
    <!-- 构建配置（类似Gradle的build{}） -->
    <!-- ============================================ -->
    <build>
        <!-- Kotlin源码目录 -->
        <sourceDirectory>${project.basedir}/src/main/kotlin</sourceDirectory>

        <testSourceDirectory>${project.basedir}/src/test/kotlin</testSourceDirectory>

        
        <plugins>
            <!-- Spring Boot Maven插件 -->
            <!-- 功能：打包可执行JAR、运行应用等 -->
            <plugin>
                <groupId>org.springframework.boot</groupId>

                <artifactId>spring-boot-maven-plugin</artifactId>

            </plugin>

            
            <!-- Kotlin编译插件 -->
            <plugin>
                <groupId>org.jetbrains.kotlin</groupId>

                <artifactId>kotlin-maven-plugin</artifactId>

                <configuration>
                    <args>
                        <!-- 严格的空安全检查 -->
                        <arg>-Xjsr305=strict</arg>

                    </args>

                    <compilerPlugins>
                        <!-- Spring插件：让Kotlin类支持Spring特性 -->
                        <plugin>spring</plugin>

                    </compilerPlugins>

                </configuration>

                <dependencies>
                    <!-- allopen插件：自动打开Spring类（Kotlin默认final） -->
                    <dependency>
                        <groupId>org.jetbrains.kotlin</groupId>

                        <artifactId>kotlin-maven-allopen</artifactId>

                        <version>${kotlin.version}</version>

                    </dependency>

                </dependencies>

            </plugin>

        </plugins>

    </build>

    
</project>

```

### 5.3 常用Maven命令
```bash
# 编译项目（类似./gradlew build）
mvn compile

# 打包项目（生成JAR文件）
mvn package

# 清理编译文件
mvn clean

# 清理并打包
mvn clean package

# 跳过测试打包
mvn package -DskipTests

# 运行Spring Boot应用
mvn spring-boot:run

# 安装到本地仓库
mvn install
```

### 5.4 依赖范围（Scope）
| Scope | 说明 | Android对应 |
| --- | --- | --- |
| compile | 编译和运行都需要（默认） | implementation |
| runtime | 只在运行时需要 | runtimeOnly |
| test | 只在测试时需要 | testImplementation |
| provided | 编译时需要，运行时由容器提供 | compileOnly |


### 5.5 版本管理最佳实践
```xml
<properties>
    <!-- 在properties中统一管理版本号 -->
    <mybatis-plus.version>3.5.5</mybatis-plus.version>

</properties>

<dependencies>
    <!-- 使用${变量名}引用版本号 -->
    <dependency>
        <groupId>com.baomidou</groupId>

        <artifactId>mybatis-plus-boot-starter</artifactId>

        <version>${mybatis-plus.version}</version>

    </dependency>

</dependencies>

```

### 5.6 添加新依赖
**方法1：手动添加**

1. 去 Maven中央仓库搜索：[https://mvnrepository.com/](https://mvnrepository.com/)
2. 复制依赖配置到pom.xml的`<dependencies>`中
3. 刷新Maven项目（IDEA右键项目 → Maven → Reload Project）

**方法2：使用IDEA**

1. 打开pom.xml
2. 在`<dependencies>`中按`Alt+Insert`
3. 选择"Dependency"
4. 搜索并选择依赖

### 5.7 Maven仓库配置（可选）
如果Maven下载慢，可以配置国内镜像：

创建/编辑文件：`~/.m2/settings.xml`

```xml
<settings>
    <mirrors>
        <!-- 阿里云Maven镜像 -->
        <mirror>
            <id>aliyun</id>

            <mirrorOf>central</mirrorOf>

            <name>Aliyun Maven</name>

            <url>https://maven.aliyun.com/repository/public</url>

        </mirror>

    </mirrors>

</settings>

```

### 5.8 小结
完成本章后，你应该：

+ ✅ 理解Maven和Gradle的异同
+ ✅ 掌握pom.xml的结构
+ ✅ 了解项目依赖的作用
+ ✅ 能够添加新的依赖

**下一章我们将开始编写数据访问层（Mapper）！**

---

## 第六章：Mapper层开发（数据访问层）
### 6.1 Mapper层的作用
Mapper层相当于Android Room的DAO（Data Access Object），负责与数据库交互。

| Android Room | Spring Boot MyBatis-Plus |
| --- | --- |
| @Dao接口 | @Mapper接口 |
| @Query注解 | @Select/@Update等注解 |
| LiveData<List<T>> | List<T> |


### 6.2 MyBatis-Plus的优势
MyBatis-Plus提供了很多开箱即用的功能，不需要写SQL就能完成基本CRUD：

```kotlin
// Room需要写查询
@Query("SELECT * FROM users WHERE id = :userId")
fun getUserById(userId: Long): User

// MyBatis-Plus自动提供
// 继承BaseMapper后，自动拥有以下方法：
// - selectById(id)
// - insert(entity)
// - updateById(entity)
// - deleteById(id)
// - selectList(wrapper)
// 等等...
```

### 6.3 创建FileMapper接口
创建文件：`src/main/kotlin/com/zzy/multifunctional_backend/mapper/FileMapper.kt`

```kotlin
package com.zzy.multifunctional_backend.mapper

import com.baomidou.mybatisplus.core.mapper.BaseMapper
import com.zzy.multifunctional_backend.entity.FileMetadata
import org.apache.ibatis.annotations.Mapper
import org.apache.ibatis.annotations.Param
import org.apache.ibatis.annotations.Select
import org.apache.ibatis.annotations.Update

/**
 * 文件Mapper接口
 * 
 * 相当于Android Room的 @Dao 接口
 * 继承BaseMapper后，自动拥有常用的CRUD方法
 * 
 * @author ZZY
 * @date 2025-10-09
 */
@Mapper  // 标记这是一个MyBatis的Mapper接口（类似Room的@Dao）
interface FileMapper : BaseMapper<FileMetadata> {
    
    // ============================================
    // BaseMapper已经提供了以下方法（无需编写）：
    // ============================================
    // - selectById(id: Long): FileMetadata?          // 根据ID查询
    // - insert(entity: FileMetadata): Int             // 插入记录
    // - updateById(entity: FileMetadata): Int         // 根据ID更新
    // - deleteById(id: Long): Int                     // 根据ID删除
    // - selectList(wrapper: Wrapper<FileMetadata>)    // 条件查询列表
    // - selectPage(page: Page, wrapper: Wrapper)      // 分页查询
    // 等等...共有17个常用方法！
    
    /**
     * 增加下载次数
     * 
     * 自定义SQL方法示例
     * @Update注解：执行更新操作（类似Room的@Query）
     * @Param注解：绑定参数（类似Room的方法参数）
     * 
     * @param id 文件ID
     * @return 影响的行数
     */
    @Update("UPDATE file_metadata SET download_count = download_count + 1 WHERE id = #{id}")
    fun increaseDownloadCount(@Param("id") id: Long): Int
    
    /**
     * 根据MD5查询文件
     * 
     * 用于实现秒传功能：
     * - 用户上传文件前，先计算MD5
     * - 查询数据库是否已存在相同MD5的文件
     * - 如果存在，直接返回已有文件信息（秒传）
     * 
     * @Select注解：执行查询操作
     * #{md5}：参数占位符（防SQL注入）
     * LIMIT 1：只返回一条记录
     * 
     * @param md5 文件MD5值
     * @return 文件元数据，不存在返回null
     */
    @Select("SELECT * FROM file_metadata WHERE file_md5 = #{md5} AND status = 1 LIMIT 1")
    fun selectByMd5(@Param("md5") md5: String): FileMetadata?
    
    // ============================================
    // 更多自定义查询示例（可选）
    // ============================================
    
    /**
     * 根据用户ID查询文件列表（示例）
     */
    // @Select("SELECT * FROM file_metadata WHERE user_id = #{userId} AND status = 1")
    // fun selectByUserId(@Param("userId") userId: Long): List<FileMetadata>
    
    /**
     * 统计文件总大小（示例）
     */
    // @Select("SELECT SUM(file_size) FROM file_metadata WHERE status = 1")
    // fun getTotalFileSize(): Long
    
    /**
     * 查询最近上传的文件（示例）
     */
    // @Select("SELECT * FROM file_metadata WHERE status = 1 ORDER BY upload_time DESC LIMIT #{limit}")
    // fun selectRecentFiles(@Param("limit") limit: Int): List<FileMetadata>
}
```

### 6.4 MyBatis注解详解
#### 6.4.1 @Mapper 注解
```kotlin
@Mapper  // 告诉Spring这是一个MyBatis的Mapper接口
interface FileMapper : BaseMapper<FileMetadata>
```

**作用：**

+ Spring启动时会扫描并创建这个接口的实现类
+ 类似Room的`@Dao`注解

#### 6.4.2 @Select / @Insert / @Update / @Delete
```kotlin
// 查询
@Select("SELECT * FROM file_metadata WHERE id = #{id}")
fun selectById(@Param("id") id: Long): FileMetadata?

// 插入
@Insert("INSERT INTO file_metadata(file_name, file_size) VALUES(#{fileName}, #{fileSize})")
fun insert(metadata: FileMetadata): Int

// 更新
@Update("UPDATE file_metadata SET file_name = #{fileName} WHERE id = #{id}")
fun updateFileName(@Param("id") id: Long, @Param("fileName") fileName: String): Int

// 删除
@Delete("DELETE FROM file_metadata WHERE id = #{id}")
fun deleteById(@Param("id") id: Long): Int
```

#### 6.4.3 参数绑定
```kotlin
// 单个参数
fun selectById(@Param("id") id: Long)  // SQL: WHERE id = #{id}

// 多个参数
fun update(@Param("id") id: Long, @Param("name") name: String)  
// SQL: UPDATE ... SET name = #{name} WHERE id = #{id}

// 对象参数（自动映射）
fun insert(metadata: FileMetadata)  
// SQL: INSERT INTO ... VALUES(#{fileName}, #{fileSize}, ...)
```

### 6.5 BaseMapper提供的方法
MyBatis-Plus的`BaseMapper<T>`接口提供了17个常用方法：

#### 6.5.1 插入操作
```kotlin
// 插入一条记录
insert(entity: T): Int

// 批量插入（需要额外配置）
insertBatchSomeColumn(entityList: Collection<T>): Int
```

#### 6.5.2 删除操作
```kotlin
// 根据ID删除
deleteById(id: Serializable): Int

// 根据条件删除
delete(wrapper: Wrapper<T>): Int

// 根据ID批量删除
deleteBatchIds(idList: Collection<out Serializable>): Int
```

#### 6.5.3 更新操作
```kotlin
// 根据ID更新
updateById(entity: T): Int

// 根据条件更新
update(entity: T, updateWrapper: Wrapper<T>): Int
```

#### 6.5.4 查询操作
```kotlin
// 根据ID查询
selectById(id: Serializable): T?

// 根据ID批量查询
selectBatchIds(idList: Collection<out Serializable>): List<T>

// 根据条件查询一条记录
selectOne(queryWrapper: Wrapper<T>): T?

// 根据条件查询总记录数
selectCount(queryWrapper: Wrapper<T>): Long

// 根据条件查询列表
selectList(queryWrapper: Wrapper<T>): List<T>

// 根据条件查询分页
selectPage(page: Page<T>, queryWrapper: Wrapper<T>): Page<T>
```

### 6.6 条件构造器（QueryWrapper）
类似Room的查询条件，MyBatis-Plus使用`QueryWrapper`构建查询：

```kotlin
// 在Service层使用（下一章会讲）
val queryWrapper = QueryWrapper<FileMetadata>()
    .eq("status", 1)                    // WHERE status = 1
    .like("file_name", "照片")           // AND file_name LIKE '%照片%'
    .ge("file_size", 1024)              // AND file_size >= 1024
    .orderByDesc("upload_time")         // ORDER BY upload_time DESC

// 执行查询
val files = fileMapper.selectList(queryWrapper)
```

**常用条件方法：**

| 方法 | 说明 | SQL示例 |
| --- | --- | --- |
| eq(column, value) | 等于 | column = value |
| ne(column, value) | 不等于 | column != value |
| gt(column, value) | 大于 | column > value |
| ge(column, value) | 大于等于 | column >= value |
| lt(column, value) | 小于 | column < value |
| le(column, value) | 小于等于 | column <= value |
| like(column, value) | 模糊查询 | column LIKE '%value%' |
| in(column, list) | IN查询 | column IN (v1, v2, v3) |
| between(column, v1, v2) | 区间查询 | column BETWEEN v1 AND v2 |
| isNull(column) | 为空 | column IS NULL |
| isNotNull(column) | 不为空 | column IS NOT NULL |
| orderByAsc(column) | 升序排序 | ORDER BY column ASC |
| orderByDesc(column) | 降序排序 | ORDER BY column DESC |


### 6.7 对比Room和MyBatis-Plus
#### Room写法（Android）
```kotlin
@Dao
interface FileDao {
    @Query("SELECT * FROM file_metadata WHERE id = :id")
    fun getById(id: Long): FileMetadata?
    
    @Insert
    fun insert(file: FileMetadata)
    
    @Update
    fun update(file: FileMetadata)
    
    @Delete
    fun delete(file: FileMetadata)
    
    @Query("SELECT * FROM file_metadata WHERE file_name LIKE '%' || :keyword || '%'")
    fun searchByKeyword(keyword: String): List<FileMetadata>
}
```

#### MyBatis-Plus写法（后端）
```kotlin
@Mapper
interface FileMapper : BaseMapper<FileMetadata> {
    // 继承BaseMapper后，以下方法自动拥有，无需编写：
    // - selectById(id)
    // - insert(entity)
    // - updateById(entity)
    // - deleteById(id)
    
    // 复杂查询可以自定义
    @Select("SELECT * FROM file_metadata WHERE file_name LIKE CONCAT('%', #{keyword}, '%')")
    fun searchByKeyword(@Param("keyword") keyword: String): List<FileMetadata>
}
```

**对比：**

+ Room：每个操作都需要显式声明
+ MyBatis-Plus：基础CRUD自动提供，更简洁

### 6.8 XML方式定义SQL（可选）
除了注解，也可以用XML文件定义SQL（适合复杂查询）：

创建：`src/main/resources/mapper/FileMapper.xml`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" 
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.zzy.multifunctional_backend.mapper.FileMapper">
    
    <!-- 复杂查询示例 -->
    <select id="searchFiles" resultType="com.zzy.multifunctional_backend.entity.FileMetadata">
        SELECT * FROM file_metadata
        WHERE status = 1
        <if test="keyword != null and keyword != ''">
            AND file_name LIKE CONCAT('%', #{keyword}, '%')
        </if>

        <if test="fileType != null">
            AND file_type = #{fileType}
        </if>

        ORDER BY upload_time DESC
    </select>

    
</mapper>

```

### 6.9 小结
完成本章后，你应该：

+ ✅ 理解Mapper层的作用
+ ✅ 掌握@Mapper注解的使用
+ ✅ 了解BaseMapper提供的方法
+ ✅ 会使用SQL注解定义查询
+ ✅ 理解MyBatis-Plus与Room的异同

**下一章我们将开发Service层（业务逻辑层）！**

---

## 第七章：Service层开发（业务逻辑层）
### 7.1 Service层的作用
Service层相当于Android MVVM架构中的**ViewModel + Repository**，负责处理业务逻辑。

| Android MVVM | Spring Boot | 说明 |
| --- | --- | --- |
| ViewModel | Service | 业务逻辑处理 |
| Repository | Service + Mapper | 数据仓库 |
| LiveData | 直接返回数据 | 数据观察（后端不需要） |


### 7.2 分层架构回顾
```plain
Controller（接口层）
    ↓ 调用
Service（业务逻辑层）← 我们现在这里
    ↓ 调用
Mapper（数据访问层）
    ↓ 访问
Database（数据库）
```

### 7.3 创建DTO类（数据传输对象）
在编写Service之前，先创建DTO类，用于API响应。

#### 7.3.1 统一响应格式
创建：`src/main/kotlin/com/zzy/multifunctional_backend/dto/ApiResponse.kt`

```kotlin
package com.zzy.multifunctional_backend.dto

/**
 * 统一响应结果类
 * 
 * 类似Android网络请求的Response包装类
 * 所有API接口都返回这种格式，前端统一处理
 * 
 * @author ZZY
 * @date 2025-10-09
 */
data class ApiResponse<T>(
    /** 
     * 状态码
     * 200 - 成功
     * 400 - 客户端错误
     * 500 - 服务器错误
     */
    val code: Int,
    
    /** 提示信息 */
    val message: String,
    
    /** 响应数据（泛型） */
    val data: T? = null,
    
    /** 时间戳 */
    val timestamp: Long = System.currentTimeMillis()
) {
    companion object {
        /**
         * 成功响应
         * 使用示例：ApiResponse.success(fileData, "上传成功")
         */
        fun <T> success(data: T? = null, message: String = "操作成功"): ApiResponse<T> {
            return ApiResponse(200, message, data)
        }
        
        /**
         * 失败响应
         * 使用示例：ApiResponse.error(500, "服务器错误")
         */
        fun <T> error(code: Int = 500, message: String = "操作失败", data: T? = null): ApiResponse<T> {
            return ApiResponse(code, message, data)
        }
        
        /** 参数错误 */
        fun <T> badRequest(message: String = "参数错误"): ApiResponse<T> {
            return ApiResponse(400, message, null)
        }
        
        /** 未授权 */
        fun <T> unauthorized(message: String = "未授权"): ApiResponse<T> {
            return ApiResponse(401, message, null)
        }
        
        /** 资源不存在 */
        fun <T> notFound(message: String = "资源不存在"): ApiResponse<T> {
            return ApiResponse(404, message, null)
        }
    }
}
```

**响应示例：**

```json
// 成功响应
{
  "code": 200,
  "message": "文件上传成功",
  "data": {
    "id": 1,
    "fileName": "photo.jpg",
    "fileSize": 102400
  },
  "timestamp": 1707123456789
}

// 失败响应
{
  "code": 400,
  "message": "文件类型不支持",
  "data": null,
  "timestamp": 1707123456789
}
```

#### 7.3.2 文件响应DTO
创建：`src/main/kotlin/com/zzy/multifunctional_backend/dto/FileResponse.kt`

```kotlin
package com.zzy.multifunctional_backend.dto

import com.zzy.multifunctional_backend.entity.FileMetadata
import java.time.LocalDateTime

/**
 * 文件响应DTO
 * 
 * 为什么要用DTO而不直接返回Entity？
 * 1. 隐藏敏感字段（如内部ID、状态码等）
 * 2. 格式化数据（如文件大小格式化）
 * 3. 添加额外字段（如文件URL）
 * 4. 解耦数据库结构和API结构
 * 
 * @author ZZY
 * @date 2025-10-09
 */
data class FileResponse(
    /** 文件ID */
    val id: Long?,
    
    /** 文件名 */
    val fileName: String?,
    
    /** 文件大小（字节） */
    val fileSize: Long?,
    
    /** 文件大小（格式化，如"1.5 MB"） */
    val fileSizeFormatted: String?,
    
    /** 文件类型 */
    val fileType: String?,
    
    /** 文件扩展名 */
    val fileExtension: String?,
    
    /** 下载次数 */
    val downloadCount: Int,
    
    /** 上传时间 */
    val uploadTime: LocalDateTime?,
    
    /** 上传用户ID */
    val userId: Long?
) {
    companion object {
        /**
         * 从Entity转换为DTO
         * 
         * 这是一个工厂方法，用于数据转换
         * 类似Android中的Mapper类
         */
        fun fromEntity(entity: FileMetadata): FileResponse {
            return FileResponse(
                id = entity.id,
                fileName = entity.fileName,
                fileSize = entity.fileSize,
                fileSizeFormatted = formatFileSize(entity.fileSize),
                fileType = entity.fileType,
                fileExtension = entity.fileExtension,
                downloadCount = entity.downloadCount,
                uploadTime = entity.uploadTime,
                userId = entity.userId
            )
        }
        
        /**
         * 格式化文件大小
         */
        private fun formatFileSize(size: Long?): String {
            if (size == null || size == 0L) return "0 B"
            
            return when {
                size < 1024 -> "$size B"
                size < 1024 * 1024 -> String.format("%.2f KB", size / 1024.0)
                size < 1024 * 1024 * 1024 -> String.format("%.2f MB", size / (1024.0 * 1024))
                else -> String.format("%.2f GB", size / (1024.0 * 1024 * 1024))
            }
        }
    }
}
```

#### 7.3.3 文件列表响应DTO
创建：`src/main/kotlin/com/zzy/multifunctional_backend/dto/FileListResponse.kt`

```kotlin
package com.zzy.multifunctional_backend.dto

/**
 * 文件列表响应DTO（分页）
 * 
 * 包含分页信息和文件列表
 * 类似Android的PagedList
 * 
 * @author ZZY
 * @date 2025-10-09
 */
data class FileListResponse(
    /** 总记录数 */
    val total: Long,
    
    /** 当前页码 */
    val page: Int,
    
    /** 每页数量 */
    val size: Int,
    
    /** 总页数 */
    val totalPages: Int = ((total + size - 1) / size).toInt(),
    
    /** 文件列表 */
    val files: List<FileResponse>
)
```

### 7.4 创建工具类
#### 7.4.1 文件工具类
创建：`src/main/kotlin/com/zzy/multifunctional_backend/util/FileUtil.kt`

```kotlin
package com.zzy.multifunctional_backend.util

import cn.hutool.core.io.FileUtil as HutoolFileUtil
import cn.hutool.core.util.IdUtil
import cn.hutool.crypto.digest.DigestUtil
import org.springframework.web.multipart.MultipartFile
import java.io.IOException

/**
 * 文件工具类
 * 
 * 使用Hutool工具库简化开发
 * Hutool相当于Android的AndroidX Utils
 * 
 * @author ZZY
 * @date 2025-10-09
 */
object FileUtil {
    
    /**
     * 获取文件扩展名
     * 
     * 示例：
     * "photo.jpg" -> "jpg"
     * "document.pdf" -> "pdf"
     */
    fun getFileExtension(filename: String): String {
        return HutoolFileUtil.extName(filename)
    }
    
    /**
     * 生成唯一文件名
     * 
     * 使用UUID避免文件名冲突
     * 原文件名：spring-boot.pdf
     * 生成后：a1b2c3d4e5f6.pdf
     */
    fun generateUniqueFileName(originalFilename: String): String {
        val extension = getFileExtension(originalFilename)
        val uuid = IdUtil.simpleUUID()  // 生成32位UUID（不带横线）
        return if (extension.isNotEmpty()) {
            "$uuid.$extension"
        } else {
            uuid
        }
    }
    
    /**
     * 计算文件MD5值
     * 
     * 用途：
     * 1. 实现秒传功能（相同文件不重复上传）
     * 2. 验证文件完整性
     * 
     * MD5是文件的"指纹"，内容相同则MD5相同
     */
    fun calculateMd5(file: MultipartFile): String {
        return try {
            DigestUtil.md5Hex(file.inputStream)
        } catch (e: IOException) {
            throw RuntimeException("计算文件MD5失败", e)
        }
    }
    
    /**
     * 验证文件类型
     * 
     * 检查文件扩展名是否在白名单中
     * 
     * @param filename 文件名
     * @param allowedTypes 允许的类型列表，如：["jpg", "png", "pdf"]
     * @return true-允许，false-不允许
     */
    fun validateFileType(filename: String, allowedTypes: List<String>): Boolean {
        val extension = getFileExtension(filename).lowercase()
        return allowedTypes.contains(extension)
    }
    
    /**
     * 验证文件大小
     * 
     * @param fileSize 文件大小（字节）
     * @param maxSize 最大允许大小（字节）
     * @return true-符合要求，false-超出限制
     */
    fun validateFileSize(fileSize: Long, maxSize: Long): Boolean {
        return fileSize <= maxSize
    }
    
    /**
     * 格式化文件大小
     * 
     * 1024 -> "1.00 KB"
     * 1048576 -> "1.00 MB"
     */
    fun formatFileSize(size: Long): String {
        return when {
            size < 1024 -> "$size B"
            size < 1024 * 1024 -> String.format("%.2f KB", size / 1024.0)
            size < 1024 * 1024 * 1024 -> String.format("%.2f MB", size / (1024.0 * 1024))
            else -> String.format("%.2f GB", size / (1024.0 * 1024 * 1024))
        }
    }
}
```

#### 7.4.2 Redis工具类
创建：`src/main/kotlin/com/zzy/multifunctional_backend/util/RedisUtil.kt`

```kotlin
package com.zzy.multifunctional_backend.util

import org.springframework.data.redis.core.RedisTemplate
import org.springframework.stereotype.Component
import java.util.concurrent.TimeUnit

/**
 * Redis工具类
 * 
 * Redis是一个键值对数据库，类似Android的SharedPreferences
 * 但功能更强大：
 * 1. 支持过期时间
 * 2. 支持分布式
 * 3. 支持复杂数据结构（列表、集合、哈希等）
 * 
 * @author ZZY
 * @date 2025-10-09
 */
@Component  // 标记为Spring组件，可以被注入
class RedisUtil(
    private val redisTemplate: RedisTemplate<String, Any>  // 依赖注入（类似Dagger/Hilt）
) {
    
    /**
     * 设置缓存
     * 
     * 使用示例：
     * redisUtil.set("file:1", fileData, 300, TimeUnit.SECONDS)
     * // 缓存文件数据，5分钟后过期
     * 
     * @param key 键
     * @param value 值（可以是任意对象，会自动序列化）
     * @param timeout 过期时间（0表示永不过期）
     * @param unit 时间单位
     */
    fun set(key: String, value: Any, timeout: Long = 0, unit: TimeUnit = TimeUnit.SECONDS) {
        if (timeout > 0) {
            redisTemplate.opsForValue().set(key, value, timeout, unit)
        } else {
            redisTemplate.opsForValue().set(key, value)
        }
    }
    
    /**
     * 获取缓存
     * 
     * 使用示例：
     * val fileData = redisUtil.get("file:1") as? FileResponse
     */
    fun get(key: String): Any? {
        return redisTemplate.opsForValue().get(key)
    }
    
    /**
     * 删除缓存
     */
    fun delete(key: String): Boolean {
        return redisTemplate.delete(key)
    }
    
    /**
     * 批量删除缓存
     */
    fun delete(keys: Collection<String>): Long {
        return redisTemplate.delete(keys) ?: 0
    }
    
    /**
     * 判断key是否存在
     */
    fun hasKey(key: String): Boolean {
        return redisTemplate.hasKey(key)
    }
    
    /**
     * 设置过期时间
     */
    fun expire(key: String, timeout: Long, unit: TimeUnit = TimeUnit.SECONDS): Boolean {
        return redisTemplate.expire(key, timeout, unit)
    }
    
    /**
     * 获取过期时间（秒）
     * -1：永不过期
     * -2：key不存在
     */
    fun getExpire(key: String): Long {
        return redisTemplate.getExpire(key) ?: -1
    }
    
    /**
     * 删除匹配的key
     * 
     * 使用示例：
     * redisUtil.deleteByPattern("file:list:*")
     * // 删除所有以"file:list:"开头的缓存
     */
    fun deleteByPattern(pattern: String) {
        val keys = redisTemplate.keys(pattern)
        if (keys.isNotEmpty()) {
            redisTemplate.delete(keys)
        }
    }
}
```

### 7.5 创建StorageService（文件存储服务）
创建：`src/main/kotlin/com/zzy/multifunctional_backend/service/StorageService.kt`

```kotlin
package com.zzy.multifunctional_backend.service

import io.minio.*
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Value
import org.springframework.stereotype.Service
import org.springframework.web.multipart.MultipartFile
import java.io.InputStream

/**
 * 文件存储服务 - MinIO
 * 
 * MinIO是一个开源的对象存储服务
 * 类似于：
 * - 阿里云OSS
 * - 腾讯云COS
 * - AWS S3
 * 
 * 为什么不直接存本地磁盘？
 * 1. 分布式：支持多台服务器
 * 2. 高可用：文件冗余备份
 * 3. 扩展性：容量可无限扩展
 * 4. 访问控制：权限管理更灵活
 * 
 * @author ZZY
 * @date 2025-10-09
 */
@Service  // 标记为Service层组件
class StorageService(
    private val minioClient: MinioClient  // 依赖注入MinIO客户端
) {
    
    private val logger = LoggerFactory.getLogger(StorageService::class.java)
    
    // 从配置文件读取bucket名称
    @Value("\${minio.bucket-name}")
    private lateinit var bucketName: String
    
    /**
     * 确保bucket存在，不存在则创建
     * 
     * Bucket相当于一个文件夹/存储桶
     * 类似Android的外部存储目录
     */
    fun ensureBucketExists() {
        try {
            // 检查bucket是否存在
            val exists = minioClient.bucketExists(
                BucketExistsArgs.builder().bucket(bucketName).build()
            )
            
            if (!exists) {
                // 创建bucket
                minioClient.makeBucket(
                    MakeBucketArgs.builder().bucket(bucketName).build()
                )
                logger.info("创建bucket成功: {}", bucketName)
            }
        } catch (e: Exception) {
            logger.error("检查/创建bucket失败", e)
            throw RuntimeException("存储服务初始化失败", e)
        }
    }
    
    /**
     * 上传文件到MinIO
     * 
     * @param file 上传的文件
     * @param storedName 存储文件名（UUID生成的唯一文件名）
     * @return 存储文件名
     */
    fun uploadFile(file: MultipartFile, storedName: String): String {
        try {
            // 确保bucket存在
            ensureBucketExists()
            
            // 上传文件
            // putObject方法参数说明：
            // - bucket：存储桶名称
            // - object：对象名称（文件名）
            // - stream：文件输入流
            // - size：文件大小
            // - partSize：分片大小（-1表示自动）
            // - contentType：MIME类型
            minioClient.putObject(
                PutObjectArgs.builder()
                    .bucket(bucketName)
                    .`object`(storedName)  // object是Kotlin关键字，需要用反引号
                    .stream(file.inputStream, file.size, -1)
                    .contentType(file.contentType)
                    .build()
            )
            
            logger.info("文件上传成功: {}", storedName)
            return storedName
        } catch (e: Exception) {
            logger.error("文件上传失败: {}", storedName, e)
            throw RuntimeException("文件上传失败", e)
        }
    }
    
    /**
     * 从MinIO下载文件
     * 
     * @param storedName 存储文件名
     * @return 文件输入流
     */
    fun downloadFile(storedName: String): InputStream {
        try {
            // 获取文件对象
            // 返回InputStream，可以直接写入HTTP响应
            return minioClient.getObject(
                GetObjectArgs.builder()
                    .bucket(bucketName)
                    .`object`(storedName)
                    .build()
            )
        } catch (e: Exception) {
            logger.error("文件下载失败: {}", storedName, e)
            throw RuntimeException("文件下载失败", e)
        }
    }
    
    /**
     * 从MinIO删除文件
     * 
     * @param storedName 存储文件名
     * @return 是否成功
     */
    fun deleteFile(storedName: String): Boolean {
        return try {
            minioClient.removeObject(
                RemoveObjectArgs.builder()
                    .bucket(bucketName)
                    .`object`(storedName)
                    .build()
            )
            logger.info("文件删除成功: {}", storedName)
            true
        } catch (e: Exception) {
            logger.error("文件删除失败: {}", storedName, e)
            false
        }
    }
    
    /**
     * 检查文件是否存在
     */
    fun fileExists(storedName: String): Boolean {
        return try {
            minioClient.statObject(
                StatObjectArgs.builder()
                    .bucket(bucketName)
                    .`object`(storedName)
                    .build()
            )
            true
        } catch (e: Exception) {
            false
        }
    }
    
    /**
     * 获取文件访问URL（临时URL）
     * 
     * @param storedName 存储文件名
     * @param expirySeconds 过期时间（秒），默认1小时
     * @return 文件访问URL
     */
    fun getFileUrl(storedName: String, expirySeconds: Int = 3600): String {
        return try {
            minioClient.getPresignedObjectUrl(
                GetPresignedObjectUrlArgs.builder()
                    .bucket(bucketName)
                    .`object`(storedName)
                    .expiry(expirySeconds)
                    .build()
            )
        } catch (e: Exception) {
            logger.error("获取文件URL失败: {}", storedName, e)
            throw RuntimeException("获取文件URL失败", e)
        }
    }
}
```

### 7.6 创建FileService（核心业务逻辑）
创建：`src/main/kotlin/com/zzy/multifunctional_backend/service/FileService.kt`

这是系统的核心Service，包含所有文件管理的业务逻辑：

```kotlin
package com.zzy.multifunctional_backend.service

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper
import com.baomidou.mybatisplus.extension.plugins.pagination.Page
import com.zzy.multifunctional_backend.dto.FileListResponse
import com.zzy.multifunctional_backend.dto.FileResponse
import com.zzy.multifunctional_backend.entity.FileMetadata
import com.zzy.multifunctional_backend.exception.FileNotFoundException
import com.zzy.multifunctional_backend.exception.FileSizeExceededException
import com.zzy.multifunctional_backend.exception.FileTypeNotSupportedException
import com.zzy.multifunctional_backend.exception.FileUploadException
import com.zzy.multifunctional_backend.mapper.FileMapper
import com.zzy.multifunctional_backend.util.FileUtil
import com.zzy.multifunctional_backend.util.RedisUtil
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Value
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional
import org.springframework.web.multipart.MultipartFile
import java.io.InputStream
import java.time.LocalDateTime
import java.util.concurrent.TimeUnit

/**
 * 文件服务
 * 
 * 核心业务逻辑层
 * 相当于Android MVVM中的ViewModel + Repository
 * 
 * @author ZZY
 * @date 2025-10-09
 */
@Service
class FileService(
    // 依赖注入（构造函数注入，类似Dagger/Hilt）
    private val fileMapper: FileMapper,           // 数据访问层
    private val storageService: StorageService,   // 文件存储服务
    private val redisUtil: RedisUtil              // Redis工具
) {
    
    private val logger = LoggerFactory.getLogger(FileService::class.java)
    
    // 从配置文件读取值
    @Value("\${file.max-size}")
    private var maxFileSize: Long = 104857600  // 100MB
    
    @Value("\${file.allowed-types}")
    private lateinit var allowedTypes: String
    
    companion object {
        // 缓存key常量
        private const val CACHE_KEY_FILE_LIST = "file:list:"
        private const val CACHE_KEY_FILE_INFO = "file:info:"
        private const val CACHE_EXPIRE_TIME = 300L  // 5分钟
    }
    
    /**
     * 上传文件
     * 
     * 业务流程：
     * 1. 验证文件（大小、类型）
     * 2. 计算MD5（用于秒传）
     * 3. 检查是否已存在相同文件
     * 4. 生成唯一文件名
     * 5. 上传到MinIO
     * 6. 保存元数据到数据库
     * 7. 清除缓存
     * 
     * @Transactional 事务注解：
     * - 如果方法抛出异常，会自动回滚数据库操作
     * - rollbackFor指定哪些异常触发回滚
     * 
     * @param file 上传的文件
     * @param userId 用户ID（可选）
     * @return 文件响应DTO
     */
    @Transactional(rollbackFor = [Exception::class])
    fun uploadFile(file: MultipartFile, userId: Long? = null): FileResponse {
        // 1. 验证文件
        validateFile(file)
        
        // 2. 计算MD5
        logger.info("计算文件MD5: {}", file.originalFilename)
        val md5 = FileUtil.calculateMd5(file)
        
        // 3. 检查是否存在相同文件（秒传功能）
        val existingFile = fileMapper.selectByMd5(md5)
        if (existingFile != null && existingFile.status == 1) {
            logger.info("文件已存在，执行秒传: {}", file.originalFilename)
            // 直接返回已存在的文件信息，不重复上传
            return FileResponse.fromEntity(existingFile)
        }
        
        // 4. 生成存储文件名
        val originalFilename = file.originalFilename ?: "unknown"
        val storedName = FileUtil.generateUniqueFileName(originalFilename)
        val fileExtension = FileUtil.getFileExtension(originalFilename)
        
        logger.info("开始上传文件: {} -> {}", originalFilename, storedName)
        
        // 5. 上传到MinIO
        try {
            storageService.uploadFile(file, storedName)
        } catch (e: Exception) {
            logger.error("文件上传到存储失败", e)
            throw FileUploadException("文件上传失败")
        }
        
        // 6. 保存元数据到数据库
        val fileMetadata = FileMetadata(
            fileName = originalFilename,
            storedName = storedName,
            fileSize = file.size,
            fileType = file.contentType ?: "application/octet-stream",
            fileExtension = fileExtension,
            filePath = storedName,
            fileMd5 = md5,
            uploadTime = LocalDateTime.now(),
            updateTime = LocalDateTime.now(),
            userId = userId
        )
        
        try {
            fileMapper.insert(fileMetadata)
            logger.info("文件元数据保存成功: {}", originalFilename)
        } catch (e: Exception) {
            // 如果数据库保存失败，删除已上传的文件（保证数据一致性）
            storageService.deleteFile(storedName)
            logger.error("文件元数据保存失败", e)
            throw FileUploadException("文件信息保存失败")
        }
        
        // 7. 清除缓存
        clearFileListCache()
        
        return FileResponse.fromEntity(fileMetadata)
    }
    
    /**
     * 获取文件列表（分页）
     * 
     * 支持：
     * - 分页查询
     * - 关键词搜索
     * - 排序
     * - Redis缓存
     * 
     * @param page 页码（从1开始）
     * @param size 每页数量
     * @param keyword 搜索关键词
     * @param sortBy 排序字段
     * @param order 排序方式（asc/desc）
     * @return 文件列表响应
     */
    fun getFileList(
        page: Int = 1,
        size: Int = 10,
        keyword: String? = null,
        sortBy: String = "uploadTime",
        order: String = "desc"
    ): FileListResponse {
        // 1. 尝试从缓存获取
        val cacheKey = "$CACHE_KEY_FILE_LIST$page:$size:$keyword:$sortBy:$order"
        val cached = redisUtil.get(cacheKey)
        if (cached != null) {
            logger.debug("从缓存获取文件列表")
            return cached as FileListResponse
        }
        
        // 2. 构建查询条件
        val queryWrapper = QueryWrapper<FileMetadata>()
            .eq("status", 1)  // 只查询未删除的文件
            .apply {
                // 如果有关键词，模糊查询文件名
                if (!keyword.isNullOrBlank()) {
                    like("file_name", keyword)
                }
            }
            .orderBy(true, order.equals("asc", ignoreCase = true), sortBy)
        
        // 3. 分页查询
        val pageObj = Page<FileMetadata>(page.toLong(), size.toLong())
        val pageResult = fileMapper.selectPage(pageObj, queryWrapper)
        
        // 4. 转换为响应对象
        val fileResponses = pageResult.records.map { FileResponse.fromEntity(it) }
        val response = FileListResponse(
            total = pageResult.total,
            page = page,
            size = size,
            files = fileResponses
        )
        
        // 5. 缓存结果
        redisUtil.set(cacheKey, response, CACHE_EXPIRE_TIME, TimeUnit.SECONDS)
        
        return response
    }
    
    /**
     * 获取文件详情
     * 
     * 带缓存查询
     */
    fun getFileInfo(id: Long): FileResponse {
        // 1. 尝试从缓存获取
        val cacheKey = "$CACHE_KEY_FILE_INFO$id"
        val cached = redisUtil.get(cacheKey)
        if (cached != null) {
            logger.debug("从缓存获取文件信息: {}", id)
            return cached as FileResponse
        }
        
        // 2. 从数据库查询
        val fileMetadata = fileMapper.selectById(id)
            ?: throw FileNotFoundException("文件不存在")
        
        if (fileMetadata.status == 0) {
            throw FileNotFoundException("文件已被删除")
        }
        
        // 3. 转换为响应对象
        val response = FileResponse.fromEntity(fileMetadata)
        
        // 4. 缓存结果（过期时间更长）
        redisUtil.set(cacheKey, response, CACHE_EXPIRE_TIME * 2, TimeUnit.SECONDS)
        
        return response
    }
    
    /**
     * 下载文件
     * 
     * @return Pair<文件流, 文件元数据>
     */
    fun downloadFile(id: Long): Pair<InputStream, FileMetadata> {
        // 1. 查询文件信息
        val fileMetadata = fileMapper.selectById(id)
            ?: throw FileNotFoundException("文件不存在")
        
        if (fileMetadata.status == 0) {
            throw FileNotFoundException("文件已被删除")
        }
        
        // 2. 从MinIO获取文件流
        val inputStream = storageService.downloadFile(fileMetadata.storedName ?: "")
        
        // 3. 增加下载次数
        fileMapper.increaseDownloadCount(id)
        
        // 4. 清除文件信息缓存（因为下载次数变了）
        redisUtil.delete("$CACHE_KEY_FILE_INFO$id")
        
        return Pair(inputStream, fileMetadata)
    }
    
    /**
     * 删除文件
     * 
     * 执行软删除：
     * 1. 更新数据库status=0
     * 2. 删除MinIO中的文件
     * 3. 清除缓存
     * 
     * @Transactional 保证事务性
     */
    @Transactional(rollbackFor = [Exception::class])
    fun deleteFile(id: Long): Boolean {
        val fileMetadata = fileMapper.selectById(id)
            ?: throw FileNotFoundException("文件不存在")
        
        // 1. 逻辑删除数据库记录
        fileMetadata.status = 0
        fileMetadata.updateTime = LocalDateTime.now()
        fileMapper.updateById(fileMetadata)
        
        // 2. 从MinIO删除文件
        storageService.deleteFile(fileMetadata.storedName ?: "")
        
        // 3. 清除缓存
        redisUtil.delete("$CACHE_KEY_FILE_INFO$id")
        clearFileListCache()
        
        logger.info("文件删除成功: {}", fileMetadata.fileName)
        return true
    }
    
    /**
     * 批量删除文件
     */
    @Transactional(rollbackFor = [Exception::class])
    fun batchDeleteFiles(ids: List<Long>): Int {
        var count = 0
        ids.forEach { id ->
            try {
                deleteFile(id)
                count++
            } catch (e: Exception) {
                logger.error("删除文件失败: id={}", id, e)
            }
        }
        return count
    }
    
    /**
     * 验证文件
     * 
     * 检查：
     * 1. 文件名不为空
     * 2. 文件大小不超限
     * 3. 文件类型在白名单中
     */
    private fun validateFile(file: MultipartFile) {
        val filename = file.originalFilename 
            ?: throw IllegalArgumentException("文件名不能为空")
        
        // 验证文件大小
        if (!FileUtil.validateFileSize(file.size, maxFileSize)) {
            throw FileSizeExceededException(
                "文件大小超过限制，最大支持 ${FileUtil.formatFileSize(maxFileSize)}"
            )
        }
        
        // 验证文件类型
        val allowedTypeList = allowedTypes.split(",").map { it.trim() }
        if (!FileUtil.validateFileType(filename, allowedTypeList)) {
            throw FileTypeNotSupportedException(
                "不支持的文件类型，仅支持: $allowedTypes"
            )
        }
    }
    
    /**
     * 清除文件列表缓存
     * 
     * 使用模式匹配删除所有相关缓存
     */
    private fun clearFileListCache() {
        redisUtil.deleteByPattern("$CACHE_KEY_FILE_LIST*")
    }
}
```

### 7.7 Service层关键概念总结
#### 7.7.1 依赖注入（DI）
```kotlin
@Service
class FileService(
    private val fileMapper: FileMapper,        // 构造函数注入
    private val storageService: StorageService,
    private val redisUtil: RedisUtil
) {
    // Spring会自动创建这些依赖并注入
}
```

**类似Android的Dagger/Hilt：**

```kotlin
// Android Hilt
@HiltViewModel
class FileViewModel @Inject constructor(
    private val repository: FileRepository
)
```

#### 7.7.2 事务管理（@Transactional）
```kotlin
@Transactional(rollbackFor = [Exception::class])
fun uploadFile(...) {
    // 如果这个方法中任何地方抛出异常
    // 所有数据库操作都会回滚
    fileMapper.insert(...)
    storageService.upload(...)
}
```

**保证数据一致性：**

+ 要么全部成功
+ 要么全部失败回滚

#### 7.7.3 缓存策略
```kotlin
// 1. 先查缓存
val cached = redisUtil.get(cacheKey)
if (cached != null) return cached

// 2. 缓存未命中，查数据库
val data = database.query()

// 3. 写入缓存
redisUtil.set(cacheKey, data, expireTime)
```

**缓存过期策略：**

+ 列表缓存：5分钟
+ 详情缓存：10分钟
+ 修改数据时：主动清除缓存

#### 7.7.4 异常处理
```kotlin
// 自定义业务异常
throw FileNotFoundException("文件不存在")
throw FileSizeExceededException("文件过大")

// 在GlobalExceptionHandler中统一捕获处理
```

### 7.8 小结
完成本章后，你应该：

+ ✅ 理解Service层的职责
+ ✅ 掌握依赖注入的使用
+ ✅ 了解事务管理
+ ✅ 学会使用Redis缓存
+ ✅ 理解DTO和Entity的区别
+ ✅ 掌握MinIO文件存储的使用

**下一章我们将开发Controller层，实现RESTful API接口！**

---

## 第八章：Controller层开发（接口层）
### 8.1 Controller层的作用
Controller层相当于Android中的**Activity/Fragment**，负责接收请求、处理参数、调用Service、返回响应。

| Android | Spring Boot | 说明 |
| --- | --- | --- |
| Activity | Controller | 接收用户操作 |
| onClick() | @GetMapping等 | 处理请求 |
| Intent参数 | @RequestParam/@PathVariable | 接收参数 |
| startActivity | HTTP响应 | 返回结果 |


### 8.2 RESTful API设计规范
**什么是REST？**  
REST（Representational State Transfer）是一种API设计风格：

| HTTP方法 | 用途 | 示例 | Android类比 |
| --- | --- | --- | --- |
| GET | 查询数据 | GET /api/files | 查询数据库 |
| POST | 创建数据 | POST /api/files | 插入数据 |
| PUT | 更新数据 | PUT /api/files/1 | 更新数据 |
| DELETE | 删除数据 | DELETE /api/files/1 | 删除数据 |


**URL设计规范：**

```plain
✅ 好的设计：
GET    /api/files          # 获取文件列表
GET    /api/files/1        # 获取文件详情
POST   /api/files          # 上传文件
DELETE /api/files/1        # 删除文件

❌ 不好的设计：
GET    /api/getFileList
GET    /api/getFile?id=1
POST   /api/uploadFile
POST   /api/deleteFile
```

### 8.3 创建FileController
创建：`src/main/kotlin/com/zzy/multifunctional_backend/controller/FileController.kt`

```kotlin
package com.zzy.multifunctional_backend.controller

import com.zzy.multifunctional_backend.dto.ApiResponse
import com.zzy.multifunctional_backend.dto.FileListResponse
import com.zzy.multifunctional_backend.dto.FileResponse
import com.zzy.multifunctional_backend.service.FileService
import io.swagger.v3.oas.annotations.Operation
import io.swagger.v3.oas.annotations.Parameter
import io.swagger.v3.oas.annotations.tags.Tag
import jakarta.servlet.http.HttpServletResponse
import org.apache.commons.io.IOUtils
import org.slf4j.LoggerFactory
import org.springframework.web.bind.annotation.*
import org.springframework.web.multipart.MultipartFile
import java.net.URLEncoder
import java.nio.charset.StandardCharsets

/**
 * 文件管理Controller
 * 
 * 相当于Android的Activity/Fragment
 * 负责接收HTTP请求，返回HTTP响应
 * 
 * @RestController = @Controller + @ResponseBody
 * - @Controller：标记为控制器
 * - @ResponseBody：返回值自动序列化为JSON
 * 
 * @RequestMapping：定义基础路径
 * 所有接口都会加上 /api/files 前缀
 * 
 * @author ZZY
 * @date 2025-10-09
 */
@Tag(name = "文件管理", description = "文件上传、下载、删除等API")  // Swagger文档标签
@RestController
@RequestMapping("/api/files")
class FileController(
    private val fileService: FileService  // 依赖注入Service层
) {
    
    private val logger = LoggerFactory.getLogger(FileController::class.java)
    
    /**
     * 上传文件接口
     * 
     * POST /api/files/upload
     * 
     * 请求示例（使用Postman或curl）：
     * curl -X POST http://localhost:8080/api/files/upload \
     *   -F "file=@/path/to/photo.jpg" \
     *   -F "userId=123"
     * 
     * @PostMapping：处理POST请求（类似Android的表单提交）
     * @RequestParam：接收请求参数
     *   - "file"：参数名（必须与前端一致）
     *   - required：是否必需
     * 
     * MultipartFile：Spring提供的文件上传类
     * 类似Android的Uri + InputStream
     */
    @Operation(summary = "上传文件", description = "支持单文件上传，最大100MB")
    @PostMapping("/upload")
    fun uploadFile(
        @Parameter(description = "上传的文件", required = true)
        @RequestParam("file") file: MultipartFile,
        
        @Parameter(description = "用户ID（可选）")
        @RequestParam("userId", required = false) userId: Long?
    ): ApiResponse<FileResponse> {
        // 记录日志
        logger.info("开始上传文件: {}, 大小: {}", file.originalFilename, file.size)
        
        // 调用Service层处理业务逻辑
        val fileResponse = fileService.uploadFile(file, userId)
        
        // 返回统一响应格式
        return ApiResponse.success(fileResponse, "文件上传成功")
    }
    
    /**
     * 获取文件列表接口（分页）
     * 
     * GET /api/files?page=1&size=10&keyword=照片
     * 
     * @GetMapping：处理GET请求（类似Android的数据查询）
     * @RequestParam：接收URL参数
     *   - defaultValue：默认值
     *   - required：是否必需
     * 
     * 请求示例：
     * http://localhost:8080/api/files?page=1&size=10
     * http://localhost:8080/api/files?page=1&size=10&keyword=照片
     * http://localhost:8080/api/files?sortBy=fileSize&order=desc
     */
    @Operation(summary = "获取文件列表", description = "分页查询文件列表，支持搜索和排序")
    @GetMapping
    fun getFileList(
        @Parameter(description = "页码，从1开始") 
        @RequestParam(defaultValue = "1") page: Int,
        
        @Parameter(description = "每页数量") 
        @RequestParam(defaultValue = "10") size: Int,
        
        @Parameter(description = "搜索关键词") 
        @RequestParam(required = false) keyword: String?,
        
        @Parameter(description = "排序字段") 
        @RequestParam(defaultValue = "uploadTime") sortBy: String,
        
        @Parameter(description = "排序方式：asc/desc") 
        @RequestParam(defaultValue = "desc") order: String
    ): ApiResponse<FileListResponse> {
        logger.debug("查询文件列表: page={}, size={}, keyword={}", page, size, keyword)
        
        val fileList = fileService.getFileList(page, size, keyword, sortBy, order)
        
        return ApiResponse.success(fileList, "查询成功")
    }
    
    /**
     * 获取文件详情接口
     * 
     * GET /api/files/1
     * 
     * @PathVariable：接收路径参数
     * 从URL路径中提取参数，如：/api/files/123 中的123
     * 
     * 类似Android的：
     * val id = intent.getLongExtra("file_id", 0)
     */
    @Operation(summary = "获取文件详情", description = "根据文件ID获取详细信息")
    @GetMapping("/{id}")
    fun getFileInfo(
        @Parameter(description = "文件ID", required = true) 
        @PathVariable id: Long
    ): ApiResponse<FileResponse> {
        logger.debug("查询文件详情: id={}", id)
        
        val fileInfo = fileService.getFileInfo(id)
        
        return ApiResponse.success(fileInfo, "查询成功")
    }
    
    /**
     * 下载文件接口
     * 
     * GET /api/files/1/download
     * 
     * 这个接口不返回JSON，而是返回文件流
     * 类似Android的文件下载
     * 
     * HttpServletResponse：HTTP响应对象
     * 可以设置响应头、写入文件流等
     */
    @Operation(summary = "下载文件", description = "根据文件ID下载文件")
    @GetMapping("/{id}/download")
    fun downloadFile(
        @Parameter(description = "文件ID", required = true) 
        @PathVariable id: Long,
        response: HttpServletResponse  // 注入响应对象
    ) {
        logger.info("开始下载文件: id={}", id)
        
        // 1. 从Service获取文件流和元数据
        val (inputStream, fileMetadata) = fileService.downloadFile(id)
        
        // 2. 设置响应头
        // Content-Type：告诉浏览器文件类型
        response.contentType = fileMetadata.fileType ?: "application/octet-stream"
        response.characterEncoding = "UTF-8"
        
        // 3. 设置文件名（支持中文）
        // URLEncoder：编码中文文件名，避免乱码
        val encodedFileName = URLEncoder.encode(fileMetadata.fileName, StandardCharsets.UTF_8)
            .replace("+", "%20")  // 空格编码为%20而不是+
        
        // Content-Disposition：告诉浏览器下载文件而不是打开
        // attachment：下载
        // inline：在浏览器中打开
        response.setHeader(
            "Content-Disposition",
            "attachment; filename=\"$encodedFileName\"; filename*=UTF-8''$encodedFileName"
        )
        
        // 4. 写入文件流到响应
        // 类似Android的文件拷贝：
        // inputStream.copyTo(outputStream)
        inputStream.use { input ->
            IOUtils.copy(input, response.outputStream)
            response.outputStream.flush()
        }
        
        logger.info("文件下载成功: {}", fileMetadata.fileName)
    }
    
    /**
     * 删除文件接口
     * 
     * DELETE /api/files/1
     * 
     * @DeleteMapping：处理DELETE请求
     */
    @Operation(summary = "删除文件", description = "根据文件ID删除文件（逻辑删除）")
    @DeleteMapping("/{id}")
    fun deleteFile(
        @Parameter(description = "文件ID", required = true) 
        @PathVariable id: Long
    ): ApiResponse<Boolean> {
        logger.info("删除文件: id={}", id)
        
        val result = fileService.deleteFile(id)
        
        return ApiResponse.success(result, "删除成功")
    }
    
    /**
     * 批量删除文件接口
     * 
     * DELETE /api/files/batch
     * Body: [1, 2, 3, 4, 5]
     * 
     * @RequestBody：接收请求体（JSON）
     * 前端发送JSON数组：[1, 2, 3]
     * Spring自动解析为List<Long>
     * 
     * 类似Android的：
     * Gson().fromJson(json, object : TypeToken<List<Long>>() {}.type)
     */
    @Operation(summary = "批量删除文件", description = "根据文件ID列表批量删除")
    @DeleteMapping("/batch")
    fun batchDeleteFiles(
        @Parameter(description = "文件ID列表", required = true)
        @RequestBody ids: List<Long>
    ): ApiResponse<Map<String, Any>> {
        logger.info("批量删除文件: ids={}", ids)
        
        val count = fileService.batchDeleteFiles(ids)
        
        // 返回删除统计信息
        val result = mapOf(
            "total" to ids.size,      // 总数
            "success" to count,        // 成功数
            "failed" to (ids.size - count)  // 失败数
        )
        
        return ApiResponse.success(result, "批量删除完成")
    }
    
    /**
     * 健康检查接口
     * 
     * GET /api/files/health
     * 
     * 用于：
     * 1. 检查服务是否正常运行
     * 2. 负载均衡器的健康检查
     * 3. 监控系统的心跳检测
     */
    @Operation(summary = "健康检查", description = "检查服务是否正常运行")
    @GetMapping("/health")
    fun health(): ApiResponse<Map<String, String>> {
        return ApiResponse.success(
            mapOf(
                "status" to "UP",
                "service" to "File Management Service",
                "timestamp" to System.currentTimeMillis().toString()
            ),
            "服务正常"
        )
    }
}
```

### 8.4 注解详解
#### 8.4.1 类级别注解
```kotlin
@RestController  // = @Controller + @ResponseBody
@RequestMapping("/api/files")  // 基础路径
class FileController { }
```

**@RestController vs @Controller：**

+ `@Controller`：返回视图（HTML页面）
+ `@RestController`：返回JSON数据（RESTful API）

#### 8.4.2 方法级别注解
```kotlin
@GetMapping("/list")          // GET请求
@PostMapping("/upload")       // POST请求
@PutMapping("/{id}")          // PUT请求
@DeleteMapping("/{id}")       // DELETE请求
@RequestMapping(method = [RequestMethod.GET])  // 通用写法
```

#### 8.4.3 参数注解
**1. @RequestParam（URL参数）**

```kotlin
// URL: /api/files?page=1&size=10
@GetMapping
fun list(
    @RequestParam page: Int,           // 必需参数
    @RequestParam(required = false) keyword: String?,  // 可选参数
    @RequestParam(defaultValue = "10") size: Int       // 带默认值
)
```

**2. @PathVariable（路径参数）**

```kotlin
// URL: /api/files/123
@GetMapping("/{id}")
fun getById(@PathVariable id: Long)

// URL: /api/files/123/download
@GetMapping("/{id}/download")
fun download(@PathVariable id: Long)
```

**3. @RequestBody（请求体）**

```kotlin
// POST /api/files
// Body: {"fileName": "test.pdf", "fileSize": 1024}
@PostMapping
fun create(@RequestBody request: FileRequest)
```

**4. @RequestHeader（请求头）**

```kotlin
@GetMapping
fun list(@RequestHeader("Authorization") token: String)
```

### 8.5 完整的请求流程
```plain
客户端发起请求
    ↓
DispatcherServlet（前端控制器）
    ↓
找到对应的Controller方法
    ↓
参数解析和验证
    ↓
调用Controller方法
    ↓
Controller调用Service
    ↓
Service调用Mapper
    ↓
Mapper操作数据库
    ↓
返回结果
    ↓
JSON序列化
    ↓
返回HTTP响应
```

### 8.6 测试API接口
#### 8.6.1 使用Postman测试
**1. 上传文件**

```plain
POST http://localhost:8080/api/files/upload
Body: form-data
  - key: file, type: File, value: 选择文件
  - key: userId, type: Text, value: 1
```

**2. 获取文件列表**

```plain
GET http://localhost:8080/api/files?page=1&size=10
```

**3. 获取文件详情**

```plain
GET http://localhost:8080/api/files/1
```

**4. 下载文件**

```plain
GET http://localhost:8080/api/files/1/download
```

**5. 删除文件**

```plain
DELETE http://localhost:8080/api/files/1
```

**6. 批量删除**

```plain
DELETE http://localhost:8080/api/files/batch
Body: raw JSON
[1, 2, 3]
```

#### 8.6.2 使用curl测试
```bash
# 上传文件
curl -X POST http://localhost:8080/api/files/upload \
  -F "file=@/path/to/file.jpg"

# 获取列表
curl http://localhost:8080/api/files?page=1&size=10

# 获取详情
curl http://localhost:8080/api/files/1

# 下载文件
curl http://localhost:8080/api/files/1/download -o downloaded-file.jpg

# 删除文件
curl -X DELETE http://localhost:8080/api/files/1

# 批量删除
curl -X DELETE http://localhost:8080/api/files/batch \
  -H "Content-Type: application/json" \
  -d "[1,2,3]"
```

#### 8.6.3 使用Knife4j测试（推荐）
启动项目后访问：[http://localhost:8080/doc.html](http://localhost:8080/doc.html)

Knife4j提供了美观的API文档和在线测试工具，无需安装Postman！

### 8.7 对比Android的网络请求
**Android Retrofit写法：**

```kotlin
interface FileApi {
    @GET("api/files")
    suspend fun getFileList(
        @Query("page") page: Int,
        @Query("size") size: Int
    ): Response<FileListResponse>
    
    @Multipart
    @POST("api/files/upload")
    suspend fun uploadFile(
        @Part file: MultipartBody.Part
    ): Response<FileResponse>
}
```

**Spring Boot Controller写法：**

```kotlin
@RestController
@RequestMapping("/api/files")
class FileController {
    @GetMapping
    fun getFileList(
        @RequestParam page: Int,
        @RequestParam size: Int
    ): ApiResponse<FileListResponse>
    
    @PostMapping("/upload")
    fun uploadFile(
        @RequestParam file: MultipartFile
    ): ApiResponse<FileResponse>
}
```

**对比：**

+ Android是客户端，定义接口来**调用**API
+ Spring Boot是服务端，定义接口来**提供**API
+ 注解很相似：`@GET` ↔ `@GetMapping`，`@Query` ↔ `@RequestParam`

### 8.8 小结
完成本章后，你应该：

+ ✅ 理解Controller层的作用
+ ✅ 掌握RESTful API设计规范
+ ✅ 了解各种请求方式（GET、POST、DELETE等）
+ ✅ 会使用@RequestParam、@PathVariable、@RequestBody
+ ✅ 能够处理文件上传和下载
+ ✅ 掌握API测试方法

**下一章我们将学习配置类的编写！**

---

## 第九章：配置类详解
### 9.1 配置类的作用
配置类用于创建和配置Bean（Spring管理的对象），类似Android的Dagger/Hilt模块。

### 9.2 MinIO配置类
创建：`src/main/kotlin/com/zzy/multifunctional_backend/config/MinioConfig.kt`

```kotlin
package com.zzy.multifunctional_backend.config

import io.minio.MinioClient
import org.springframework.beans.factory.annotation.Value
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration

/**
 * MinIO配置类
 * 
 * @Configuration：标记为配置类
 * @Bean：创建由Spring管理的对象
 * 
 * 类似Android Hilt的：
 * @Module
 * @InstallIn(SingletonComponent::class)
 * 
 * @author ZZY
 */
@Configuration
class MinioConfig {
    
    @Value("\${minio.endpoint}")
    private lateinit var endpoint: String
    
    @Value("\${minio.access-key}")
    private lateinit var accessKey: String
    
    @Value("\${minio.secret-key}")
    private lateinit var secretKey: String
    
    /**
     * 创建MinIO客户端Bean
     * 
     * @Bean：告诉Spring创建这个对象并管理
     * 其他类可以通过依赖注入使用
     */
    @Bean
    fun minioClient(): MinioClient {
        return MinioClient.builder()
            .endpoint(endpoint)
            .credentials(accessKey, secretKey)
            .build()
    }
}
```

### 9.3 Redis配置类
创建：`src/main/kotlin/com/zzy/multifunctional_backend/config/RedisConfig.kt`

```kotlin
package com.zzy.multifunctional_backend.config

import com.fasterxml.jackson.annotation.JsonAutoDetect
import com.fasterxml.jackson.annotation.PropertyAccessor
import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.databind.jsontype.impl.LaissezFaireSubTypeValidator
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.data.redis.connection.RedisConnectionFactory
import org.springframework.data.redis.core.RedisTemplate
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer
import org.springframework.data.redis.serializer.StringRedisSerializer

/**
 * Redis配置类
 * 配置Redis序列化方式
 */
@Configuration
class RedisConfig {
    
    @Bean
    fun redisTemplate(connectionFactory: RedisConnectionFactory): RedisTemplate<String, Any> {
        val template = RedisTemplate<String, Any>()
        template.connectionFactory = connectionFactory
        
        // 使用Jackson序列化
        val jackson2JsonRedisSerializer = Jackson2JsonRedisSerializer(ObjectMapper(), Any::class.java)
        
        val objectMapper = ObjectMapper()
        objectMapper.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY)
        objectMapper.activateDefaultTyping(
            LaissezFaireSubTypeValidator.instance,
            ObjectMapper.DefaultTyping.NON_FINAL
        )
        
        // 使用String序列化key
        val stringRedisSerializer = StringRedisSerializer()
        
        template.keySerializer = stringRedisSerializer
        template.hashKeySerializer = stringRedisSerializer
        template.valueSerializer = jackson2JsonRedisSerializer
        template.hashValueSerializer = jackson2JsonRedisSerializer
        
        template.afterPropertiesSet()
        return template
    }
}
```

### 9.4 MyBatis-Plus配置类
创建：`src/main/kotlin/com/zzy/multifunctional_backend/config/MyBatisPlusConfig.kt`

```kotlin
package com.zzy.multifunctional_backend.config

import com.baomidou.mybatisplus.annotation.DbType
import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor
import org.mybatis.spring.annotation.MapperScan
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration

/**
 * MyBatis-Plus配置类
 * 配置分页插件
 */
@Configuration
@MapperScan("com.zzy.multifunctional_backend.mapper")  // 扫描Mapper接口
class MyBatisPlusConfig {
    
    /**
     * 分页插件
     */
    @Bean
    fun mybatisPlusInterceptor(): MybatisPlusInterceptor {
        val interceptor = MybatisPlusInterceptor()
        interceptor.addInnerInterceptor(PaginationInnerInterceptor(DbType.MYSQL))
        return interceptor
    }
}
```

### 9.5 CORS跨域配置
创建：`src/main/kotlin/com/zzy/multifunctional_backend/config/CorsConfig.kt`

```kotlin
package com.zzy.multifunctional_backend.config

import org.springframework.context.annotation.Configuration
import org.springframework.web.servlet.config.annotation.CorsRegistry
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer

/**
 * 跨域配置
 * 
 * CORS（Cross-Origin Resource Sharing）跨域资源共享
 * 允许前端（如React、Vue）访问后端API
 */
@Configuration
class CorsConfig : WebMvcConfigurer {
    
    override fun addCorsMappings(registry: CorsRegistry) {
        registry.addMapping("/**")  // 所有接口都允许跨域
            .allowedOriginPatterns("*")  // 允许所有来源
            .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")  // 允许的方法
            .allowedHeaders("*")  // 允许所有请求头
            .allowCredentials(true)  // 允许携带凭证
            .maxAge(3600)  // 预检请求缓存时间（秒）
    }
}
```

---

## 第十章：全局异常处理
### 10.1 自定义异常类
创建：`src/main/kotlin/com/zzy/multifunctional_backend/exception/CustomException.kt`

```kotlin
package com.zzy.multifunctional_backend.exception

/**
 * 业务异常基类
 */
open class BusinessException(
    val code: Int = 500,
    override val message: String
) : RuntimeException(message)

/**
 * 文件上传异常
 */
class FileUploadException(message: String) : BusinessException(400, message)

/**
 * 文件未找到异常
 */
class FileNotFoundException(message: String) : BusinessException(404, message)

/**
 * 文件大小超限异常
 */
class FileSizeExceededException(message: String) : BusinessException(400, message)

/**
 * 文件类型不支持异常
 */
class FileTypeNotSupportedException(message: String) : BusinessException(400, message)

/**
 * 文件异常基类
 */
open class FileException(message: String, code: Int = 500) : BusinessException(code, message)
```

### 10.2 全局异常处理器
创建：`src/main/kotlin/com/zzy/multifunctional_backend/exception/GlobalExceptionHandler.kt`

```kotlin
package com.zzy.multifunctional_backend.exception

import com.zzy.multifunctional_backend.dto.ApiResponse
import org.slf4j.LoggerFactory
import org.springframework.web.bind.annotation.ExceptionHandler
import org.springframework.web.bind.annotation.RestControllerAdvice
import org.springframework.web.multipart.MaxUploadSizeExceededException
import org.springframework.web.servlet.resource.NoResourceFoundException

/**
 * 全局异常处理器
 * 
 * @RestControllerAdvice：全局Controller增强
 * 类似Android的全局异常捕获
 * 
 * 所有Controller抛出的异常都会被这里捕获
 * 统一处理并返回友好的错误信息
 */
@RestControllerAdvice
class GlobalExceptionHandler {
    
    private val logger = LoggerFactory.getLogger(GlobalExceptionHandler::class.java)
    
    /**
     * 业务异常处理
     */
    @ExceptionHandler(BusinessException::class)
    fun handleBusinessException(e: BusinessException): ApiResponse<Nothing> {
        logger.error("业务异常: {}", e.message)
        return ApiResponse.error(e.code, e.message)
    }
    
    /**
     * 文件大小超限异常
     */
    @ExceptionHandler(MaxUploadSizeExceededException::class)
    fun handleMaxUploadSizeExceededException(e: MaxUploadSizeExceededException): ApiResponse<Nothing> {
        logger.error("文件大小超限: {}", e.message)
        return ApiResponse.error(400, "文件大小超过限制，最大支持100MB")
    }
    
    /**
     * 资源未找到异常
     */
    @ExceptionHandler(NoResourceFoundException::class)
    fun handleNoResourceFoundException(e: NoResourceFoundException): ApiResponse<Nothing> {
        logger.error("资源未找到: {}", e.message)
        return ApiResponse.notFound("请求的资源不存在")
    }
    
    /**
     * 非法参数异常
     */
    @ExceptionHandler(IllegalArgumentException::class)
    fun handleIllegalArgumentException(e: IllegalArgumentException): ApiResponse<Nothing> {
        logger.error("参数异常: {}", e.message)
        return ApiResponse.badRequest(e.message ?: "参数错误")
    }
    
    /**
     * 通用异常处理
     */
    @ExceptionHandler(Exception::class)
    fun handleException(e: Exception): ApiResponse<Nothing> {
        logger.error("系统异常: ", e)
        return ApiResponse.error(500, "系统异常: ${e.message}")
    }
}
```

---

## 第十一章：启动与测试
### 11.1 启动步骤
#### 11.1.1 启动Docker服务
```bash
# 进入项目根目录
cd E:\SpringProjects\multifunctional-backend

# 启动MySQL、Redis、MinIO
docker-compose up -d

# 查看服务状态
docker-compose ps
```

#### 11.1.2 启动Spring Boot应用
**方法1：使用IDE**

+ 右键 `MultifunctionalBackendApplication.kt`
+ 点击 `Run 'MultifunctionalBackendApplication'`

**方法2：使用Maven命令**

```bash
mvn spring-boot:run
```

**方法3：打包后运行**

```bash
# 打包
mvn clean package -DskipTests

# 运行
java -jar target/multifunctional-backend-0.0.1-SNAPSHOT.jar
```

### 11.2 验证启动成功
#### 11.2.1 查看日志
启动成功会看到类似日志：

```plain
  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::                (v3.5.6)

Started MultifunctionalBackendApplication in 3.8 seconds
```

#### 11.2.2 访问API文档
打开浏览器访问：[http://localhost:8080/doc.html](http://localhost:8080/doc.html)

应该能看到Knife4j的API文档界面

#### 11.2.3 测试健康检查接口
```bash
curl http://localhost:8080/api/files/health
```

应该返回：

```json
{
  "code": 200,
  "message": "服务正常",
  "data": {
    "status": "UP",
    "service": "File Management Service",
    "timestamp": "1707123456789"
  },
  "timestamp": 1707123456789
}
```

### 11.3 完整功能测试
#### 11.3.1 上传文件测试
使用Knife4j或Postman上传文件：

1. 访问：[http://localhost:8080/doc.html](http://localhost:8080/doc.html)
2. 找到"文件管理"分组
3. 点击"上传文件"接口
4. 点击"调试"
5. 选择文件并点击"发送"

#### 11.3.2 查看文件列表
访问：[http://localhost:8080/api/files?page=1&size=10](http://localhost:8080/api/files?page=1&amp;size=10)

#### 11.3.3 下载文件
访问：[http://localhost:8080/api/files/1/download](http://localhost:8080/api/files/1/download)

### 11.4 常见问题排查
**问题1：端口被占用**

```plain
Port 8080 is already in use
```

解决：修改 `application.properties` 中的 `server.port=8081`

**问题2：MySQL连接失败**

```plain
Communications link failure
```

解决：检查Docker是否启动，检查数据库配置

**问题3：Redis连接失败**

```plain
Unable to connect to Redis
```

解决：确认Redis容器正常运行

**注意：** 云服务器部署相关内容已独立成单独文档《部署到阿里云Ubuntu服务器指南.md》，请查阅该文档获取详细的部署指南。

---

## 第十二章：总结与进阶
### 12.1 项目架构总结
```plain
multifunctional-backend/
├── controller/    # 接口层（处理HTTP请求）
├── service/       # 业务逻辑层
├── mapper/        # 数据访问层
├── entity/        # 实体类（数据库表映射）
├── dto/          # 数据传输对象（API响应）
├── config/        # 配置类
├── exception/     # 异常处理
└── util/         # 工具类
```

### 12.2 技术栈回顾
| 技术 | 用途 | Android类比 |
| --- | --- | --- |
| Spring Boot | 后端框架 | Android SDK |
| Kotlin | 开发语言 | Kotlin |
| MyBatis-Plus | ORM框架 | Room |
| MySQL | 数据库 | SQLite |
| Redis | 缓存 | SharedPreferences |
| MinIO | 对象存储 | 本地文件系统 |
| Docker | 容器化 | Android模拟器 |


### 12.3 核心概念对比
| 概念 | Android | Spring Boot |
| --- | --- | --- |
| 入口点 | MainActivity | main() |
| 界面 | Activity/Fragment | Controller |
| 业务逻辑 | ViewModel | Service |
| 数据访问 | Repository/DAO | Mapper |
| 依赖注入 | Dagger/Hilt | Spring DI |
| 网络请求 | Retrofit | @RestController |
| 异步处理 | Coroutines | @Async/线程池 |


### 12.4 学到的核心技能
✅ **基础技能**

+ Spring Boot项目创建与配置
+ Maven依赖管理
+ application.properties配置

✅ **数据库相关**

+ MySQL表设计
+ MyBatis-Plus使用
+ 分页查询
+ 事务管理

✅ **缓存相关**

+ Redis基本使用
+ 缓存策略设计
+ 缓存失效处理

✅ **文件处理**

+ 文件上传
+ 文件下载
+ MinIO对象存储
+ MD5秒传

✅ **API开发**

+ RESTful API设计
+ 参数接收与验证
+ 统一响应格式
+ 异常处理

✅ **容器化部署**

+ Docker基础
+ docker-compose使用
+ 服务编排

### 12.5 进阶学习方向
#### 12.5.1 安全性增强
```kotlin
// Spring Security（用户认证授权）
@EnableWebSecurity
class SecurityConfig

// JWT Token
fun generateToken(userId: Long): String

// 权限控制
@PreAuthorize("hasRole('ADMIN')")
fun adminOnly()
```

#### 12.5.2 性能优化
```kotlin
// 异步处理
@Async
fun sendEmail()

// 定时任务
@Scheduled(cron = "0 0 2 * * ?")
fun cleanupOldFiles()

// 消息队列（RabbitMQ/Kafka）
@RabbitListener(queues = ["file-queue"])
fun processFile(message: String)
```

#### 12.5.3 监控与日志
```kotlin
// Actuator（健康检查）
management.endpoints.web.exposure.include=*

// ELK日志系统（Elasticsearch + Logstash + Kibana）
// Prometheus + Grafana（监控）
```

#### 12.5.4 微服务架构
```kotlin
// Spring Cloud（微服务框架）
// - Nacos（服务注册与发现）
// - Gateway（API网关）
// - OpenFeign（服务调用）
// - Sentinel（熔断降级）
```

### 12.6 推荐资源
**官方文档：**

+ Spring Boot：[https://spring.io/projects/spring-boot](https://spring.io/projects/spring-boot)
+ MyBatis-Plus：[https://baomidou.com/](https://baomidou.com/)
+ MinIO：[https://min.io/docs/minio/linux/index.html](https://min.io/docs/minio/linux/index.html)

**学习网站：**

+ 菜鸟教程：[https://www.runoob.com/](https://www.runoob.com/)
+ B站：搜索"Spring Boot教程"

**实战项目：**

+ 继续完善本项目：添加用户系统、权限管理
+ 开发电商系统、博客系统等

### 12.7 总结
🎉 **恭喜你完成了这个完整的Spring Boot后端教程！**

你现在已经掌握了：

1. 从零创建Spring Boot项目
2. 使用Docker搭建开发环境
3. 设计数据库和编写实体类
4. 开发完整的文件管理系统
5. 实现RESTful API接口
6. 处理异常和缓存
7. 测试和部署应用

作为Android开发者，你会发现后端开发和Android开发有很多相似之处。继续练习，你会越来越熟练！

**下一步建议：**

1. 为本项目添加用户登录功能
2. 实现文件分享功能
3. 添加文件预览功能
4. 学习Spring Security
5. 尝试部署到云服务器

**祝你在后端开发的道路上越走越远！** 🚀

---

## 附录
### A. 常用命令速查
**Maven命令：**

```bash
mvn clean                # 清理
mvn compile              # 编译
mvn package             # 打包
mvn spring-boot:run     # 运行
```

**Docker命令：**

```bash
docker-compose up -d          # 启动服务
docker-compose down           # 停止服务
docker-compose ps            # 查看状态
docker-compose logs -f       # 查看日志
```

**Git命令：**

```bash
git add .                    # 添加所有更改
git commit -m "提交说明"      # 提交
git push                     # 推送到远程
```

### B. 快捷键
**IntelliJ IDEA：**

+ `Ctrl + Alt + L`：格式化代码
+ `Ctrl + Shift + F10`：运行
+ `Ctrl + /`：注释/取消注释
+ `Alt + Enter`：快速修复
+ `Ctrl + B`：跳转到定义

### C. 项目完整目录结构
```plain
multifunctional-backend/
├── src/
│   ├── main/
│   │   ├── kotlin/
│   │   │   └── com/zzy/multifunctional_backend/
│   │   │       ├── config/              # 配置类
│   │   │       │   ├── CorsConfig.kt
│   │   │       │   ├── MinioConfig.kt
│   │   │       │   ├── MyBatisPlusConfig.kt
│   │   │       │   └── RedisConfig.kt
│   │   │       ├── controller/          # 控制器
│   │   │       │   └── FileController.kt
│   │   │       ├── dto/                 # 数据传输对象
│   │   │       │   ├── ApiResponse.kt
│   │   │       │   ├── FileListResponse.kt
│   │   │       │   └── FileResponse.kt
│   │   │       ├── entity/              # 实体类
│   │   │       │   └── FileMetadata.kt
│   │   │       ├── exception/           # 异常处理
│   │   │       │   ├── CustomException.kt
│   │   │       │   └── GlobalExceptionHandler.kt
│   │   │       ├── mapper/              # Mapper接口
│   │   │       │   └── FileMapper.kt
│   │   │       ├── service/             # 服务层
│   │   │       │   ├── FileService.kt
│   │   │       │   └── StorageService.kt
│   │   │       ├── util/                # 工具类
│   │   │       │   ├── FileUtil.kt
│   │   │       │   └── RedisUtil.kt
│   │   │       └── MultifunctionalBackendApplication.kt
│   │   └── resources/
│   │       ├── application.properties    # 配置文件
│   │       └── sql/
│   │           └── schema.sql           # 数据库脚本
│   └── test/
├── pom.xml                              # Maven配置
└── docker-compose.yml                   # Docker配置
```

**教程结束** 📚

