# Spring Boot 零基础入门（Kotlin + Maven + Docker）
## —— 企业实战导向版（适配中国开发环境）

---

## 📚 目录

### 基础篇
- [第1章：前言与学习目标](#第1章前言与学习目标)
- [第2章：环境准备与项目创建](#第2章环境准备与项目创建)
- [第3章：第一个 Spring Boot 应用](#第3章第一个-spring-boot-应用)
- [第4章：Spring Boot 核心概念与工作原理](#第4章spring-boot-核心概念与工作原理)
- [第5章：Spring Boot 常用注解与语法精讲（企业必备）](#第5章spring-boot-常用注解与语法精讲企业必备)

### 实战篇
- [第6章：Web 层：RESTful API 实战](#第6章web-层restful-api-实战)
- [第7章：数据访问层：MyBatis + 数据库实战](#第7章数据访问层mybatis--数据库实战)
- [第8章：配置文件与多环境管理](#第8章配置文件与多环境管理)
- [第9章：缓存系统：Redis 集成](#第9章缓存系统redis-集成)
- [第10章：项目通用功能模块（企业项目常见）](#第10章项目通用功能模块企业项目常见)

### 进阶篇
- [第11章：登录与用户模块（实战）](#第11章登录与用户模块实战)
- [第12章：异步与任务调度](#第12章异步与任务调度)
- [第13章：Docker 打包与部署上线](#第13章docker-打包与部署上线)
- [第14章：测试与调试（Kotlin 实战）](#第14章测试与调试kotlin-实战)
- [第15章：项目打磨与面试准备](#第15章项目打磨与面试准备)

### 附录
- [第16章：附录](#第16章附录)
  - [pom.xml 常用依赖合集](#161-pomxml-常用依赖合集)
  - [常用 Maven 命令速查表](#162-常用-maven-命令速查表)
  - [常用 Docker 命令速查表](#163-常用-docker-命令速查表)
  - [常用 Redis 命令速查表](#164-常用-redis-命令速查表)
  - [项目结构示例](#165-项目结构示例)
  - [完整配置文件示例](#166-完整配置文件示例)
  - [学习资源推荐](#167-学习资源推荐)
  - [总结与下一步](#168-总结与下一步)

---

# 第1章：前言与学习目标

## 1.1 本文档适合人群

本教程专为以下群体精心设计：

### 1.1.1 安卓开发者
如果你已经熟悉 Kotlin 语言，想要拓展后端开发技能，那么本教程将帮助你快速将 Kotlin 知识迁移到后端开发领域。你会发现，Kotlin 在后端开发中同样强大且优雅。

### 1.1.2 后端初学者
如果你对后端开发感兴趣但缺乏经验，不用担心！本教程从零开始，逐步引导你掌握企业级后端开发的核心技能。我们会详细讲解每一个概念和代码片段，确保你真正理解而不是死记硬背。

### 1.1.3 想转企业全栈方向的开发者
在当今的技术市场中，全栈开发者越来越受欢迎。无论你之前是前端开发者还是其他技术背景，本教程都将帮助你掌握现代企业后端开发的完整技术栈，为成为全栈工程师铺平道路。

## 1.2 学完后你将能做什么

通过本教程的系统学习，你将获得以下核心能力：

### 1.2.1 使用 Kotlin 开发企业级 Spring Boot 后端
- ✅ 掌握 Kotlin 语言在后端开发中的最佳实践
- ✅ 理解 Spring Boot 的核心概念和工作原理
- ✅ 能够独立搭建和开发企业级后端项目
- ✅ 编写简洁、优雅、可维护的 Kotlin 代码

### 1.2.2 熟练操作 Maven 构建与 Docker 容器部署
- ✅ 理解 Maven 项目管理和依赖管理机制
- ✅ 掌握 Maven 常用命令和生命周期
- ✅ 能够编写 Dockerfile 进行应用容器化
- ✅ 使用 Docker Compose 编排多容器应用
- ✅ 将应用部署到云服务器（阿里云、腾讯云等）

### 1.2.3 掌握 MyBatis、Redis、Swagger3、全局异常处理等常见企业技术栈
- ✅ 使用 MyBatis 进行数据库操作（CRUD、分页、条件查询）
- ✅ 集成 Redis 实现缓存、会话管理
- ✅ 使用 Swagger3/Knife4j 自动生成接口文档
- ✅ 实现企业级全局异常处理机制
- ✅ 掌握日志系统配置和使用
- ✅ 理解 JWT Token 认证机制

### 1.2.4 独立完成一个可部署上线的 RESTful 后端项目
- ✅ 从零开始规划和设计后端项目架构
- ✅ 实现完整的用户管理、登录认证等核心功能
- ✅ 编写规范的 RESTful API
- ✅ 进行单元测试和集成测试
- ✅ 将项目打包并部署到生产环境
- ✅ 准备一份可以写进简历的项目经验

## 1.3 开发环境说明

为了确保学习过程顺利，我们推荐使用以下开发环境：

### 1.3.1 操作系统
- **Windows 10/11**（本教程主要适配 Windows 环境）
- 也支持 macOS 和 Linux，命令可能略有差异

### 1.3.2 必需软件

#### JDK（Java Development Kit）
- **版本**：JDK 17 或更高版本（推荐使用 JDK 17 LTS）
- **下载地址**：
  - Oracle JDK：https://www.oracle.com/java/technologies/downloads/
  - OpenJDK：https://adoptium.net/
- **说明**：虽然我们使用 Kotlin 开发，但 Kotlin 运行在 JVM 上，所以需要安装 JDK

#### Maven
- **版本**：3.6.0 或更高版本
- **下载地址**：https://maven.apache.org/download.cgi
- **说明**：Maven 是 Java/Kotlin 项目的构建和依赖管理工具

#### Docker Desktop
- **版本**：最新稳定版
- **下载地址**：https://www.docker.com/products/docker-desktop
- **系统要求**：需要启用 WSL2（Windows Subsystem for Linux 2）
- **说明**：用于容器化部署，是现代应用部署的标准方式

### 1.3.3 集成开发环境（IDE）

#### Cursor IDE（推荐）
- **下载地址**：https://cursor.sh/
- **优势**：
  - 基于 VSCode，界面友好
  - 内置 AI 助手，帮助理解代码和解决问题
  - 对 Kotlin、Spring Boot、Docker 支持良好
- **推荐插件**：
  - Kotlin Language（Kotlin 语言支持）
  - Spring Boot Extension Pack（Spring Boot 工具集）
  - Docker（Docker 支持）
  - Database Client（数据库客户端）

#### IntelliJ IDEA（备选）
- **版本**：Community Edition（免费）或 Ultimate Edition（付费，功能更全）
- **下载地址**：https://www.jetbrains.com/idea/download/
- **说明**：JetBrains 出品，对 Kotlin 和 Spring Boot 支持最好

### 1.3.4 可选但推荐的工具

#### 数据库工具
- **Navicat**：功能强大的数据库管理工具（付费）
- **DBeaver**：开源免费的数据库管理工具
- **MySQL Workbench**：MySQL 官方工具

#### API 测试工具
- **Postman**：最流行的 API 测试工具
- **Apifox**：国产 API 工具，集成了 Postman、Swagger、Mock 等功能
- **Insomnia**：简洁的 API 测试工具

#### 终端工具（Windows）
- **Windows Terminal**：微软官方的现代化终端（推荐）
- **Git Bash**：随 Git 安装，提供类 Unix 命令环境
- **PowerShell**：Windows 自带，功能强大

### 1.3.5 环境验证

在开始学习之前，请确保以下命令都能正常执行：

```bash
# 验证 JDK 安装
java -version
# 应该输出类似：java version "17.0.x" 或更高

# 验证 Maven 安装
mvn -v
# 应该输出 Maven 版本信息

# 验证 Docker 安装
docker --version
# 应该输出 Docker 版本信息

docker-compose --version
# 应该输出 Docker Compose 版本信息
```

如果以上命令都能正常执行，恭喜你！环境准备完毕，可以开始学习之旅了。

## 1.4 学习建议

### 1.4.1 循序渐进
不要跳章学习，每一章都是后续内容的基础。即使某些内容看起来简单，也建议快速过一遍，确保没有遗漏。

### 1.4.2 动手实践
编程是实践性很强的技能，看懂不等于会用。每个示例代码都建议自己敲一遍，而不是复制粘贴。遇到问题时，尝试自己调试和解决。

### 1.4.3 理解而非记忆
不要死记硬背代码和配置，要理解背后的原理。本教程会详细讲解每个概念的作用和原理，帮助你建立系统性的知识体系。

### 1.4.4 做笔记和总结
建议为每一章做笔记，记录重点内容和自己的理解。学完一个大章节后，尝试用自己的话总结所学内容。

### 1.4.5 善用搜索引擎
遇到问题时，学会使用搜索引擎（百度、Google、必应等）和技术社区（CSDN、掘金、Stack Overflow 等）寻找答案。这是程序员的必备技能。

### 1.4.6 参考官方文档
- Spring Boot 官方文档：https://spring.io/projects/spring-boot
- Kotlin 官方文档：https://kotlinlang.org/docs/home.html
- MyBatis 官方文档：https://mybatis.org/mybatis-3/zh/index.html

## 1.5 本教程的组织结构

本教程共分为 16 章，内容组织如下：

- **第 1-2 章**：环境准备和项目创建，帮助你搭建开发环境
- **第 3-5 章**：Spring Boot 基础，理解核心概念和常用注解
- **第 6-9 章**：企业开发核心技术（Web、数据库、配置、缓存）
- **第 10-12 章**：企业项目通用功能（异常处理、登录认证、异步任务）
- **第 13-14 章**：部署和测试，让项目真正上线
- **第 15-16 章**：项目打磨和面试准备，帮助你将学习成果转化为职业竞争力

## 1.6 准备好了吗？

如果你已经准备好开发环境，并且对即将开始的学习之旅充满期待，那就让我们从下一章开始，正式进入 Spring Boot 的世界吧！

记住：每一位优秀的后端工程师都是从零开始的。保持耐心，保持好奇心，享受学习的过程。让我们开始吧！

---

# 第2章：环境准备与项目创建

## 2.1 安装 JDK（17+）与 Maven

### 2.1.1 安装 JDK 17

#### 什么是 JDK？
JDK（Java Development Kit）是 Java 开发工具包，包含了编译器、运行时环境和各种工具。虽然我们使用 Kotlin 开发，但 Kotlin 代码最终会编译成 Java 字节码在 JVM（Java Virtual Machine）上运行，所以必须安装 JDK。

#### 下载和安装步骤（Windows）

**步骤 1：下载 JDK**
1. 访问 https://adoptium.net/（推荐使用 Adoptium 的 Eclipse Temurin）
2. 选择 JDK 17（LTS 长期支持版本）
3. 选择操作系统 Windows 和架构 x64
4. 下载 `.msi` 安装包

**步骤 2：安装 JDK**
1. 双击下载的 `.msi` 文件
2. 点击 "Next" 进行安装
3. 选择安装路径（建议使用默认路径，例如：`C:\Program Files\Eclipse Adoptium\jdk-17.0.x`）
4. 勾选 "Set JAVA_HOME environment variable"（设置 JAVA_HOME 环境变量）
5. 勾选 "Add to PATH"（添加到系统路径）
6. 完成安装

**步骤 3：验证安装**
打开命令提示符（Win + R，输入 `cmd`），执行以下命令：

```bash
java -version
```

应该看到类似输出：
```
openjdk version "17.0.9" 2023-10-17
OpenJDK Runtime Environment Temurin-17.0.9+9 (build 17.0.9+9)
OpenJDK 64-Bit Server VM Temurin-17.0.9+9 (build 17.0.9+9, mixed mode, sharing)
```

再执行：
```bash
javac -version
```

应该看到：
```
javac 17.0.9
```

如果看到版本信息，说明 JDK 安装成功！

#### 手动配置环境变量（如果安装时未自动配置）

如果 `java -version` 命令无法执行，需要手动配置环境变量：

**步骤 1：找到 JDK 安装路径**
例如：`C:\Program Files\Eclipse Adoptium\jdk-17.0.9+9`

**步骤 2：配置 JAVA_HOME**
1. 右键 "此电脑" → "属性" → "高级系统设置" → "环境变量"
2. 在 "系统变量" 区域点击 "新建"
3. 变量名：`JAVA_HOME`
4. 变量值：JDK 安装路径（如上面的路径）
5. 点击 "确定"

**步骤 3：配置 PATH**
1. 在 "系统变量" 中找到 `Path` 变量，双击编辑
2. 点击 "新建"，添加：`%JAVA_HOME%\bin`
3. 点击 "确定"

**步骤 4：重新打开命令提示符，验证配置**
```bash
java -version
echo %JAVA_HOME%
```

### 2.1.2 安装 Maven

#### 什么是 Maven？
Maven 是一个项目管理和构建工具，主要用于：
- **依赖管理**：自动下载和管理项目所需的第三方库
- **项目构建**：编译、测试、打包项目
- **项目规范**：统一项目结构和配置

#### 下载和安装步骤（Windows）

**步骤 1：下载 Maven**
1. 访问 https://maven.apache.org/download.cgi
2. 下载 Binary zip archive（例如：`apache-maven-3.9.6-bin.zip`）

**步骤 2：解压安装**
1. 将下载的 zip 文件解压到一个目录，例如：`C:\Program Files\Apache\Maven`
2. 确保解压后的目录结构为：`C:\Program Files\Apache\Maven\apache-maven-3.9.6\`

**步骤 3：配置环境变量**

配置 MAVEN_HOME：
1. 右键 "此电脑" → "属性" → "高级系统设置" → "环境变量"
2. 在 "系统变量" 区域点击 "新建"
3. 变量名：`MAVEN_HOME`
4. 变量值：Maven 解压路径（如：`C:\Program Files\Apache\Maven\apache-maven-3.9.6`）
5. 点击 "确定"

配置 PATH：
1. 在 "系统变量" 中找到 `Path` 变量，双击编辑
2. 点击 "新建"，添加：`%MAVEN_HOME%\bin`
3. 点击 "确定"

**步骤 4：验证安装**
重新打开命令提示符，执行：

```bash
mvn -v
```

应该看到类似输出：
```
Apache Maven 3.9.6
Maven home: C:\Program Files\Apache\Maven\apache-maven-3.9.6
Java version: 17.0.9, vendor: Eclipse Adoptium
Java home: C:\Program Files\Eclipse Adoptium\jdk-17.0.9+9
Default locale: zh_CN, platform encoding: GBK
OS name: "windows 10", version: "10.0", arch: "amd64", family: "windows"
```

如果看到以上信息，说明 Maven 安装成功！

### 2.1.3 配置 Maven 镜像（加速依赖下载）

由于 Maven 中央仓库服务器在国外，下载依赖可能很慢。我们可以配置国内镜像来加速。

**步骤 1：找到 Maven 配置文件**
找到 Maven 安装目录下的 `conf/settings.xml` 文件，例如：
`C:\Program Files\Apache\Maven\apache-maven-3.9.6\conf\settings.xml`

**步骤 2：编辑 settings.xml**
用文本编辑器打开，找到 `<mirrors>` 标签，在其中添加阿里云镜像配置：

```xml
<mirrors>
  <!-- 阿里云公共仓库 -->
  <mirror>
    <id>aliyunmaven</id>
    <mirrorOf>*</mirrorOf>
    <name>阿里云公共仓库</name>
    <url>https://maven.aliyun.com/repository/public</url>
  </mirror>
</mirrors>
```

**步骤 3：配置本地仓库路径（可选）**
Maven 会将下载的依赖保存到本地仓库，默认路径是 `C:\Users\你的用户名\.m2\repository`。

如果想自定义路径，可以在 `settings.xml` 中设置：

```xml
<settings>
  <!-- 设置本地仓库路径 -->
  <localRepository>D:/Maven/repository</localRepository>
  
  <!-- ... 其他配置 ... -->
</settings>
```

## 2.2 安装 Docker Desktop + WSL2

### 2.2.1 什么是 Docker？

Docker 是一个容器化平台，可以将应用程序及其依赖打包成一个标准化的容器镜像，然后在任何支持 Docker 的环境中运行。

**Docker 的优势：**
- **环境一致性**：开发、测试、生产环境完全一致，避免"在我机器上能跑"的问题
- **轻量级**：比虚拟机更轻量，启动快，资源占用少
- **易于部署**：一条命令即可部署应用
- **版本控制**：镜像可以版本化管理

### 2.2.2 安装 WSL2（Windows Subsystem for Linux 2）

Docker Desktop on Windows 需要 WSL2 支持。

**步骤 1：启用 WSL**
以管理员身份打开 PowerShell，执行：

```powershell
# 启用 WSL 功能
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

# 启用虚拟机平台功能
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

**步骤 2：重启电脑**

**步骤 3：下载并安装 WSL2 Linux 内核更新包**
1. 访问：https://aka.ms/wsl2kernel
2. 下载并安装 `wsl_update_x64.msi`

**步骤 4：设置 WSL2 为默认版本**
打开 PowerShell，执行：

```powershell
wsl --set-default-version 2
```

**步骤 5：安装 Linux 发行版（可选）**
虽然 Docker Desktop 不需要，但安装一个 Linux 发行版对学习很有帮助：

```powershell
# 安装 Ubuntu
wsl --install -d Ubuntu
```

### 2.2.3 安装 Docker Desktop

**步骤 1：下载 Docker Desktop**
访问：https://www.docker.com/products/docker-desktop
下载 Windows 版本

**步骤 2：安装 Docker Desktop**
1. 双击下载的安装包
2. 勾选 "Use WSL 2 instead of Hyper-V"
3. 完成安装后重启电脑

**步骤 3：启动 Docker Desktop**
1. 从开始菜单启动 Docker Desktop
2. 等待 Docker 引擎启动（状态栏显示绿色表示正在运行）
3. 首次启动可能需要几分钟

**步骤 4：验证安装**
打开命令提示符或 PowerShell，执行：

```bash
# 查看 Docker 版本
docker --version

# 查看 Docker Compose 版本
docker-compose --version

# 运行测试容器
docker run hello-world
```

如果能看到 "Hello from Docker!" 的消息，说明 Docker 安装成功！

### 2.2.4 配置 Docker 镜像加速（中国区）

国内访问 Docker Hub 可能较慢，配置镜像加速器可以提高下载速度。

**步骤 1：获取镜像加速地址**
可以使用以下公共镜像加速器：
- 阿里云：https://cr.console.aliyun.com/cn-hangzhou/instances/mirrors（需要注册阿里云账号）
- 网易云：http://hub-mirror.c.163.com
- Docker 中国：https://registry.docker-cn.com

**步骤 2：配置 Docker Desktop**
1. 打开 Docker Desktop
2. 点击右上角设置图标 → Settings
3. 选择 Docker Engine
4. 在 JSON 配置中添加：

```json
{
  "registry-mirrors": [
    "https://docker.mirrors.ustc.edu.cn",
    "https://registry.docker-cn.com",
    "http://hub-mirror.c.163.com"
  ]
}
```

5. 点击 "Apply & Restart"

## 2.3 Cursor IDE 插件配置

### 2.3.1 安装 Cursor IDE

**步骤 1：下载 Cursor**
访问：https://cursor.sh/
下载 Windows 版本

**步骤 2：安装 Cursor**
双击安装包，按提示完成安装

**步骤 3：启动 Cursor**
首次启动会要求登录（可以使用 GitHub 账号）

### 2.3.2 安装必需插件

打开 Cursor，点击左侧扩展图标（或按 `Ctrl + Shift + X`），搜索并安装以下插件：

#### 1. Kotlin Language
- **名称**：Kotlin Language
- **发布者**：mathiasfrohlich
- **作用**：提供 Kotlin 语言支持，包括语法高亮、代码补全、错误检查等
- **安装**：搜索 "Kotlin"，点击 Install

#### 2. Spring Boot Extension Pack
- **名称**：Spring Boot Extension Pack
- **发布者**：Pivotal
- **作用**：Spring Boot 开发工具集，包括：
  - Spring Boot Dashboard（管理 Spring Boot 应用）
  - Spring Initializr（创建 Spring Boot 项目）
  - Spring Boot Tools（代码提示和导航）
- **安装**：搜索 "Spring Boot Extension Pack"，点击 Install

#### 3. Docker
- **名称**：Docker
- **发布者**：Microsoft
- **作用**：
  - 管理 Docker 容器和镜像
  - 编辑 Dockerfile，提供语法高亮和智能提示
  - 右键菜单快速构建和运行容器
- **安装**：搜索 "Docker"，选择 Microsoft 发布的版本

#### 4. Database Client（可选但推荐）
- **名称**：Database Client
- **发布者**：cweijan
- **作用**：
  - 在 IDE 内连接和管理数据库
  - 执行 SQL 查询
  - 查看表结构和数据
- **安装**：搜索 "Database Client"

#### 5. YAML（推荐）
- **名称**：YAML
- **发布者**：Red Hat
- **作用**：YAML 文件语法支持（application.yml 配置文件会用到）
- **安装**：搜索 "YAML"

#### 6. GitLens（推荐）
- **名称**：GitLens
- **发布者**：GitKraken
- **作用**：增强 Git 功能，查看代码历史、作者、提交记录等
- **安装**：搜索 "GitLens"

### 2.3.3 配置 Cursor 设置

**配置 Java 路径**
1. 按 `Ctrl + ,` 打开设置
2. 搜索 "java.home"
3. 设置为 JDK 安装路径，例如：`C:\Program Files\Eclipse Adoptium\jdk-17.0.9+9`

**配置 Maven 路径**
1. 搜索 "maven.executable.path"
2. 设置为 Maven 的 mvn 可执行文件路径，例如：`C:\Program Files\Apache\Maven\apache-maven-3.9.6\bin\mvn`

## 2.4 使用 Spring Initializr 创建 Kotlin + Maven 项目

### 2.4.1 什么是 Spring Initializr？

Spring Initializr 是 Spring 官方提供的项目快速生成工具，可以通过简单的配置生成一个完整的 Spring Boot 项目骨架。

### 2.4.2 使用 Web 版 Spring Initializr

**步骤 1：访问 Spring Initializr**
打开浏览器，访问：https://start.spring.io/

**步骤 2：配置项目基本信息**

- **Project**：选择 `Maven`（项目构建工具）
- **Language**：选择 `Kotlin`（编程语言）
- **Spring Boot**：选择 `3.2.x`（最新稳定版，例如 3.2.1）
- **Project Metadata**：
  - **Group**：`com.example`（组织域名倒序，例如公司是 example.com）
  - **Artifact**：`demo`（项目名称，建议使用小写字母和连字符）
  - **Name**：`demo`（应用名称，通常与 Artifact 相同）
  - **Description**：`Demo project for Spring Boot`（项目描述）
  - **Package name**：`com.example.demo`（会自动生成）
  - **Packaging**：选择 `Jar`（打包方式，Jar 可以直接运行）
  - **Java**：选择 `17`（Java 版本）

**步骤 3：添加依赖（Dependencies）**

点击 "ADD DEPENDENCIES" 按钮，添加以下依赖：

1. **Spring Web**（必需）
   - 作用：提供 Web 开发支持，包括 RESTful API、Spring MVC 等
   - 搜索关键词：`Web`

2. **Spring Boot DevTools**（推荐）
   - 作用：开发工具，提供热重启、自动刷新等功能
   - 搜索关键词：`DevTools`

**步骤 4：生成项目**
点击底部绿色的 "GENERATE" 按钮，会下载一个 zip 文件（例如：`demo.zip`）

**步骤 5：解压并打开项目**
1. 将下载的 zip 文件解压到你的工作目录，例如：`D:\Projects\demo`
2. 打开 Cursor IDE
3. 选择 "File" → "Open Folder"，选择解压后的 `demo` 目录
4. Cursor 会自动识别这是一个 Maven 项目，并开始下载依赖（右下角会显示进度）

### 2.4.3 使用 Cursor 内置的 Spring Initializr

如果你已经安装了 Spring Boot Extension Pack 插件，也可以在 Cursor 中直接创建项目：

**步骤 1：打开命令面板**
按 `Ctrl + Shift + P`

**步骤 2：搜索 Spring Initializr**
输入 `Spring Initializr`，选择 "Spring Initializr: Create a Maven Project"

**步骤 3：按提示配置**
依次选择：
1. Spring Boot 版本：`3.2.x`
2. 语言：`Kotlin`
3. Group Id：`com.example`
4. Artifact Id：`demo`
5. Packaging type：`Jar`
6. Java version：`17`
7. 添加依赖：选择 `Spring Web` 和 `Spring Boot DevTools`

**步骤 4：选择项目保存位置**
选择一个文件夹，Cursor 会自动生成项目并打开

### 2.4.4 等待依赖下载

首次打开项目时，Maven 会下载所有依赖的库文件，这可能需要几分钟时间（取决于网络速度）。

可以通过以下方式查看下载进度：
- Cursor 右下角会显示 "Resolving Maven dependencies..."
- 或者打开终端，在项目目录下执行：`mvn dependency:resolve`

## 2.5 项目结构讲解

### 2.5.1 整体目录结构

使用 Spring Initializr 生成的项目目录结构如下：

```
demo/
├── src/
│   ├── main/
│   │   ├── kotlin/
│   │   │   └── com/
│   │   │       └── example/
│   │   │           └── demo/
│   │   │               └── DemoApplication.kt    # 应用入口类
│   │   └── resources/
│   │       ├── static/                           # 静态资源目录（HTML、CSS、JS等）
│   │       ├── templates/                        # 模板文件目录（如Thymeleaf模板）
│   │       └── application.properties            # 应用配置文件
│   └── test/
│       └── kotlin/
│           └── com/
│               └── example/
│                   └── demo/
│                       └── DemoApplicationTests.kt  # 测试类
├── .gitignore                                    # Git 忽略文件配置
├── mvnw                                          # Maven Wrapper 脚本（Linux/Mac）
├── mvnw.cmd                                      # Maven Wrapper 脚本（Windows）
├── pom.xml                                       # Maven 项目配置文件
└── README.md                                     # 项目说明文档
```

### 2.5.2 核心文件详解

#### 1. pom.xml（Maven 项目配置文件）

这是 Maven 项目的核心配置文件，定义了项目的元数据、依赖、插件等。

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
         https://maven.apache.org/xsd/maven-4.0.0.xsd">
    
    <!-- POM 模型版本，固定为 4.0.0 -->
    <modelVersion>4.0.0</modelVersion>
    
    <!-- 父项目配置：继承 Spring Boot 的默认配置 -->
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>3.2.1</version>
        <relativePath/> <!-- 从仓库查找父项目，而不是从本地 -->
    </parent>
    
    <!-- 项目坐标（唯一标识） -->
    <groupId>com.example</groupId>           <!-- 组织/公司域名倒序 -->
    <artifactId>demo</artifactId>            <!-- 项目名称 -->
    <version>0.0.1-SNAPSHOT</version>        <!-- 项目版本号 -->
    <name>demo</name>                        <!-- 项目显示名称 -->
    <description>Demo project for Spring Boot</description>
    
    <!-- 项目属性配置 -->
    <properties>
        <java.version>17</java.version>                    <!-- Java 版本 -->
        <kotlin.version>1.9.21</kotlin.version>            <!-- Kotlin 版本 -->
    </properties>
    
    <!-- 项目依赖 -->
    <dependencies>
        <!-- Spring Boot Web 启动器：包含 Spring MVC、RESTful、内嵌 Tomcat 等 -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        
        <!-- Kotlin 反射库：Spring Boot 需要使用 Kotlin 反射 -->
        <dependency>
            <groupId>org.jetbrains.kotlin</groupId>
            <artifactId>kotlin-reflect</artifactId>
        </dependency>
        
        <!-- Kotlin 标准库：Kotlin 核心库 -->
        <dependency>
            <groupId>org.jetbrains.kotlin</groupId>
            <artifactId>kotlin-stdlib</artifactId>
        </dependency>
        
        <!-- Spring Boot 开发工具：提供热重启、自动刷新等功能 -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-devtools</artifactId>
            <scope>runtime</scope>              <!-- 仅在运行时使用 -->
            <optional>true</optional>           <!-- 可选依赖，不会传递给其他项目 -->
        </dependency>
        
        <!-- Spring Boot 测试启动器：包含 JUnit、Mockito 等测试框架 -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>                 <!-- 仅在测试时使用 -->
        </dependency>
    </dependencies>
    
    <!-- 构建配置 -->
    <build>
        <!-- 源代码目录配置 -->
        <sourceDirectory>${project.basedir}/src/main/kotlin</sourceDirectory>
        <testSourceDirectory>${project.basedir}/src/test/kotlin</testSourceDirectory>
        
        <!-- 插件配置 -->
        <plugins>
            <!-- Spring Boot Maven 插件：用于打包和运行 Spring Boot 应用 -->
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
            </plugin>
            
            <!-- Kotlin Maven 插件：编译 Kotlin 代码 -->
            <plugin>
                <groupId>org.jetbrains.kotlin</groupId>
                <artifactId>kotlin-maven-plugin</artifactId>
                <configuration>
                    <!-- Kotlin 编译器参数 -->
                    <args>
                        <!-- 支持 Spring 的开放类（Spring 需要类是 open 的，而 Kotlin 类默认是 final） -->
                        <arg>-Xjsr305=strict</arg>
                    </args>
                    <!-- 编译器插件 -->
                    <compilerPlugins>
                        <!-- Spring 插件：自动为 @Component 等注解的类添加 open 修饰符 -->
                        <plugin>spring</plugin>
                        <!-- JPA 插件：为 @Entity 类生成无参构造器 -->
                        <plugin>jpa</plugin>
                    </compilerPlugins>
                </configuration>
                <dependencies>
                    <!-- Spring 插件依赖 -->
                    <dependency>
                        <groupId>org.jetbrains.kotlin</groupId>
                        <artifactId>kotlin-maven-allopen</artifactId>
                        <version>${kotlin.version}</version>
                    </dependency>
                    <!-- JPA 插件依赖 -->
                    <dependency>
                        <groupId>org.jetbrains.kotlin</groupId>
                        <artifactId>kotlin-maven-noarg</artifactId>
                        <version>${kotlin.version}</version>
                    </dependency>
                </dependencies>
            </plugin>
        </plugins>
    </build>
</project>
```

**关键概念解析：**

- **坐标（Coordinates）**：`groupId`、`artifactId`、`version` 三者组成项目的唯一标识
- **依赖（Dependency）**：项目需要的第三方库，Maven 会自动下载
- **scope**：依赖的作用范围
  - `compile`（默认）：编译和运行时都需要
  - `runtime`：只在运行时需要
  - `test`：只在测试时需要
  - `provided`：编译时需要，运行时由容器提供（如 Servlet API）
- **插件（Plugin）**：扩展 Maven 的功能，如编译、打包、测试等

#### 2. DemoApplication.kt（应用入口类）

这是 Spring Boot 应用的启动类：

```kotlin
package com.example.demo

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

/**
 * Spring Boot 应用主入口类
 * 
 * @SpringBootApplication 注解是一个组合注解，包含：
 * - @SpringBootConfiguration: 标识这是一个配置类
 * - @EnableAutoConfiguration: 启用自动配置
 * - @ComponentScan: 启用组件扫描
 */
@SpringBootApplication
class DemoApplication

/**
 * Kotlin 应用入口函数
 * runApplication 是 Spring Boot 提供的 Kotlin 扩展函数，用于启动 Spring 应用
 */
fun main(args: Array<String>) {
    // 启动 Spring Boot 应用
    // DemoApplication::class 表示传递 DemoApplication 类的引用
    // *args 是 Kotlin 的展开运算符，将数组展开为可变参数
    runApplication<DemoApplication>(*args)
}
```

**代码说明：**

- **`@SpringBootApplication`**：核心注解，标识这是一个 Spring Boot 应用
- **`class DemoApplication`**：空类，只用于承载 `@SpringBootApplication` 注解
- **`fun main(args: Array<String>)`**：Kotlin 程序的入口函数
- **`runApplication<DemoApplication>(*args)`**：启动 Spring Boot 应用
  - 泛型 `<DemoApplication>` 指定启动类
  - `*args` 将命令行参数传递给 Spring Boot

#### 3. application.properties（配置文件）

这是 Spring Boot 的核心配置文件，位于 `src/main/resources/` 目录下。

初始状态下是空的，可以在这里配置应用的各种属性：

```properties
# 应用名称
spring.application.name=demo

# 服务器端口（默认是 8080）
server.port=8080

# 日志级别
logging.level.root=INFO
logging.level.com.example.demo=DEBUG
```

**说明：**
- 也可以使用 `application.yml` 格式（更清晰，推荐）
- 配置会在后续章节详细讲解

#### 4. DemoApplicationTests.kt（测试类）

这是一个简单的测试类：

```kotlin
package com.example.demo

import org.junit.jupiter.api.Test
import org.springframework.boot.test.context.SpringBootTest

/**
 * Spring Boot 应用测试类
 * 
 * @SpringBootTest 注解会：
 * 1. 启动完整的 Spring 应用上下文
 * 2. 加载所有配置和 Bean
 * 3. 允许进行集成测试
 */
@SpringBootTest
class DemoApplicationTests {

    /**
     * 测试应用上下文是否能正常加载
     * 如果应用配置有问题，这个测试会失败
     */
    @Test
    fun contextLoads() {
        // 空方法，只要能执行到这里且不抛异常，说明测试通过
    }
}
```

### 2.5.3 Maven Wrapper 说明

项目中的 `mvnw` 和 `mvnw.cmd` 是 Maven Wrapper 脚本。

**作用：**
- 即使电脑没有安装 Maven，也可以通过这些脚本运行 Maven 命令
- 确保团队成员使用相同版本的 Maven
- 脚本会自动下载指定版本的 Maven

**使用方法：**
```bash
# Windows
mvnw.cmd clean install

# Linux/Mac
./mvnw clean install
```

如果你已经安装了 Maven，可以直接使用 `mvn` 命令：
```bash
mvn clean install
```

## 2.6 验证项目创建成功

### 2.6.1 使用 Maven 命令运行

打开终端（在 Cursor 中按 `Ctrl + ~`），进入项目目录，执行：

```bash
# 清理并编译项目
mvn clean compile

# 运行 Spring Boot 应用
mvn spring-boot:run
```

如果看到类似以下输出，说明启动成功：

```
  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::                (v3.2.1)

2024-01-01 12:00:00.000  INFO 12345 --- [           main] com.example.demo.DemoApplicationKt       : Starting DemoApplicationKt
2024-01-01 12:00:01.000  INFO 12345 --- [           main] com.example.demo.DemoApplicationKt       : Started DemoApplicationKt in 2.5 seconds
```

看到 "Started DemoApplicationKt" 说明应用启动成功！

按 `Ctrl + C` 可以停止应用。

### 2.6.2 使用 Cursor 运行

如果安装了 Spring Boot Extension Pack 插件：

1. 打开 `DemoApplication.kt` 文件
2. 在 `main` 函数上方会看到一个绿色的运行按钮 ▶️
3. 点击运行按钮，选择 "Run 'DemoApplicationKt'"
4. Cursor 会自动编译并运行应用

## 2.7 本章小结

在本章中，我们完成了以下内容：

✅ 安装并配置了 JDK 17 和 Maven
✅ 安装并配置了 Docker Desktop 和 WSL2
✅ 安装了 Cursor IDE 并配置了必要的插件
✅ 使用 Spring Initializr 创建了第一个 Spring Boot 项目
✅ 理解了 Maven 项目的目录结构和核心文件
✅ 成功运行了 Spring Boot 应用

**关键要点：**
- JDK 是 Kotlin 运行的基础环境
- Maven 负责项目构建和依赖管理
- Docker 用于容器化部署
- `pom.xml` 是 Maven 项目的核心配置文件
- `@SpringBootApplication` 是 Spring Boot 应用的入口注解
- `mvn spring-boot:run` 可以快速启动应用

**下一章预告：**
在下一章中，我们将创建第一个 REST API，了解 Spring Boot 应用的基本开发流程，并学习如何使用 Docker 打包和运行应用。

---

# 第3章：第一个 Spring Boot 应用

## 3.1 Kotlin 入口类详解

在上一章中，我们已经看到了 Spring Boot 应用的入口类 `DemoApplication.kt`。现在让我们深入理解它的每一个部分。

### 3.1.1 @SpringBootApplication 注解

`@SpringBootApplication` 是 Spring Boot 最核心的注解，它是一个组合注解（Meta-annotation），实际上包含了三个重要的注解：

```kotlin
package com.example.demo

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

/**
 * @SpringBootApplication 组合注解包含：
 * 
 * 1. @SpringBootConfiguration
 *    - 继承自 @Configuration
 *    - 标识当前类是一个配置类
 *    - 可以在类中定义 @Bean 方法
 * 
 * 2. @EnableAutoConfiguration
 *    - 启用 Spring Boot 的自动配置机制
 *    - 根据类路径中的依赖自动配置 Spring 应用
 *    - 例如：如果类路径中有 spring-boot-starter-web，会自动配置 Tomcat 和 Spring MVC
 * 
 * 3. @ComponentScan
 *    - 启用组件扫描
 *    - 自动扫描当前包及其子包下的所有组件（@Component, @Service, @Repository, @Controller 等）
 *    - 默认扫描路径是 @SpringBootApplication 注解类所在的包
 */
@SpringBootApplication
class DemoApplication

fun main(args: Array<String>) {
    runApplication<DemoApplication>(*args)
}
```

**关键概念：**

1. **配置类（Configuration Class）**
   - 使用 `@Configuration` 注解的类，用于定义 Bean
   - Spring Boot 应用至少需要一个配置类

2. **自动配置（Auto-Configuration）**
   - Spring Boot 的核心特性之一
   - 根据类路径自动配置应用
   - 减少了大量的 XML 配置和手动配置

3. **组件扫描（Component Scanning）**
   - 自动发现并注册 Spring 组件
   - 只扫描启动类所在包及其子包
   - 这就是为什么要将启动类放在顶层包的原因

### 3.1.2 自定义 @SpringBootApplication

你可以通过参数来自定义 `@SpringBootApplication` 的行为：

```kotlin
/**
 * 自定义配置示例
 */
@SpringBootApplication(
    // 排除特定的自动配置类
    exclude = [DataSourceAutoConfiguration::class],
    
    // 指定组件扫描的基础包（默认是当前包）
    scanBasePackages = ["com.example.demo", "com.example.common"],
    
    // 或者通过类来指定扫描包
    // scanBasePackageClasses = [DemoApplication::class, AnotherClass::class]
)
class DemoApplication
```

**参数说明：**
- `exclude`：排除某些自动配置类（当你不需要某些默认功能时使用）
- `scanBasePackages`：指定要扫描的包路径
- `scanBasePackageClasses`：通过类来指定扫描包（更安全，重构时不会出错）

### 3.1.3 runApplication 函数详解

`runApplication` 是 Spring Boot 为 Kotlin 提供的扩展函数，它简化了应用启动：

```kotlin
fun main(args: Array<String>) {
    // 基本用法
    runApplication<DemoApplication>(*args)
    
    // 等价于 Java 中的写法：
    // SpringApplication.run(DemoApplication.class, args);
}
```

你也可以在启动时进行一些自定义配置：

```kotlin
fun main(args: Array<String>) {
    runApplication<DemoApplication>(*args) {
        // 设置额外的 Profile
        setAdditionalProfiles("dev")
        
        // 设置默认属性
        setDefaultProperties(mapOf(
            "server.port" to "9090",
            "spring.application.name" to "my-app"
        ))
        
        // 添加初始化器
        addInitializers(ApplicationContextInitializer { context ->
            println("应用上下文初始化...")
        })
    }
}
```

## 3.2 第一个 Hello World REST API

现在让我们创建第一个 REST API，体验 Spring Boot 开发的简洁性。

### 3.2.1 创建 Controller

在 `com.example.demo` 包下创建一个新的包 `controller`，然后创建 `HelloController.kt`：

```kotlin
package com.example.demo.controller

import org.springframework.web.bind.annotation.*

/**
 * Hello World 控制器
 * 
 * @RestController 注解说明：
 * - 这是一个组合注解，包含 @Controller 和 @ResponseBody
 * - @Controller: 标识这是一个控制器类，会被组件扫描发现
 * - @ResponseBody: 表示方法返回值会直接写入 HTTP 响应体，而不是渲染视图
 * - 适合用于 RESTful API，返回 JSON 或 XML 数据
 */
@RestController
/**
 * @RequestMapping 注解说明：
 * - 定义请求映射的基础路径
 * - 这里所有的接口都会以 /api 开头
 * - 可以在类级别和方法级别使用
 */
@RequestMapping("/api")
class HelloController {

    /**
     * 最简单的 GET 请求
     * 
     * @GetMapping 注解说明：
     * - 处理 HTTP GET 请求
     * - 是 @RequestMapping(method = RequestMethod.GET) 的快捷方式
     * - 路径会拼接类级别的 @RequestMapping，最终路径是 /api/hello
     * 
     * @return 返回字符串，Spring Boot 会自动转换为 HTTP 响应
     */
    @GetMapping("/hello")
    fun sayHello(): String {
        return "Hello, Spring Boot with Kotlin!"
    }

    /**
     * 带路径参数的 GET 请求
     * 
     * @PathVariable 注解说明：
     * - 用于提取 URL 路径中的变量
     * - {name} 是占位符，实际请求时会被替换
     * - name: String 参数会自动接收路径中的值
     * 
     * 示例请求：GET /api/hello/张三
     * 响应：Hello, 张三!
     */
    @GetMapping("/hello/{name}")
    fun sayHelloToSomeone(
        @PathVariable name: String  // 从路径中提取 name 参数
    ): String {
        return "Hello, $name!"
    }

    /**
     * 带查询参数的 GET 请求
     * 
     * @RequestParam 注解说明：
     * - 用于提取 URL 查询参数（?后面的参数）
     * - defaultValue: 指定默认值，当参数不存在时使用
     * - required: 指定参数是否必需，默认为 true
     * 
     * 示例请求：
     * - GET /api/greet?name=李四       -> Hello, 李四!
     * - GET /api/greet                 -> Hello, Guest!
     */
    @GetMapping("/greet")
    fun greet(
        @RequestParam(defaultValue = "Guest") name: String  // 查询参数，有默认值
    ): String {
        return "Hello, $name!"
    }

    /**
     * POST 请求示例 - 接收 JSON 数据
     * 
     * @PostMapping 注解说明：
     * - 处理 HTTP POST 请求
     * - 常用于创建资源
     * 
     * @RequestBody 注解说明：
     * - 表示参数来自请求体（Request Body）
     * - Spring Boot 会自动将 JSON 转换为对象（使用 Jackson）
     * - 需要在请求头设置 Content-Type: application/json
     * 
     * 示例请求：
     * POST /api/users
     * Content-Type: application/json
     * {
     *   "name": "张三",
     *   "age": 25
     * }
     */
    @PostMapping("/users")
    fun createUser(
        @RequestBody user: UserRequest  // 从请求体接收 JSON 数据
    ): UserResponse {
        // 简单的业务逻辑：创建用户并返回
        return UserResponse(
            id = 1,
            name = user.name,
            age = user.age,
            message = "用户创建成功"
        )
    }

    /**
     * 返回复杂对象（会自动转换为 JSON）
     */
    @GetMapping("/info")
    fun getInfo(): AppInfo {
        return AppInfo(
            name = "Spring Boot Demo",
            version = "1.0.0",
            description = "一个简单的 Spring Boot 应用"
        )
    }
}

/**
 * 数据类：请求对象
 * 
 * Kotlin 的 data class 特点：
 * - 自动生成 equals(), hashCode(), toString(), copy() 方法
 * - 非常适合作为 DTO（Data Transfer Object）
 */
data class UserRequest(
    val name: String,     // 用户名
    val age: Int          // 年龄
)

/**
 * 数据类：响应对象
 */
data class UserResponse(
    val id: Long,         // 用户 ID
    val name: String,     // 用户名
    val age: Int,         // 年龄
    val message: String   // 响应消息
)

/**
 * 数据类：应用信息
 */
data class AppInfo(
    val name: String,         // 应用名称
    val version: String,      // 版本号
    val description: String   // 描述
)
```

### 3.2.2 运行并测试 API

**步骤 1：启动应用**
```bash
mvn spring-boot:run
```

或者在 Cursor 中直接运行 `main` 函数。

**步骤 2：测试 API**

使用浏览器或 Postman、Apifox 等工具测试：

1. **简单 GET 请求**
```
GET http://localhost:8080/api/hello
响应：Hello, Spring Boot with Kotlin!
```

2. **带路径参数的 GET 请求**
```
GET http://localhost:8080/api/hello/张三
响应：Hello, 张三!
```

3. **带查询参数的 GET 请求**
```
GET http://localhost:8080/api/greet?name=李四
响应：Hello, 李四!
```

4. **POST 请求**
```
POST http://localhost:8080/api/users
Content-Type: application/json

{
  "name": "张三",
  "age": 25
}

响应：
{
  "id": 1,
  "name": "张三",
  "age": 25,
  "message": "用户创建成功"
}
```

5. **返回复杂对象**
```
GET http://localhost:8080/api/info
响应：
{
  "name": "Spring Boot Demo",
  "version": "1.0.0",
  "description": "一个简单的 Spring Boot 应用"
}
```

### 3.2.3 使用 curl 命令测试（命令行方式）

如果你熟悉命令行，可以使用 curl 测试：

```bash
# GET 请求
curl http://localhost:8080/api/hello

# 带路径参数的 GET 请求
curl http://localhost:8080/api/hello/张三

# 带查询参数的 GET 请求
curl "http://localhost:8080/api/greet?name=李四"

# POST 请求
curl -X POST http://localhost:8080/api/users \
  -H "Content-Type: application/json" \
  -d '{"name":"张三","age":25}'

# 格式化 JSON 输出（Windows PowerShell）
curl http://localhost:8080/api/info | ConvertFrom-Json | ConvertTo-Json
```

## 3.3 在 Cursor 中运行应用

### 3.3.1 使用运行按钮

1. 打开 `DemoApplication.kt` 文件
2. 在 `main` 函数上方会看到绿色的运行按钮 ▶️
3. 点击运行，选择 "Run 'DemoApplicationKt'"
4. 在底部的 "Run" 窗口查看启动日志

### 3.3.2 使用调试模式

1. 在代码中设置断点（点击代码行号左侧）
2. 点击调试按钮 🐛 或按 `F5`
3. 应用会以调试模式启动
4. 当请求到达断点时，执行会暂停，可以查看变量值

### 3.3.3 使用 Spring Boot Dashboard

如果安装了 Spring Boot Extension Pack 插件：

1. 在 Cursor 左侧会看到 "Spring Boot Dashboard" 面板
2. 可以看到所有的 Spring Boot 应用
3. 右键应用可以 Start、Stop、Debug、Restart
4. 非常方便管理多个 Spring Boot 项目

## 3.4 Maven 命令启动详解

### 3.4.1 常用 Maven 命令

```bash
# 清理编译输出（删除 target 目录）
mvn clean

# 编译项目（不运行测试）
mvn compile

# 运行测试
mvn test

# 打包项目（生成 jar 文件）
mvn package

# 安装到本地仓库
mvn install

# 清理并打包
mvn clean package

# 跳过测试打包（加快速度）
mvn clean package -DskipTests

# 运行 Spring Boot 应用
mvn spring-boot:run

# 指定 Profile 运行
mvn spring-boot:run -Dspring-boot.run.profiles=dev

# 指定端口运行
mvn spring-boot:run -Dspring-boot.run.arguments=--server.port=9090
```

### 3.4.2 理解 Maven 生命周期

Maven 有三个内置的生命周期：

**1. clean 生命周期**
```
pre-clean → clean → post-clean
```
用于清理项目

**2. default 生命周期（最重要）**
```
validate → compile → test → package → verify → install → deploy
```
- `validate`：验证项目是否正确
- `compile`：编译源代码
- `test`：运行测试
- `package`：打包成 jar 或 war
- `install`：安装到本地仓库
- `deploy`：部署到远程仓库

**3. site 生命周期**
```
pre-site → site → post-site → site-deploy
```
用于生成项目站点文档

**重要概念：**
- 执行后面的阶段会自动执行前面的所有阶段
- 例如：`mvn package` 会依次执行 validate → compile → test → package

## 3.5 Docker 打包与容器运行

现在让我们学习如何将 Spring Boot 应用容器化。

### 3.5.1 创建 Dockerfile

在项目根目录创建 `Dockerfile`：

```dockerfile
# 多阶段构建 Dockerfile

# ============= 阶段 1: 构建阶段 =============
# 使用 Maven 官方镜像作为构建环境
# maven:3.9.6-eclipse-temurin-17 说明：
# - maven:3.9.6  -> Maven 版本
# - eclipse-temurin-17 -> 基于 Eclipse Temurin JDK 17
FROM maven:3.9.6-eclipse-temurin-17 AS build

# 设置工作目录
# 后续的命令都会在这个目录下执行
WORKDIR /app

# 复制 pom.xml 和 Maven Wrapper 文件
# 为什么先复制这些文件？
# - Docker 会缓存每一层，如果 pom.xml 没变，就不会重新下载依赖
# - 这样可以显著加快构建速度
COPY pom.xml .
COPY mvnw .
COPY .mvn .mvn

# 下载依赖（利用 Docker 缓存）
# -B: Batch mode（非交互模式）
# dependency:go-offline: 下载所有依赖到本地仓库
RUN mvn dependency:go-offline -B

# 复制源代码
# 将 src 目录复制到容器的 /app/src
COPY src ./src

# 打包应用
# -DskipTests: 跳过测试（测试应该在 CI/CD 中单独运行）
# -B: Batch mode
RUN mvn package -DskipTests -B

# ============= 阶段 2: 运行阶段 =============
# 使用更小的 JRE 镜像运行应用
# 为什么使用单独的运行阶段？
# - 构建镜像包含 Maven 和编译工具，体积很大
# - 运行时只需要 JRE，可以大幅减小镜像体积
FROM eclipse-temurin:17-jre-alpine

# 设置工作目录
WORKDIR /app

# 从构建阶段复制 jar 文件
# --from=build: 从名为 build 的阶段复制文件
# target/*.jar: 打包生成的 jar 文件
# app.jar: 复制到运行阶段并重命名为 app.jar
COPY --from=build /app/target/*.jar app.jar

# 暴露端口
# EXPOSE 是声明性的，实际运行时还需要用 -p 参数映射端口
EXPOSE 8080

# 设置 JVM 参数（可选但推荐）
# -Xmx512m: 最大堆内存 512MB
# -Xms256m: 初始堆内存 256MB
# -Djava.security.egd: 加快启动速度（使用非阻塞随机数生成器）
ENV JAVA_OPTS="-Xmx512m -Xms256m -Djava.security.egd=file:/dev/./urandom"

# 启动命令
# ENTRYPOINT: 容器启动时执行的命令
# exec java: 使用 exec 确保 Java 进程是容器的主进程（PID 1）
# $JAVA_OPTS: 使用上面定义的 JVM 参数
# -jar app.jar: 运行 jar 文件
ENTRYPOINT exec java $JAVA_OPTS -jar app.jar
```

**Dockerfile 关键概念：**

1. **多阶段构建（Multi-stage Build）**
   - 使用多个 `FROM` 语句
   - 最终镜像只包含最后一个阶段
   - 可以大幅减小镜像体积

2. **层缓存（Layer Caching）**
   - Docker 会缓存每一层
   - 只有当前层或之前的层有变化时才会重新构建
   - 先复制 pom.xml，再复制源代码，可以充分利用缓存

3. **Alpine Linux**
   - 非常小的 Linux 发行版（约 5MB）
   - 适合构建精简的容器镜像
   - `-alpine` 后缀的镜像通常都基于 Alpine

### 3.5.2 创建 .dockerignore

在项目根目录创建 `.dockerignore` 文件，避免将不必要的文件复制到镜像中：

```
# 编译输出
target/
**/target/

# IDE 配置
.idea/
.vscode/
*.iml
*.ipr
*.iws

# Maven
.mvn/wrapper/maven-wrapper.jar

# 日志文件
*.log

# 操作系统文件
.DS_Store
Thumbs.db

# Git
.git/
.gitignore
```

### 3.5.3 构建 Docker 镜像

在项目根目录打开终端，执行：

```bash
# 构建镜像
# -t demo:1.0: 指定镜像名称和标签
# .: 构建上下文是当前目录
docker build -t demo:1.0 .

# 查看构建的镜像
docker images demo
```

输出示例：
```
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
demo         1.0       abc123def456   10 seconds ago   250MB
```

**构建命令详解：**
- `docker build`：构建镜像命令
- `-t demo:1.0`：`-t` 表示 tag（标签），格式为 `name:version`
- `.`：构建上下文路径，Docker 会将该目录下的文件发送给 Docker 守护进程

### 3.5.4 运行 Docker 容器

```bash
# 运行容器
# --name demo-container: 指定容器名称
# -p 8080:8080: 端口映射，宿主机端口:容器端口
# -d: 后台运行（detached mode）
# demo:1.0: 使用的镜像
docker run --name demo-container -p 8080:8080 -d demo:1.0

# 查看运行的容器
docker ps

# 查看容器日志
docker logs demo-container

# 实时查看日志（类似 tail -f）
docker logs -f demo-container

# 进入容器（用于调试）
docker exec -it demo-container sh

# 停止容器
docker stop demo-container

# 启动已停止的容器
docker start demo-container

# 删除容器
docker rm demo-container

# 强制删除正在运行的容器
docker rm -f demo-container
```

**端口映射说明：**
```bash
-p 宿主机端口:容器端口

# 示例：
-p 8080:8080   # 宿主机 8080 映射到容器 8080
-p 9090:8080   # 宿主机 9090 映射到容器 8080（容器内还是 8080）
```

### 3.5.5 Docker Compose 编排

对于多容器应用（例如：应用 + 数据库 + Redis），使用 Docker Compose 更方便。

在项目根目录创建 `docker-compose.yml`：

```yaml
# Docker Compose 文件版本
version: '3.8'

# 定义服务
services:
  # 应用服务
  app:
    # 从 Dockerfile 构建镜像
    build:
      context: .                    # 构建上下文（Dockerfile 所在目录）
      dockerfile: Dockerfile        # Dockerfile 文件名
    # 容器名称
    container_name: demo-app
    # 端口映射
    ports:
      - "8080:8080"                 # 宿主机端口:容器端口
    # 环境变量
    environment:
      - SPRING_PROFILES_ACTIVE=dev  # 激活 dev profile
    # 重启策略
    restart: unless-stopped         # 除非手动停止，否则总是重启
    # 依赖的服务（确保 MySQL 和 Redis 先启动）
    depends_on:
      - mysql
      - redis

  # MySQL 数据库服务
  mysql:
    # 使用官方 MySQL 镜像
    image: mysql:8.0
    container_name: demo-mysql
    # 端口映射
    ports:
      - "3306:3306"
    # 环境变量（配置 MySQL）
    environment:
      MYSQL_ROOT_PASSWORD: root123      # root 用户密码
      MYSQL_DATABASE: demo_db           # 创建的数据库名
      MYSQL_USER: demo_user             # 创建的用户名
      MYSQL_PASSWORD: demo123           # 用户密码
    # 数据卷（持久化数据）
    volumes:
      - mysql-data:/var/lib/mysql       # 挂载数据目录
      - ./init.sql:/docker-entrypoint-initdb.d/init.sql  # 初始化 SQL 脚本
    restart: unless-stopped

  # Redis 缓存服务
  redis:
    # 使用官方 Redis 镜像
    image: redis:7-alpine
    container_name: demo-redis
    # 端口映射
    ports:
      - "6379:6379"
    # 命令参数
    command: redis-server --appendonly yes  # 开启 AOF 持久化
    # 数据卷
    volumes:
      - redis-data:/data                    # 挂载数据目录
    restart: unless-stopped

# 定义数据卷（用于持久化数据）
volumes:
  mysql-data:     # MySQL 数据卷
  redis-data:     # Redis 数据卷
```

**Docker Compose 常用命令：**

```bash
# 启动所有服务（后台运行）
docker-compose up -d

# 启动所有服务（前台运行，可以看到日志）
docker-compose up

# 重新构建镜像并启动
docker-compose up -d --build

# 查看运行的服务
docker-compose ps

# 查看服务日志
docker-compose logs

# 查看特定服务的日志
docker-compose logs app

# 实时查看日志
docker-compose logs -f

# 停止所有服务
docker-compose stop

# 停止并删除所有容器
docker-compose down

# 停止并删除所有容器和数据卷（慎用！会删除数据）
docker-compose down -v

# 重启服务
docker-compose restart

# 重启特定服务
docker-compose restart app

# 进入服务容器
docker-compose exec app sh

# 查看服务资源使用情况
docker-compose stats
```

### 3.5.6 验证 Docker 部署

**步骤 1：构建并启动**
```bash
docker-compose up -d --build
```

**步骤 2：查看日志**
```bash
docker-compose logs -f app
```

等待应用启动完成（看到 "Started DemoApplicationKt" 日志）。

**步骤 3：测试 API**
```bash
curl http://localhost:8080/api/hello
```

如果返回 "Hello, Spring Boot with Kotlin!"，说明部署成功！

## 3.6 本章小结

在本章中，我们完成了以下内容：

✅ 深入理解了 `@SpringBootApplication` 注解的组成和作用
✅ 创建了第一个 REST API，包括 GET 和 POST 请求
✅ 学习了常用注解：`@RestController`、`@GetMapping`、`@PostMapping`、`@PathVariable`、`@RequestParam`、`@RequestBody`
✅ 掌握了在 Cursor 中运行和调试 Spring Boot 应用
✅ 理解了 Maven 的生命周期和常用命令
✅ 编写了 Dockerfile，实现了应用的容器化
✅ 使用 Docker Compose 编排多容器应用

**关键要点：**
- `@SpringBootApplication` = `@Configuration` + `@EnableAutoConfiguration` + `@ComponentScan`
- `@RestController` 适合编写 RESTful API
- Kotlin 的 data class 非常适合作为 DTO
- Docker 多阶段构建可以减小镜像体积
- Docker Compose 适合管理多容器应用
- 使用数据卷（volumes）可以持久化容器数据

**下一章预告：**
在下一章中，我们将深入学习 Spring Boot 的核心概念和工作原理，包括自动配置机制、依赖注入、Bean 生命周期等，帮助你真正理解 Spring Boot 的运行机制。

---

# 第4章：Spring Boot 核心概念与工作原理

## 4.1 Auto Configuration 自动装配机制

### 4.1.1 什么是自动配置？

自动配置是 Spring Boot 最重要的特性之一。它可以根据类路径中的依赖自动配置 Spring 应用，极大地减少了手动配置的工作量。

**传统 Spring 配置 vs Spring Boot 自动配置：**

```xml
<!-- 传统 Spring：需要大量 XML 配置 -->
<bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource">
    <property name="driverClassName" value="com.mysql.jdbc.Driver"/>
    <property name="url" value="jdbc:mysql://localhost:3306/mydb"/>
    <property name="username" value="root"/>
    <property name="password" value="password"/>
</bean>

<bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
    <property name="dataSource" ref="dataSource"/>
</bean>
```

```kotlin
// Spring Boot：只需要添加依赖和简单配置
// 在 pom.xml 中添加依赖后，Spring Boot 会自动配置

// application.yml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/mydb
    username: root
    password: password
```

### 4.1.2 自动配置原理

**步骤 1：@EnableAutoConfiguration 注解**

`@SpringBootApplication` 包含 `@EnableAutoConfiguration`，它会导入 `AutoConfigurationImportSelector`。

**步骤 2：加载自动配置类**

Spring Boot 会读取 `spring-boot-autoconfigure` jar 包中的 `META-INF/spring.factories` 文件，这个文件列出了所有的自动配置类。

```properties
# spring.factories 文件示例（部分）
org.springframework.boot.autoconfigure.EnableAutoConfiguration=\
org.springframework.boot.autoconfigure.web.servlet.DispatcherServletAutoConfiguration,\
org.springframework.boot.autoconfigure.web.servlet.ServletWebServerFactoryAutoConfiguration,\
org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration,\
org.springframework.boot.autoconfigure.data.redis.RedisAutoConfiguration
```

**步骤 3：条件注解过滤**

每个自动配置类都使用 `@ConditionalOnXxx` 注解来判断是否需要生效。

```kotlin
/**
 * 自动配置类示例（简化版）
 */
@Configuration
// 只有在类路径中存在 DataSource 类时才生效
@ConditionalOnClass(DataSource::class)
// 只有在用户没有自定义 DataSource Bean 时才生效
@ConditionalOnMissingBean(DataSource::class)
// 启用配置属性绑定
@EnableConfigurationProperties(DataSourceProperties::class)
class DataSourceAutoConfiguration {
    
    @Bean
    fun dataSource(properties: DataSourceProperties): DataSource {
        // 根据配置创建 DataSource
        return properties.initializeDataSourceBuilder().build()
    }
}
```

### 4.1.3 常用条件注解

Spring Boot 提供了丰富的条件注解：

```kotlin
// 1. @ConditionalOnClass：类路径中存在指定类时生效
@ConditionalOnClass(RedisOperations::class)

// 2. @ConditionalOnMissingClass：类路径中不存在指定类时生效
@ConditionalOnMissingClass("com.example.SomeClass")

// 3. @ConditionalOnBean：容器中存在指定 Bean 时生效
@ConditionalOnBean(DataSource::class)

// 4. @ConditionalOnMissingBean：容器中不存在指定 Bean 时生效
@ConditionalOnMissingBean(DataSource::class)

// 5. @ConditionalOnProperty：配置文件中存在指定属性时生效
@ConditionalOnProperty(name = ["spring.redis.enabled"], havingValue = "true")

// 6. @ConditionalOnResource：类路径中存在指定资源时生效
@ConditionalOnResource(resources = ["classpath:application.properties"])

// 7. @ConditionalOnWebApplication：当前应用是 Web 应用时生效
@ConditionalOnWebApplication

// 8. @ConditionalOnNotWebApplication：当前应用不是 Web 应用时生效
@ConditionalOnNotWebApplication
```

### 4.1.4 自定义自动配置类

你也可以创建自己的自动配置类：

```kotlin
package com.example.demo.config

import org.springframework.boot.autoconfigure.condition.ConditionalOnClass
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean
import org.springframework.boot.context.properties.EnableConfigurationProperties
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration

/**
 * 自定义服务的配置属性
 * 
 * @ConfigurationProperties 注解说明：
 * - 绑定配置文件中的属性到类的字段
 * - prefix: 指定配置前缀，例如 my.service.enabled 会绑定到 enabled 字段
 */
@ConfigurationProperties(prefix = "my.service")
data class MyServiceProperties(
    var enabled: Boolean = true,     // 是否启用服务
    var name: String = "Default",    // 服务名称
    var timeout: Int = 3000          // 超时时间（毫秒）
)

/**
 * 自定义服务类
 */
class MyService(private val properties: MyServiceProperties) {
    
    fun doSomething(): String {
        return "Service ${properties.name} is running with timeout ${properties.timeout}ms"
    }
}

/**
 * 自动配置类
 * 
 * 工作原理：
 * 1. 当类路径中存在 MyService 类时
 * 2. 且用户没有自定义 MyService Bean 时
 * 3. 自动创建 MyService Bean
 */
@Configuration
@ConditionalOnClass(MyService::class)
@EnableConfigurationProperties(MyServiceProperties::class)
class MyServiceAutoConfiguration {
    
    @Bean
    @ConditionalOnMissingBean
    @ConditionalOnProperty(prefix = "my.service", name = ["enabled"], havingValue = "true", matchIfMissing = true)
    fun myService(properties: MyServiceProperties): MyService {
        return MyService(properties)
    }
}
```

使用自定义配置：

```yaml
# application.yml
my:
  service:
    enabled: true
    name: CustomService
    timeout: 5000
```

```kotlin
// 在控制器中使用
@RestController
class TestController(
    private val myService: MyService  // 自动注入
) {
    
    @GetMapping("/test")
    fun test(): String {
        return myService.doSomething()
    }
}
```

### 4.1.5 查看生效的自动配置

你可以通过以下方式查看哪些自动配置类生效了：

**方法 1：启动时查看**
```yaml
# application.yml
# 开启调试模式
debug: true
```

启动应用后，控制台会打印自动配置报告，包括：
- Positive matches（已生效的配置）
- Negative matches（未生效的配置及原因）

**方法 2：使用 Actuator**
```xml
<!-- 添加 Actuator 依赖 -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-actuator</artifactId>
</dependency>
```

访问 `http://localhost:8080/actuator/conditions` 可以查看所有条件匹配情况。

## 4.2 Bean 与依赖注入（DI）

### 4.2.1 什么是 Bean？

Bean 是 Spring 容器管理的对象。Spring 负责创建、配置和管理这些对象的生命周期。

**普通对象 vs Spring Bean：**

```kotlin
// 普通对象：需要手动创建和管理
val userService = UserService()
val orderService = OrderService(userService)  // 手动注入依赖

// Spring Bean：由 Spring 容器管理
@Service
class UserService {
    // Spring 自动创建实例
}

@Service
class OrderService(
    private val userService: UserService  // Spring 自动注入依赖
) {
    // 不需要手动创建 UserService
}
```

### 4.2.2 依赖注入（Dependency Injection）

依赖注入是一种设计模式，对象的依赖关系由外部容器注入，而不是由对象自己创建。

**三种注入方式：**

**1. 构造器注入（推荐）**
```kotlin
/**
 * 构造器注入
 * 
 * 优点：
 * - 依赖是final的，不可变
 * - 强制要求依赖必须存在
 * - 更容易进行单元测试
 * - Kotlin中代码最简洁
 */
@Service
class UserService(
    private val userRepository: UserRepository,  // 通过构造器注入
    private val emailService: EmailService
) {
    fun createUser(name: String): User {
        val user = userRepository.save(User(name = name))
        emailService.sendWelcomeEmail(user.email)
        return user
    }
}
```

**2. Setter 注入**
```kotlin
/**
 * Setter 注入
 * 
 * 适用场景：
 * - 可选依赖
 * - 需要在对象创建后改变依赖
 */
@Service
class OrderService {
    
    // 使用 lateinit 延迟初始化
    @Autowired
    lateinit var userService: UserService
    
    // 或者使用可空类型
    @Autowired
    var emailService: EmailService? = null
}
```

**3. 字段注入（不推荐）**
```kotlin
/**
 * 字段注入
 * 
 * 缺点：
 * - 无法将字段设为final
 * - 不利于单元测试
 * - 隐藏了类的依赖关系
 */
@Service
class ProductService {
    
    @Autowired
    private lateinit var productRepository: ProductRepository
}
```

### 4.2.3 @Autowired 详解

```kotlin
/**
 * @Autowired 注解详解
 */
@Service
class ExampleService {
    
    // 1. 按类型注入（默认）
    @Autowired
    lateinit var userRepository: UserRepository
    
    // 2. 可选注入（如果Bean不存在，不会报错）
    @Autowired(required = false)
    var optionalService: OptionalService? = null
    
    // 3. 注入集合（会注入所有匹配类型的Bean）
    @Autowired
    lateinit var allServices: List<SomeService>
    
    // 4. 注入Map（key是Bean名称，value是Bean实例）
    @Autowired
    lateinit var serviceMap: Map<String, SomeService>
}
```

**注意：在 Kotlin 中，如果类只有一个构造器，`@Autowired` 可以省略。**

```kotlin
// 推荐写法：简洁明了
@Service
class UserService(
    private val userRepository: UserRepository  // 自动注入，不需要@Autowired
)
```

### 4.2.4 解决依赖冲突

当接口有多个实现时，如何指定注入哪一个？

**方法 1：使用 @Primary**
```kotlin
interface NotificationService {
    fun send(message: String)
}

@Service
@Primary  // 标记为主要实现
class EmailNotificationService : NotificationService {
    override fun send(message: String) {
        println("Sending email: $message")
    }
}

@Service
class SmsNotificationService : NotificationService {
    override fun send(message: String) {
        println("Sending SMS: $message")
    }
}

@Service
class OrderService(
    private val notificationService: NotificationService  // 会注入 EmailNotificationService
)
```

**方法 2：使用 @Qualifier**
```kotlin
@Service
@Qualifier("email")
class EmailNotificationService : NotificationService {
    override fun send(message: String) {
        println("Sending email: $message")
    }
}

@Service
@Qualifier("sms")
class SmsNotificationService : NotificationService {
    override fun send(message: String) {
        println("Sending SMS: $message")
    }
}

@Service
class OrderService(
    @Qualifier("sms") private val notificationService: NotificationService  // 明确指定注入 SMS 服务
)
```

**方法 3：使用Bean名称**
```kotlin
@Service
class OrderService(
    private val smsNotificationService: NotificationService  // 通过Bean名称注入
)
```

## 4.3 Component Scan 组件扫描原理

### 4.3.1 什么是组件扫描？

组件扫描是 Spring 自动发现和注册 Bean 的机制。

**扫描范围：**
- 默认扫描 `@SpringBootApplication` 注解类所在包及其子包
- 这就是为什么建议将启动类放在根包的原因

```
com.example.demo/              ← 启动类在这里
├── DemoApplication.kt         ← @SpringBootApplication
├── controller/                ← 会被扫描
├── service/                   ← 会被扫描
├── repository/                ← 会被扫描
└── config/                    ← 会被扫描
```

### 4.3.2 组件注解

Spring 提供了多个组件注解，它们在语义上有所区别，但本质上都是 `@Component`：

```kotlin
// 1. @Component：通用组件
@Component
class UtilityComponent

// 2. @Service：业务逻辑层
@Service
class UserService

// 3. @Repository：数据访问层
@Repository
class UserRepository

// 4. @Controller：Web 控制器（返回视图）
@Controller
class HomeController

// 5. @RestController：RESTful API 控制器（返回数据）
@RestController
class ApiController

// 6. @Configuration：配置类
@Configuration
class AppConfig
```

**为什么要区分不同的注解？**
1. **语义清晰**：一眼就能看出类的职责
2. **AOP 增强**：可以针对特定层进行切面编程
3. **特殊功能**：例如 `@Repository` 会自动进行异常转换

### 4.3.3 自定义扫描路径

```kotlin
/**
 * 方法 1：在 @SpringBootApplication 中指定
 */
@SpringBootApplication(scanBasePackages = ["com.example.demo", "com.example.common"])
class DemoApplication

/**
 * 方法 2：使用 @ComponentScan
 */
@Configuration
@ComponentScan(
    basePackages = ["com.example.demo", "com.example.common"],
    // 包含特定注解的类
    includeFilters = [ComponentScan.Filter(type = FilterType.ANNOTATION, classes = [MyCustomAnnotation::class])],
    // 排除特定类
    excludeFilters = [ComponentScan.Filter(type = FilterType.ASSIGNABLE_TYPE, classes = [SomeClass::class])]
)
class ScanConfig
```

### 4.3.4 手动注册 Bean

有时我们需要手动注册 Bean（例如第三方库的类）：

```kotlin
@Configuration
class BeanConfig {
    
    /**
     * 手动创建Bean
     * 
     * @Bean 注解说明：
     * - 方法返回值会被注册为Spring Bean
     * - Bean名称默认是方法名
     * - 可以通过name或value属性指定名称
     */
    @Bean
    fun objectMapper(): ObjectMapper {
        return ObjectMapper().apply {
            // 配置Jackson
            configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false)
            registerKotlinModule()  // 支持Kotlin
        }
    }
    
    /**
     * Bean依赖其他Bean
     * Spring会自动注入参数
     */
    @Bean
    fun myService(objectMapper: ObjectMapper, userRepository: UserRepository): MyService {
        return MyService(objectMapper, userRepository)
    }
    
    /**
     * 指定Bean名称
     */
    @Bean(name = ["myCustomBean", "bean2"])  // 可以有多个名称
    fun customBean(): CustomBean {
        return CustomBean()
    }
    
    /**
     * Bean的初始化和销毁方法
     */
    @Bean(initMethod = "init", destroyMethod = "cleanup")
    fun resourceBean(): ResourceBean {
        return ResourceBean()
    }
}
```

## 4.4 ApplicationContext 与配置加载流程

### 4.4.1 什么是 ApplicationContext？

`ApplicationContext` 是 Spring 的核心容器，负责：
- 创建和管理 Bean
- 管理 Bean 的生命周期
- 提供依赖注入
- 发布事件
- 加载配置

**ApplicationContext 继承体系：**
```
BeanFactory（接口）           ← 最基础的容器
    ↑
ApplicationContext（接口）     ← 增加了更多企业级功能
    ↑
WebApplicationContext          ← Web应用专用
    ↑
AnnotationConfigWebApplicationContext  ← Spring Boot默认使用
```

### 4.4.2 获取 ApplicationContext

```kotlin
/**
 * 方法 1：实现 ApplicationContextAware 接口
 */
@Component
class MyComponent : ApplicationContextAware {
    
    private lateinit var applicationContext: ApplicationContext
    
    override fun setApplicationContext(context: ApplicationContext) {
        this.applicationContext = context
    }
    
    fun doSomething() {
        // 从容器中获取Bean
        val userService = applicationContext.getBean(UserService::class.java)
        
        // 获取所有某类型的Bean
        val allServices = applicationContext.getBeansOfType(SomeService::class.java)
        
        // 检查Bean是否存在
        val exists = applicationContext.containsBean("userService")
    }
}

/**
 * 方法 2：使用 @Autowired 注入
 */
@Component
class AnotherComponent(
    private val applicationContext: ApplicationContext  // 直接注入
) {
    fun doSomething() {
        val bean = applicationContext.getBean("beanName", BeanClass::class.java)
    }
}
```

### 4.4.3 Spring Boot 启动流程

让我们深入了解 Spring Boot 应用从启动到运行的完整流程：

```
1. main() 方法执行
   ↓
2. runApplication<DemoApplication>(*args)
   ↓
3. 创建 SpringApplication 实例
   ↓
4. 推断应用类型（Web/Reactive/None）
   ↓
5. 加载初始化器（ApplicationContextInitializer）
   ↓
6. 加载监听器（ApplicationListener）
   ↓
7. 推断主类（Main Class）
   ↓
8. 运行 SpringApplication.run()
   ↓
9. 创建 ApplicationContext
   ↓
10. 准备环境（Environment）
   ↓
11. 打印 Banner（Spring Boot标志）
   ↓
12. 创建并准备 ApplicationContext
   ↓
13. 加载配置文件（application.yml/properties）
   ↓
14. 扫描并注册 Bean
   ↓
15. 执行自动配置
   ↓
16. 刷新 ApplicationContext（实例化所有单例Bean）
   ↓
17. 执行 Runner（CommandLineRunner, ApplicationRunner）
   ↓
18. 启动完成，应用运行中
```

**详细代码演示：**

```kotlin
fun main(args: Array<String>) {
    val context = runApplication<DemoApplication>(*args) {
        // 这里可以自定义SpringApplication
        setBannerMode(Banner.Mode.OFF)  // 关闭启动Banner
        setLogStartupInfo(false)        // 不打印启动信息
        
        // 添加监听器
        addListeners(ApplicationListener { event ->
            println("收到事件: ${event::class.simpleName}")
        })
    }
    
    // 应用启动后，可以从context中获取Bean
    val userService = context.getBean(UserService::class.java)
}
```

### 4.4.4 配置加载优先级

Spring Boot 从多个位置加载配置，优先级从高到低：

```
1. 命令行参数
   java -jar app.jar --server.port=9090

2. SPRING_APPLICATION_JSON 环境变量中的属性

3. ServletConfig 初始化参数

4. ServletContext 初始化参数

5. JNDI 属性

6. Java 系统属性（System.getProperties()）

7. 操作系统环境变量

8. RandomValuePropertySource（random.*属性）

9. jar包外部的 application-{profile}.properties/yml

10. jar包内部的 application-{profile}.properties/yml

11. jar包外部的 application.properties/yml

12. jar包内部的 application.properties/yml

13. @PropertySource 注解指定的配置文件

14. 默认属性（SpringApplication.setDefaultProperties）
```

**示例：**
```bash
# 优先级演示

# application.yml（优先级低）
server:
  port: 8080

# application-dev.yml（优先级较高）
server:
  port: 8081

# 命令行参数（优先级最高）
java -jar app.jar --server.port=9090

# 最终端口：9090（命令行参数覆盖了配置文件）
```

## 4.5 Profiles 环境切换机制

### 4.5.1 什么是 Profile？

Profile 是 Spring 提供的环境隔离机制，可以为不同的环境（开发、测试、生产）提供不同的配置。

### 4.5.2 创建多环境配置

```yaml
# application.yml（主配置文件，所有环境共享）
spring:
  application:
    name: demo
  profiles:
    active: dev  # 激活的Profile

---
# application-dev.yml（开发环境）
server:
  port: 8080

spring:
  datasource:
    url: jdbc:mysql://localhost:3306/demo_dev
    username: dev_user
    password: dev123

logging:
  level:
    root: DEBUG

---
# application-test.yml（测试环境）
server:
  port: 8081

spring:
  datasource:
    url: jdbc:mysql://test-server:3306/demo_test
    username: test_user
    password: test123

logging:
  level:
    root: INFO

---
# application-prod.yml（生产环境）
server:
  port: 80

spring:
  datasource:
    url: jdbc:mysql://prod-server:3306/demo_prod
    username: prod_user
    password: prod123

logging:
  level:
    root: WARN
```

### 4.5.3 激活 Profile

**方法 1：配置文件**
```yaml
# application.yml
spring:
  profiles:
    active: dev
```

**方法 2：命令行参数**
```bash
java -jar app.jar --spring.profiles.active=prod
```

**方法 3：环境变量**
```bash
export SPRING_PROFILES_ACTIVE=prod
java -jar app.jar
```

**方法 4：IDE中配置**
在 Cursor/IntelliJ IDEA 的运行配置中设置 Active Profiles

**方法 5：Maven命令**
```bash
mvn spring-boot:run -Dspring-boot.run.profiles=dev
```

### 4.5.4 Profile 注解

可以使用 `@Profile` 注解让Bean只在特定环境下生效：

```kotlin
/**
 * 只在dev环境下生效的配置
 */
@Configuration
@Profile("dev")
class DevConfig {
    
    @Bean
    fun mockEmailService(): EmailService {
        return object : EmailService {
            override fun send(to: String, subject: String, body: String) {
                println("Mock: Sending email to $to")
                println("Subject: $subject")
                println("Body: $body")
            }
        }
    }
}

/**
 * 只在prod环境下生效的配置
 */
@Configuration
@Profile("prod")
class ProdConfig {
    
    @Bean
    fun realEmailService(): EmailService {
        return object : EmailService {
            override fun send(to: String, subject: String, body: String) {
                // 真实的邮件发送逻辑
                // ...
            }
        }
    }
}

/**
 * 在非prod环境下生效
 */
@Configuration
@Profile("!prod")
class NonProdConfig {
    // 开发和测试环境的配置
}

/**
 * 在多个Profile下生效
 */
@Configuration
@Profile("dev", "test")
class DevAndTestConfig {
    // 同时在dev和test环境下生效
}
```

### 4.5.5 Profile 组合

Spring Boot 2.4+ 支持 Profile 组合：

```yaml
# application.yml
spring:
  profiles:
    active: prod
    group:
      prod:
        - proddb      # 生产数据库配置
        - prodcache   # 生产缓存配置
        - prodlog     # 生产日志配置
      dev:
        - devdb
        - devcache
        - devlog
```

```yaml
# application-proddb.yml
spring:
  datasource:
    url: jdbc:mysql://prod-server:3306/demo
    
# application-prodcache.yml
spring:
  redis:
    host: prod-redis-server
    
# application-prodlog.yml
logging:
  level:
    root: WARN
```

激活 `prod` Profile 时，会自动激活 `proddb`、`prodcache`、`prodlog` 这三个 Profile。

## 4.6 本章小结

在本章中，我们深入学习了以下内容：

✅ 理解了 Spring Boot 的自动配置机制和原理
✅ 掌握了条件注解的使用
✅ 学习了 Bean 的概念和依赖注入的三种方式
✅ 理解了组件扫描的工作原理
✅ 了解了 ApplicationContext 的作用和 Spring Boot 启动流程
✅ 掌握了多环境配置和 Profile 机制

**关键要点：**
- 自动配置基于条件注解，符合条件才会生效
- 依赖注入推荐使用构造器注入
- `@Component`、`@Service`、`@Repository`、`@Controller` 都是组件注解
- ApplicationContext 是 Spring 的核心容器
- Profile 可以实现多环境配置隔离
- 配置文件有明确的优先级顺序

**下一章预告：**
在下一章中，我们将系统学习 Spring Boot 的常用注解，包括应用层、组件层、控制层、数据层、注入与配置等各个方面的注解，这些是企业开发的必备知识。

---

# 第5章：Spring Boot 常用注解与语法精讲（企业必备）

本章将系统讲解 Spring Boot 开发中最常用的注解，这些是企业开发的必备知识。我们会详细解释每个注解的作用、参数以及使用场景。

## 5.1 应用层注解

### 5.1.1 @SpringBootApplication

这是我们之前已经见过的最重要的注解，它是三个注解的组合：

```kotlin
// @SpringBootApplication 的源码定义（简化版）
@Target(AnnotationTarget.CLASS)
@Retention(AnnotationRetention.RUNTIME)
@Configuration              // 1. 标识为配置类
@EnableAutoConfiguration    // 2. 启用自动配置
@ComponentScan              // 3. 启用组件扫描
annotation class SpringBootApplication(
    // 排除特定的自动配置类
    val exclude: Array<KClass<*>> = [],
    
    // 排除特定的自动配置类（通过类名）
    val excludeName: Array<String> = [],
    
    // 指定扫描的包路径
    val scanBasePackages: Array<String> = [],
    
    // 指定扫描的包（通过类）
    val scanBasePackageClasses: Array<KClass<*>> = []
)
```

**使用示例：**

```kotlin
/**
 * 基本使用
 */
@SpringBootApplication
class DemoApplication

/**
 * 排除数据源自动配置（当不需要数据库时）
 */
@SpringBootApplication(
    exclude = [
        DataSourceAutoConfiguration::class,
        DataSourceTransactionManagerAutoConfiguration::class
    ]
)
class DemoApplication

/**
 * 自定义扫描路径（扫描多个包）
 */
@SpringBootApplication(
    scanBasePackages = [
        "com.example.demo",
        "com.example.common",
        "com.example.utils"
    ]
)
class DemoApplication
```

### 5.1.2 @Configuration

标识一个类为配置类，可以在其中定义 Bean。

```kotlin
/**
 * @Configuration 注解说明：
 * - 标识这是一个配置类，相当于 Spring XML 配置文件
 * - 会被组件扫描自动发现
 * - 类中的 @Bean 方法会被处理
 * 
 * 重要参数：
 * - proxyBeanMethods: 是否代理 @Bean 方法（默认true）
 *   - true: Full 模式，保证单例
 *   - false: Lite 模式，提高启动速度
 */
@Configuration
class AppConfig {
    
    /**
     * 定义 Bean
     * Bean 名称默认是方法名
     */
    @Bean
    fun objectMapper(): ObjectMapper {
        return ObjectMapper().apply {
            configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false)
            registerKotlinModule()
        }
    }
    
    /**
     * Bean 之间可以相互依赖
     * Spring 会自动注入参数
     */
    @Bean
    fun userService(
        userRepository: UserRepository,
        objectMapper: ObjectMapper
    ): UserService {
        return UserService(userRepository, objectMapper)
    }
}

/**
 * Lite 模式配置类（Spring Boot 2.2+）
 * 适用于不需要 Bean 方法互相调用的场景
 * 启动速度更快
 */
@Configuration(proxyBeanMethods = false)
class LiteConfig {
    
    @Bean
    fun bean1(): Bean1 = Bean1()
    
    @Bean
    fun bean2(): Bean2 = Bean2()
}
```

### 5.1.3 @Bean

用于在配置类中定义 Bean。

```kotlin
@Configuration
class BeanConfig {
    
    /**
     * 基本用法
     */
    @Bean
    fun simpleBean(): SimpleBean {
        return SimpleBean()
    }
    
    /**
     * 指定 Bean 名称和别名
     */
    @Bean(name = ["myBean", "bean1", "bean2"])
    fun namedBean(): NamedBean {
        return NamedBean()
    }
    
    /**
     * 指定初始化方法和销毁方法
     * 
     * initMethod: Bean 创建后调用
     * destroyMethod: Bean 销毁前调用
     */
    @Bean(initMethod = "init", destroyMethod = "cleanup")
    fun resourceBean(): ResourceBean {
        return ResourceBean()
    }
    
    /**
     * 使用 JSR-250 注解（推荐）
     */
    @Bean
    fun modernBean(): ModernBean {
        return ModernBean()
    }
}

class ResourceBean {
    fun init() {
        println("Bean 初始化...")
        // 连接数据库、打开文件等
    }
    
    fun cleanup() {
        println("Bean 销毁...")
        // 关闭连接、释放资源等
    }
}

class ModernBean {
    @PostConstruct  // Bean 创建后调用
    fun init() {
        println("Bean 初始化...")
    }
    
    @PreDestroy  // Bean 销毁前调用
    fun cleanup() {
        println("Bean 销毁...")
    }
}
```

## 5.2 组件层注解

### 5.2.1 @Component

通用组件注解，标识一个类为 Spring 组件。

```kotlin
/**
 * @Component 注解说明：
 * - 标识类为 Spring 组件，会被组件扫描自动发现
 * - Bean 名称默认是类名首字母小写
 * 
 * 重要参数：
 * - value: 指定 Bean 名称
 */

/**
 * 默认 Bean 名称：utilityComponent
 */
@Component
class UtilityComponent {
    fun doSomething() {
        println("Utility component doing something")
    }
}

/**
 * 自定义 Bean 名称：myUtil
 */
@Component("myUtil")
class CustomNameComponent {
    fun process() {
        println("Processing...")
    }
}
```

### 5.2.2 @Service

业务逻辑层注解，本质上是 @Component 的特化。

```kotlin
/**
 * @Service 注解说明：
 * - 标识业务逻辑层组件
 * - 语义更清晰，便于理解代码结构
 * - 可以被 AOP 切面拦截
 */
@Service
class UserService(
    private val userRepository: UserRepository,
    private val emailService: EmailService
) {
    /**
     * 创建用户
     */
    fun createUser(name: String, email: String): User {
        // 业务逻辑
        val user = User(name = name, email = email)
        val savedUser = userRepository.save(user)
        emailService.sendWelcomeEmail(email)
        return savedUser
    }
    
    /**
     * 获取用户
     */
    fun getUserById(id: Long): User? {
        return userRepository.findById(id)
    }
    
    /**
     * 更新用户
     */
    fun updateUser(id: Long, name: String): User? {
        val user = userRepository.findById(id) ?: return null
        user.name = name
        return userRepository.save(user)
    }
    
    /**
     * 删除用户
     */
    fun deleteUser(id: Long): Boolean {
        return userRepository.deleteById(id)
    }
}
```

### 5.2.3 @Repository

数据访问层注解，用于标识 DAO/Mapper 类。

```kotlin
/**
 * @Repository 注解说明：
 * - 标识数据访问层组件
 * - 会自动进行异常转换（将数据库异常转换为 Spring 的 DataAccessException）
 * - 适用于 JPA、MyBatis 等数据访问技术
 * 
 * 特殊功能：
 * - 异常转换：捕获持久化异常并转换为统一的异常体系
 */
@Repository
class UserRepository(
    private val jdbcTemplate: JdbcTemplate
) {
    fun save(user: User): User {
        val sql = "INSERT INTO users (name, email) VALUES (?, ?)"
        jdbcTemplate.update(sql, user.name, user.email)
        return user
    }
    
    fun findById(id: Long): User? {
        val sql = "SELECT * FROM users WHERE id = ?"
        return try {
            jdbcTemplate.queryForObject(sql, BeanPropertyRowMapper(User::class.java), id)
        } catch (e: EmptyResultDataAccessException) {
            null
        }
    }
    
    fun findAll(): List<User> {
        val sql = "SELECT * FROM users"
        return jdbcTemplate.query(sql, BeanPropertyRowMapper(User::class.java))
    }
    
    fun deleteById(id: Long): Boolean {
        val sql = "DELETE FROM users WHERE id = ?"
        return jdbcTemplate.update(sql, id) > 0
    }
}
```

### 5.2.4 @Controller 与 @RestController

Web 层注解，用于处理 HTTP 请求。

```kotlin
/**
 * @Controller 注解说明：
 * - 标识 Web 控制器
 * - 方法返回值默认被视为视图名称
 * - 适用于传统的 MVC 应用（返回 HTML 页面）
 */
@Controller
@RequestMapping("/pages")
class PageController {
    
    /**
     * 返回视图名称
     * Spring 会查找名为 "home" 的视图模板（如 home.html）
     */
    @GetMapping("/home")
    fun home(model: Model): String {
        model.addAttribute("message", "Welcome!")
        return "home"  // 视图名称
    }
    
    /**
     * 如果要返回 JSON 数据，需要加 @ResponseBody
     */
    @GetMapping("/api/data")
    @ResponseBody
    fun getData(): Map<String, Any> {
        return mapOf("status" to "success", "data" to "some data")
    }
}

/**
 * @RestController 注解说明：
 * - @Controller + @ResponseBody 的组合
 * - 所有方法默认返回 JSON/XML 数据
 * - 适用于 RESTful API
 */
@RestController
@RequestMapping("/api")
class ApiController {
    
    /**
     * 返回 JSON 数据
     * Spring Boot 会自动将对象转换为 JSON
     */
    @GetMapping("/users")
    fun getUsers(): List<User> {
        return listOf(
            User(id = 1, name = "张三", email = "zhang@example.com"),
            User(id = 2, name = "李四", email = "li@example.com")
        )
    }
    
    /**
     * 接收 JSON 数据并返回 JSON
     */
    @PostMapping("/users")
    fun createUser(@RequestBody user: User): User {
        // 保存用户逻辑
        return user
    }
}
```

## 5.3 控制层注解

### 5.3.1 请求映射注解

```kotlin
@RestController
@RequestMapping("/api/v1")  // 类级别路径前缀
class ProductController {
    
    /**
     * @GetMapping 注解说明：
     * - 处理 HTTP GET 请求
     * - 等价于 @RequestMapping(method = RequestMethod.GET)
     * 
     * 重要参数：
     * - value/path: 请求路径
     * - params: 请求参数限制
     * - headers: 请求头限制
     * - consumes: 接受的内容类型
     * - produces: 产生的内容类型
     */
    @GetMapping("/products")
    fun getAllProducts(): List<Product> {
        return listOf()
    }
    
    /**
     * 路径参数
     */
    @GetMapping("/products/{id}")
    fun getProduct(@PathVariable id: Long): Product {
        return Product(id = id, name = "Product $id")
    }
    
    /**
     * 多个路径参数
     */
    @GetMapping("/categories/{categoryId}/products/{productId}")
    fun getProductInCategory(
        @PathVariable categoryId: Long,
        @PathVariable productId: Long
    ): Product {
        return Product(id = productId, name = "Product in category $categoryId")
    }
    
    /**
     * @PostMapping 注解说明：
     * - 处理 HTTP POST 请求
     * - 常用于创建资源
     */
    @PostMapping("/products")
    fun createProduct(@RequestBody product: Product): Product {
        // 保存产品
        return product
    }
    
    /**
     * @PutMapping 注解说明：
     * - 处理 HTTP PUT 请求
     * - 常用于更新整个资源
     */
    @PutMapping("/products/{id}")
    fun updateProduct(
        @PathVariable id: Long,
        @RequestBody product: Product
    ): Product {
        product.id = id
        return product
    }
    
    /**
     * @PatchMapping 注解说明：
     * - 处理 HTTP PATCH 请求
     * - 常用于部分更新资源
     */
    @PatchMapping("/products/{id}")
    fun patchProduct(
        @PathVariable id: Long,
        @RequestBody updates: Map<String, Any>
    ): Product {
        // 部分更新逻辑
        return Product(id = id, name = updates["name"] as? String ?: "")
    }
    
    /**
     * @DeleteMapping 注解说明：
     * - 处理 HTTP DELETE 请求
     * - 常用于删除资源
     */
    @DeleteMapping("/products/{id}")
    fun deleteProduct(@PathVariable id: Long): Map<String, Any> {
        // 删除逻辑
        return mapOf("message" to "Product deleted", "id" to id)
    }
    
    /**
     * 带参数限制的映射
     * 只有当请求参数包含 type=special 时才匹配
     */
    @GetMapping("/products/search", params = ["type=special"])
    fun getSpecialProducts(): List<Product> {
        return listOf()
    }
    
    /**
     * 指定接受和产生的内容类型
     */
    @PostMapping(
        "/products/upload",
        consumes = ["application/json"],  // 只接受 JSON
        produces = ["application/json"]   // 只产生 JSON
    )
    fun uploadProduct(@RequestBody product: Product): Product {
        return product
    }
}
```

### 5.3.2 参数绑定注解

```kotlin
@RestController
@RequestMapping("/api")
class ParameterController {
    
    /**
     * @PathVariable 注解说明：
     * - 绑定 URL 路径中的变量
     * 
     * 重要参数：
     * - value/name: 路径变量名（参数名与变量名相同时可省略）
     * - required: 是否必需（默认true）
     */
    @GetMapping("/users/{userId}/posts/{postId}")
    fun getPost(
        @PathVariable userId: Long,           // 简写
        @PathVariable("postId") id: Long      // 完整写法
    ): String {
        return "User $userId, Post $id"
    }
    
    /**
     * 可选路径参数（使用可空类型）
     */
    @GetMapping("/items/{id}")
    fun getItem(
        @PathVariable(required = false) id: Long?
    ): String {
        return if (id != null) "Item $id" else "No ID provided"
    }
    
    /**
     * @RequestParam 注解说明：
     * - 绑定请求参数（查询参数或表单参数）
     * 
     * 重要参数：
     * - value/name: 参数名
     * - required: 是否必需（默认true）
     * - defaultValue: 默认值
     */
    @GetMapping("/search")
    fun search(
        @RequestParam keyword: String,                        // 必需参数
        @RequestParam(defaultValue = "1") page: Int,          // 可选参数，有默认值
        @RequestParam(defaultValue = "10") size: Int,
        @RequestParam(required = false) category: String?     // 可选参数，无默认值
    ): Map<String, Any> {
        return mapOf(
            "keyword" to keyword,
            "page" to page,
            "size" to size,
            "category" to (category ?: "all")
        )
    }
    
    /**
     * 接收多个同名参数
     */
    @GetMapping("/filter")
    fun filter(
        @RequestParam tags: List<String>  // 请求: /filter?tags=tag1&tags=tag2&tags=tag3
    ): List<String> {
        return tags
    }
    
    /**
     * 接收所有请求参数为 Map
     */
    @GetMapping("/params")
    fun getAllParams(
        @RequestParam params: Map<String, String>
    ): Map<String, String> {
        return params
    }
    
    /**
     * @RequestBody 注解说明：
     * - 绑定请求体（通常是 JSON）
     * 
     * 重要参数：
     * - required: 是否必需（默认true）
     */
    @PostMapping("/users")
    fun createUser(
        @RequestBody user: UserRequest  // 自动将 JSON 转换为对象
    ): UserResponse {
        return UserResponse(
            id = 1,
            name = user.name,
            email = user.email,
            message = "User created"
        )
    }
    
    /**
     * @RequestHeader 注解说明：
     * - 绑定请求头
     */
    @GetMapping("/auth")
    fun auth(
        @RequestHeader("Authorization") token: String,
        @RequestHeader("User-Agent") userAgent: String,
        @RequestHeader(value = "X-Custom-Header", defaultValue = "default") customHeader: String
    ): Map<String, String> {
        return mapOf(
            "token" to token,
            "userAgent" to userAgent,
            "customHeader" to customHeader
        )
    }
    
    /**
     * @CookieValue 注解说明：
     * - 绑定 Cookie 值
     */
    @GetMapping("/session")
    fun getSession(
        @CookieValue("JSESSIONID") sessionId: String
    ): String {
        return "Session ID: $sessionId"
    }
    
    /**
     * @ModelAttribute 注解说明：
     * - 绑定表单数据到对象
     * - 适用于传统的表单提交
     */
    @PostMapping("/form")
    fun submitForm(
        @ModelAttribute userForm: UserForm
    ): String {
        return "Received: ${userForm.name}, ${userForm.email}"
    }
}

data class UserRequest(
    val name: String,
    val email: String
)

data class UserResponse(
    val id: Long,
    val name: String,
    val email: String,
    val message: String
)

data class UserForm(
    var name: String = "",
    var email: String = "",
    var age: Int = 0
)

data class Product(
    var id: Long = 0,
    var name: String = "",
    var price: Double = 0.0
)
```

### 5.3.3 响应相关注解

```kotlin
@RestController
@RequestMapping("/api")
class ResponseController {
    
    /**
     * @ResponseStatus 注解说明：
     * - 设置响应状态码
     * 
     * 重要参数：
     * - value/code: HTTP 状态码
     * - reason: 状态描述
     */
    @PostMapping("/items")
    @ResponseStatus(HttpStatus.CREATED)  // 201 Created
    fun createItem(@RequestBody item: Item): Item {
        // 保存逻辑
        return item
    }
    
    @DeleteMapping("/items/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)  // 204 No Content
    fun deleteItem(@PathVariable id: Long) {
        // 删除逻辑
        // 不返回任何内容
    }
    
    /**
     * 使用 ResponseEntity 更灵活地控制响应
     */
    @GetMapping("/items/{id}")
    fun getItem(@PathVariable id: Long): ResponseEntity<Item> {
        val item = findItemById(id)
        
        return if (item != null) {
            // 200 OK
            ResponseEntity.ok(item)
        } else {
            // 404 Not Found
            ResponseEntity.notFound().build()
        }
    }
    
    /**
     * 自定义响应头和状态码
     */
    @PostMapping("/items/special")
    fun createSpecialItem(@RequestBody item: Item): ResponseEntity<Item> {
        // 保存逻辑
        
        return ResponseEntity
            .status(HttpStatus.CREATED)              // 201 状态码
            .header("X-Custom-Header", "value")      // 自定义响应头
            .header("Location", "/api/items/${item.id}")
            .body(item)                              // 响应体
    }
    
    /**
     * @CrossOrigin 注解说明：
     * - 配置跨域资源共享（CORS）
     * 
     * 重要参数：
     * - origins: 允许的源（默认所有）
     * - methods: 允许的HTTP方法
     * - maxAge: 预检请求缓存时间（秒）
     * - allowedHeaders: 允许的请求头
     * - exposedHeaders: 暴露的响应头
     * - allowCredentials: 是否允许携带凭证
     */
    @CrossOrigin(
        origins = ["http://localhost:3000", "https://example.com"],
        methods = [RequestMethod.GET, RequestMethod.POST],
        maxAge = 3600,
        allowedHeaders = ["*"],
        allowCredentials = "true"
    )
    @GetMapping("/public/data")
    fun getPublicData(): List<String> {
        return listOf("data1", "data2", "data3")
    }
    
    private fun findItemById(id: Long): Item? {
        // 模拟查找逻辑
        return if (id > 0) Item(id, "Item $id", 99.9) else null
    }
}

data class Item(
    val id: Long,
    val name: String,
    val price: Double
)
```

## 5.4 数据层注解（MyBatis）

### 5.4.1 @Mapper

MyBatis 的 Mapper 接口注解。

```kotlin
/**
 * @Mapper 注解说明：
 * - 标识 MyBatis 的 Mapper 接口
 * - Spring Boot 会自动扫描并创建代理实现
 */
@Mapper
interface UserMapper {
    
    /**
     * @Select 注解说明：
     * - 定义查询语句
     * - 支持简单的 SQL
     */
    @Select("SELECT * FROM users WHERE id = #{id}")
    fun findById(id: Long): User?
    
    /**
     * 查询所有
     */
    @Select("SELECT * FROM users")
    fun findAll(): List<User>
    
    /**
     * 带条件查询
     */
    @Select("SELECT * FROM users WHERE name LIKE CONCAT('%', #{keyword}, '%')")
    fun searchByName(keyword: String): List<User>
    
    /**
     * @Insert 注解说明：
     * - 定义插入语句
     * 
     * @Options 注解说明：
     * - useGeneratedKeys: 使用数据库生成的主键
     * - keyProperty: 主键属性名
     * - keyColumn: 主键列名
     */
    @Insert("INSERT INTO users (name, email, created_at) VALUES (#{name}, #{email}, NOW())")
    @Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
    fun insert(user: User): Int
    
    /**
     * @Update 注解说明：
     * - 定义更新语句
     */
    @Update("UPDATE users SET name = #{name}, email = #{email} WHERE id = #{id}")
    fun update(user: User): Int
    
    /**
     * @Delete 注解说明：
     * - 定义删除语句
     */
    @Delete("DELETE FROM users WHERE id = #{id}")
    fun deleteById(id: Long): Int
    
    /**
     * 使用 XML 映射文件（复杂SQL）
     * 对应 resources/mapper/UserMapper.xml
     */
    fun findByComplexCondition(params: Map<String, Any>): List<User>
    
    /**
     * @Results 和 @Result 注解说明：
     * - 自定义结果映射
     * - 处理字段名和属性名不一致的情况
     */
    @Select("SELECT id, user_name, user_email, created_at FROM users WHERE id = #{id}")
    @Results(
        id = "userResultMap",
        value = [
            Result(column = "id", property = "id", id = true),
            Result(column = "user_name", property = "name"),
            Result(column = "user_email", property = "email"),
            Result(column = "created_at", property = "createdAt")
        ]
    )
    fun findByIdWithMapping(id: Long): User?
    
    /**
     * 复用结果映射
     */
    @Select("SELECT id, user_name, user_email, created_at FROM users")
    @ResultMap("userResultMap")
    fun findAllWithMapping(): List<User>
}

data class User(
    var id: Long = 0,
    var name: String = "",
    var email: String = "",
    var createdAt: LocalDateTime? = null
)
```

### 5.4.2 @MapperScan

批量扫描 Mapper 接口。

```kotlin
/**
 * @MapperScan 注解说明：
 * - 批量扫描 Mapper 接口，不需要每个 Mapper 都加 @Mapper 注解
 * - 通常放在启动类上
 * 
 * 重要参数：
 * - value/basePackages: 扫描的包路径
 * - basePackageClasses: 通过类指定扫描包
 * - annotationClass: 只扫描带特定注解的接口
 * - markerInterface: 只扫描实现特定接口的接口
 */
@SpringBootApplication
@MapperScan(
    basePackages = ["com.example.demo.mapper"],
    // 或者通过类指定
    // basePackageClasses = [UserMapper::class]
)
class DemoApplication

fun main(args: Array<String>) {
    runApplication<DemoApplication>(*args)
}
```

## 5.5 注入与配置注解

### 5.5.1 @Autowired

自动装配注解，Spring 会自动注入依赖。

```kotlin
/**
 * @Autowired 注解说明：
 * - 自动装配 Bean
 * - 默认按类型注入
 * 
 * 重要参数：
 * - required: 是否必需（默认true）
 */

// 1. 构造器注入（推荐，Kotlin中可省略@Autowired）
@Service
class UserService(
    private val userMapper: UserMapper,      // 自动注入
    private val emailService: EmailService
) {
    fun getUser(id: Long) = userMapper.findById(id)
}

// 2. Setter注入
@Service
class OrderService {
    private lateinit var userService: UserService
    
    @Autowired
    fun setUserService(service: UserService) {
        this.userService = service
    }
}

// 3. 字段注入（不推荐）
@Service
class ProductService {
    @Autowired
    private lateinit var productMapper: ProductMapper
}

// 4. 可选注入
@Service
class NotificationService {
    // 如果 SmsService 不存在，不会报错，而是保持为 null
    @Autowired(required = false)
    private var smsService: SmsService? = null
    
    fun sendNotification(message: String) {
        smsService?.send(message) ?: println("SMS service not available")
    }
}

// 5. 注入集合
@Service
class MultiServiceProcessor {
    @Autowired
    private lateinit var allProcessors: List<DataProcessor>
    
    fun processAll(data: String) {
        allProcessors.forEach { it.process(data) }
    }
}

// 6. 注入Map（key是Bean名称）
@Service
class ProcessorManager {
    @Autowired
    private lateinit var processorMap: Map<String, DataProcessor>
    
    fun getProcessor(name: String) = processorMap[name]
}
```

### 5.5.2 @Value

注入配置值。

```kotlin
/**
 * @Value 注解说明：
 * - 注入配置文件中的值
 * - 支持SpEL表达式
 * 
 * 语法：
 * - ${property.name}: 注入配置值
 * - #{expression}: SpEL表达式
 */
@Component
class AppProperties {
    
    // 1. 注入简单值
    @Value("\${app.name}")
    private lateinit var appName: String
    
    @Value("\${app.version}")
    private lateinit var appVersion: String
    
    // 2. 带默认值
    @Value("\${app.timeout:5000}")
    private var timeout: Int = 0
    
    @Value("\${app.enabled:true}")
    private var enabled: Boolean = false
    
    // 3. 注入列表
    @Value("\${app.allowed-origins}")
    private lateinit var allowedOrigins: List<String>
    // 配置: app.allowed-origins=http://localhost:3000,https://example.com
    
    // 4. 注入Map
    @Value("#{{\{'key1':'value1', 'key2':'value2'\}}}")
    private lateinit var configMap: Map<String, String>
    
    // 5. SpEL表达式
    @Value("#{systemProperties['user.name']}")
    private lateinit var userName: String
    
    @Value("#{T(java.lang.Math).random() * 100}")
    private var randomNumber: Double = 0.0
    
    // 6. 引用其他Bean的属性
    @Value("#{userService.userCount}")
    private var userCount: Int = 0
    
    // 7. 环境变量
    @Value("\${JAVA_HOME}")
    private lateinit var javaHome: String
    
    fun printConfig() {
        println("App Name: $appName")
        println("Version: $appVersion")
        println("Timeout: $timeout")
        println("Enabled: $enabled")
    }
}
```

### 5.5.3 @ConfigurationProperties

类型安全的配置属性绑定。

```kotlin
/**
 * @ConfigurationProperties 注解说明：
 * - 将配置文件中的属性绑定到对象
 * - 类型安全，支持验证
 * - 比@Value更强大
 * 
 * 重要参数：
 * - prefix: 配置前缀
 * - ignoreInvalidFields: 是否忽略无效字段（默认false）
 * - ignoreUnknownFields: 是否忽略未知字段（默认true）
 */

/**
 * 应用配置属性
 */
@ConfigurationProperties(prefix = "app")
data class ApplicationProperties(
    var name: String = "",
    var version: String = "",
    var description: String = "",
    var timeout: Int = 5000,
    var enabled: Boolean = true,
    var allowedOrigins: List<String> = emptyList(),
    var admin: AdminConfig = AdminConfig(),
    var database: DatabaseConfig = DatabaseConfig()
)

data class AdminConfig(
    var username: String = "",
    var email: String = ""
)

data class DatabaseConfig(
    var url: String = "",
    var username: String = "",
    var password: String = "",
    var maxConnections: Int = 10
)

/**
 * 配置文件 application.yml：
 */
/*
app:
  name: My Application
  version: 1.0.0
  description: A demo application
  timeout: 3000
  enabled: true
  allowed-origins:
    - http://localhost:3000
    - https://example.com
  admin:
    username: admin
    email: admin@example.com
  database:
    url: jdbc:mysql://localhost:3306/demo
    username: root
    password: password
    max-connections: 20
*/

/**
 * 启用配置属性
 */
@Configuration
@EnableConfigurationProperties(ApplicationProperties::class)
class AppConfig

/**
 * 或者在启动类上启用
 */
@SpringBootApplication
@EnableConfigurationProperties(ApplicationProperties::class)
class DemoApplication

/**
 * 使用配置属性
 */
@Service
class MyService(
    private val appProperties: ApplicationProperties  // 自动注入
) {
    fun printConfig() {
        println("App Name: ${appProperties.name}")
        println("Version: ${appProperties.version}")
        println("Timeout: ${appProperties.timeout}")
        println("Admin Email: ${appProperties.admin.email}")
        println("DB URL: ${appProperties.database.url}")
    }
}
```

### 5.5.4 @Conditional 系列注解

条件化配置，我们在第4章已经介绍过，这里再详细总结：

```kotlin
/**
 * 常用条件注解总结
 */

// 1. 基于类存在性
@ConditionalOnClass(RedisOperations::class)
class RedisConfig

// 2. 基于Bean存在性
@ConditionalOnBean(DataSource::class)
class DataSourceDependentConfig

// 3. 基于Bean缺失
@ConditionalOnMissingBean(ObjectMapper::class)
class ObjectMapperConfig {
    @Bean
    fun objectMapper() = ObjectMapper()
}

// 4. 基于配置属性
@ConditionalOnProperty(
    prefix = "feature",
    name = ["enabled"],
    havingValue = "true",
    matchIfMissing = false
)
class FeatureConfig

// 5. 基于Profile
@Profile("prod")
class ProductionConfig

// 6. 基于Web应用类型
@ConditionalOnWebApplication(type = ConditionalOnWebApplication.Type.SERVLET)
class ServletConfig

// 7. 自定义条件
@Conditional(CustomCondition::class)
class CustomConfig

class CustomCondition : Condition {
    override fun matches(context: ConditionContext, metadata: AnnotatedTypeMetadata): Boolean {
        // 自定义条件逻辑
        return System.getProperty("custom.enabled") == "true"
    }
}
```

## 5.6 事务注解

### 5.6.1 @Transactional

声明式事务管理。

```kotlin
/**
 * @Transactional 注解说明：
 * - 声明式事务管理
 * - 可以用在类或方法上
 * - 类上：所有public方法都有事务
 * - 方法上：只有该方法有事务
 * 
 * 重要参数：
 * - propagation: 事务传播行为
 * - isolation: 事务隔离级别
 * - timeout: 超时时间（秒）
 * - readOnly: 是否只读事务
 * - rollbackFor: 遇到哪些异常回滚
 * - noRollbackFor: 遇到哪些异常不回滚
 */
@Service
class TransactionService(
    private val userMapper: UserMapper,
    private val orderMapper: OrderMapper
) {
    
    /**
     * 基本用法
     * 方法执行成功：提交事务
     * 方法抛出异常：回滚事务
     */
    @Transactional
    fun createUserAndOrder(user: User, order: Order) {
        userMapper.insert(user)
        orderMapper.insert(order)
        // 如果这里抛出异常，两个插入操作都会回滚
    }
    
    /**
     * 只读事务
     * 优化：不需要维护事务日志
     */
    @Transactional(readOnly = true)
    fun getUserOrders(userId: Long): List<Order> {
        return orderMapper.findByUserId(userId)
    }
    
    /**
     * 指定超时时间（秒）
     */
    @Transactional(timeout = 30)
    fun longRunningOperation() {
        // 如果超过30秒，抛出异常并回滚
    }
    
    /**
     * 指定回滚的异常类型
     * 默认只回滚运行时异常（RuntimeException）
     * 如果需要检查异常也回滚，需要显式指定
     */
    @Transactional(rollbackFor = [Exception::class])
    fun operationWithCheckedException() {
        // 即使抛出检查异常也会回滚
    }
    
    /**
     * 指定不回滚的异常
     */
    @Transactional(noRollbackFor = [BusinessException::class])
    fun operationWithBusinessException() {
        // 抛出 BusinessException 不会回滚
    }
    
    /**
     * 事务传播行为
     */
    
    // REQUIRED（默认）：如果当前存在事务，加入该事务；否则新建事务
    @Transactional(propagation = Propagation.REQUIRED)
    fun required() {
        // ...
    }
    
    // REQUIRES_NEW：总是新建事务，如果当前存在事务，挂起当前事务
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    fun requiresNew() {
        // 独立的事务，不受外部事务影响
    }
    
    // NESTED：如果当前存在事务，在嵌套事务中执行
    @Transactional(propagation = Propagation.NESTED)
    fun nested() {
        // 嵌套事务可以独立回滚，不影响外部事务
    }
    
    // SUPPORTS：如果当前存在事务，加入该事务；否则以非事务方式执行
    @Transactional(propagation = Propagation.SUPPORTS)
    fun supports() {
        // ...
    }
    
    // NOT_SUPPORTED：以非事务方式执行，如果当前存在事务，挂起当前事务
    @Transactional(propagation = Propagation.NOT_SUPPORTED)
    fun notSupported() {
        // ...
    }
    
    // MANDATORY：如果当前存在事务，加入该事务；否则抛出异常
    @Transactional(propagation = Propagation.MANDATORY)
    fun mandatory() {
        // 必须在事务中调用
    }
    
    // NEVER：以非事务方式执行，如果当前存在事务，抛出异常
    @Transactional(propagation = Propagation.NEVER)
    fun never() {
        // 不能在事务中调用
    }
    
    /**
     * 事务隔离级别
     */
    
    // READ_UNCOMMITTED：最低级别，可能读到未提交的数据（脏读）
    @Transactional(isolation = Isolation.READ_UNCOMMITTED)
    fun readUncommitted() {}
    
    // READ_COMMITTED：避免脏读，但可能出现不可重复读
    @Transactional(isolation = Isolation.READ_COMMITTED)
    fun readCommitted() {}
    
    // REPEATABLE_READ：避免脏读和不可重复读，但可能出现幻读
    @Transactional(isolation = Isolation.REPEATABLE_READ)
    fun repeatableRead() {}
    
    // SERIALIZABLE：最高级别，完全串行化，避免所有并发问题，但性能最差
    @Transactional(isolation = Isolation.SERIALIZABLE)
    fun serializable() {}
}

/**
 * 实际业务示例
 */
@Service
class OrderService(
    private val orderMapper: OrderMapper,
    private val productMapper: ProductMapper,
    private val inventoryService: InventoryService,
    private val paymentService: PaymentService
) {
    
    /**
     * 创建订单的完整流程
     * 1. 创建订单记录
     * 2. 减少库存
     * 3. 处理支付
     * 
     * 任何一步失败，都会回滚所有操作
     */
    @Transactional(rollbackFor = [Exception::class])
    fun createOrder(orderRequest: OrderRequest): Order {
        // 1. 创建订单
        val order = Order(
            userId = orderRequest.userId,
            productId = orderRequest.productId,
            quantity = orderRequest.quantity,
            totalPrice = calculateTotalPrice(orderRequest)
        )
        orderMapper.insert(order)
        
        // 2. 减少库存（可能抛出库存不足异常）
        inventoryService.decreaseStock(
            orderRequest.productId,
            orderRequest.quantity
        )
        
        // 3. 处理支付（可能抛出支付失败异常）
        paymentService.processPayment(
            order.id,
            order.totalPrice
        )
        
        // 所有操作成功，提交事务
        return order
    }
    
    private fun calculateTotalPrice(request: OrderRequest): Double {
        val product = productMapper.findById(request.productId)
        return product.price * request.quantity
    }
}

data class Order(
    var id: Long = 0,
    val userId: Long,
    val productId: Long,
    val quantity: Int,
    val totalPrice: Double,
    val createdAt: LocalDateTime = LocalDateTime.now()
)

data class OrderRequest(
    val userId: Long,
    val productId: Long,
    val quantity: Int
)

class BusinessException(message: String) : RuntimeException(message)
```

## 5.7 常用组合案例：Service + Mapper + Entity 流程实战

让我们通过一个完整的案例，展示如何组合使用各种注解来实现一个标准的业务模块。

### 5.7.1 完整的用户管理模块

```kotlin
/**
 * ============= 1. Entity 层 =============
 * 数据实体类
 */
data class User(
    var id: Long = 0,
    var username: String = "",
    var email: String = "",
    var password: String = "",
    var status: Int = 1,  // 1: 正常, 0: 禁用
    var createdAt: LocalDateTime? = null,
    var updatedAt: LocalDateTime? = null
)

/**
 * ============= 2. DTO 层 =============
 * 数据传输对象
 */

// 创建用户请求
data class CreateUserRequest(
    val username: String,
    val email: String,
    val password: String
)

// 更新用户请求
data class UpdateUserRequest(
    val username: String?,
    val email: String?
)

// 用户响应
data class UserResponse(
    val id: Long,
    val username: String,
    val email: String,
    val status: Int,
    val createdAt: LocalDateTime?
) {
    companion object {
        fun from(user: User) = UserResponse(
            id = user.id,
            username = user.username,
            email = user.email,
            status = user.status,
            createdAt = user.createdAt
        )
    }
}

// 分页请求
data class PageRequest(
    val page: Int = 1,
    val size: Int = 10
)

// 分页响应
data class PageResponse<T>(
    val items: List<T>,
    val total: Long,
    val page: Int,
    val size: Int,
    val totalPages: Int
)

/**
 * ============= 3. Mapper 层 =============
 * 数据访问层
 */
@Mapper
interface UserMapper {
    
    @Select("SELECT * FROM users WHERE id = #{id}")
    fun findById(id: Long): User?
    
    @Select("SELECT * FROM users WHERE username = #{username}")
    fun findByUsername(username: String): User?
    
    @Select("SELECT * FROM users WHERE email = #{email}")
    fun findByEmail(email: String): User?
    
    @Select("""
        SELECT * FROM users
        WHERE 1=1
        <if test="keyword != null">
            AND (username LIKE CONCAT('%', #{keyword}, '%')
                 OR email LIKE CONCAT('%', #{keyword}, '%'))
        </if>
        ORDER BY created_at DESC
        LIMIT #{offset}, #{limit}
    """)
    fun findByPage(keyword: String?, offset: Int, limit: Int): List<User>
    
    @Select("""
        SELECT COUNT(*) FROM users
        WHERE 1=1
        <if test="keyword != null">
            AND (username LIKE CONCAT('%', #{keyword}, '%')
                 OR email LIKE CONCAT('%', #{keyword}, '%'))
        </if>
    """)
    fun countByKeyword(keyword: String?): Long
    
    @Insert("""
        INSERT INTO users (username, email, password, status, created_at, updated_at)
        VALUES (#{username}, #{email}, #{password}, #{status}, NOW(), NOW())
    """)
    @Options(useGeneratedKeys = true, keyProperty = "id")
    fun insert(user: User): Int
    
    @Update("""
        UPDATE users
        SET username = #{username},
            email = #{email},
            updated_at = NOW()
        WHERE id = #{id}
    """)
    fun update(user: User): Int
    
    @Update("UPDATE users SET status = #{status}, updated_at = NOW() WHERE id = #{id}")
    fun updateStatus(id: Long, status: Int): Int
    
    @Delete("DELETE FROM users WHERE id = #{id}")
    fun deleteById(id: Long): Int
}

/**
 * ============= 4. Service 层 =============
 * 业务逻辑层
 */
@Service
class UserService(
    private val userMapper: UserMapper,
    private val passwordEncoder: PasswordEncoder
) {
    
    /**
     * 创建用户
     */
    @Transactional(rollbackFor = [Exception::class])
    fun createUser(request: CreateUserRequest): UserResponse {
        // 1. 验证用户名是否已存在
        userMapper.findByUsername(request.username)?.let {
            throw BusinessException("用户名已存在")
        }
        
        // 2. 验证邮箱是否已存在
        userMapper.findByEmail(request.email)?.let {
            throw BusinessException("邮箱已被注册")
        }
        
        // 3. 创建用户对象
        val user = User(
            username = request.username,
            email = request.email,
            password = passwordEncoder.encode(request.password),
            status = 1
        )
        
        // 4. 保存到数据库
        userMapper.insert(user)
        
        // 5. 返回响应
        return UserResponse.from(user)
    }
    
    /**
     * 根据ID获取用户
     */
    @Transactional(readOnly = true)
    fun getUserById(id: Long): UserResponse {
        val user = userMapper.findById(id)
            ?: throw NotFoundException("用户不存在")
        
        return UserResponse.from(user)
    }
    
    /**
     * 更新用户信息
     */
    @Transactional(rollbackFor = [Exception::class])
    fun updateUser(id: Long, request: UpdateUserRequest): UserResponse {
        // 1. 查询用户
        val user = userMapper.findById(id)
            ?: throw NotFoundException("用户不存在")
        
        // 2. 更新字段
        request.username?.let {
            // 检查新用户名是否已被使用
            userMapper.findByUsername(it)?.let { existing ->
                if (existing.id != id) {
                    throw BusinessException("用户名已存在")
                }
            }
            user.username = it
        }
        
        request.email?.let {
            // 检查新邮箱是否已被使用
            userMapper.findByEmail(it)?.let { existing ->
                if (existing.id != id) {
                    throw BusinessException("邮箱已被注册")
                }
            }
            user.email = it
        }
        
        // 3. 更新数据库
        userMapper.update(user)
        
        // 4. 返回响应
        return UserResponse.from(user)
    }
    
    /**
     * 删除用户
     */
    @Transactional(rollbackFor = [Exception::class])
    fun deleteUser(id: Long) {
        val count = userMapper.deleteById(id)
        if (count == 0) {
            throw NotFoundException("用户不存在")
        }
    }
    
    /**
     * 禁用用户
     */
    @Transactional(rollbackFor = [Exception::class])
    fun disableUser(id: Long) {
        val count = userMapper.updateStatus(id, 0)
        if (count == 0) {
            throw NotFoundException("用户不存在")
        }
    }
    
    /**
     * 启用用户
     */
    @Transactional(rollbackFor = [Exception::class])
    fun enableUser(id: Long) {
        val count = userMapper.updateStatus(id, 1)
        if (count == 0) {
            throw NotFoundException("用户不存在")
        }
    }
    
    /**
     * 分页查询用户
     */
    @Transactional(readOnly = true)
    fun getUsers(keyword: String?, pageRequest: PageRequest): PageResponse<UserResponse> {
        // 1. 计算偏移量
        val offset = (pageRequest.page - 1) * pageRequest.size
        
        // 2. 查询用户列表
        val users = userMapper.findByPage(keyword, offset, pageRequest.size)
        
        // 3. 查询总数
        val total = userMapper.countByKeyword(keyword)
        
        // 4. 转换为响应对象
        val userResponses = users.map { UserResponse.from(it) }
        
        // 5. 计算总页数
        val totalPages = ((total + pageRequest.size - 1) / pageRequest.size).toInt()
        
        // 6. 返回分页响应
        return PageResponse(
            items = userResponses,
            total = total,
            page = pageRequest.page,
            size = pageRequest.size,
            totalPages = totalPages
        )
    }
}

/**
 * ============= 5. Controller 层 =============
 * Web API 控制层
 */
@RestController
@RequestMapping("/api/users")
class UserController(
    private val userService: UserService
) {
    
    /**
     * 创建用户
     * POST /api/users
     */
    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    fun createUser(@RequestBody request: CreateUserRequest): ApiResponse<UserResponse> {
        val user = userService.createUser(request)
        return ApiResponse.success(user, "用户创建成功")
    }
    
    /**
     * 获取用户详情
     * GET /api/users/{id}
     */
    @GetMapping("/{id}")
    fun getUser(@PathVariable id: Long): ApiResponse<UserResponse> {
        val user = userService.getUserById(id)
        return ApiResponse.success(user)
    }
    
    /**
     * 更新用户
     * PUT /api/users/{id}
     */
    @PutMapping("/{id}")
    fun updateUser(
        @PathVariable id: Long,
        @RequestBody request: UpdateUserRequest
    ): ApiResponse<UserResponse> {
        val user = userService.updateUser(id, request)
        return ApiResponse.success(user, "用户更新成功")
    }
    
    /**
     * 删除用户
     * DELETE /api/users/{id}
     */
    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    fun deleteUser(@PathVariable id: Long) {
        userService.deleteUser(id)
    }
    
    /**
     * 禁用用户
     * POST /api/users/{id}/disable
     */
    @PostMapping("/{id}/disable")
    fun disableUser(@PathVariable id: Long): ApiResponse<Void> {
        userService.disableUser(id)
        return ApiResponse.success(message = "用户已禁用")
    }
    
    /**
     * 启用用户
     * POST /api/users/{id}/enable
     */
    @PostMapping("/{id}/enable")
    fun enableUser(@PathVariable id: Long): ApiResponse<Void> {
        userService.enableUser(id)
        return ApiResponse.success(message = "用户已启用")
    }
    
    /**
     * 分页查询用户
     * GET /api/users?keyword=xxx&page=1&size=10
     */
    @GetMapping
    fun getUsers(
        @RequestParam(required = false) keyword: String?,
        @RequestParam(defaultValue = "1") page: Int,
        @RequestParam(defaultValue = "10") size: Int
    ): ApiResponse<PageResponse<UserResponse>> {
        val pageRequest = PageRequest(page, size)
        val pageResponse = userService.getUsers(keyword, pageRequest)
        return ApiResponse.success(pageResponse)
    }
}

/**
 * ============= 6. 统一响应封装 =============
 */
data class ApiResponse<T>(
    val code: Int,
    val message: String,
    val data: T?
) {
    companion object {
        fun <T> success(data: T? = null, message: String = "操作成功"): ApiResponse<T> {
            return ApiResponse(200, message, data)
        }
        
        fun <T> error(code: Int = 500, message: String = "操作失败"): ApiResponse<T> {
            return ApiResponse(code, message, null)
        }
    }
}

/**
 * ============= 7. 异常类 =============
 */
class NotFoundException(message: String) : RuntimeException(message)

/**
 * ============= 8. 配置类 =============
 */
@Configuration
class SecurityConfig {
    
    /**
     * 密码编码器
     */
    @Bean
    fun passwordEncoder(): PasswordEncoder {
        return BCryptPasswordEncoder()
    }
}

interface PasswordEncoder {
    fun encode(rawPassword: String): String
    fun matches(rawPassword: String, encodedPassword: String): Boolean
}

class BCryptPasswordEncoder : PasswordEncoder {
    override fun encode(rawPassword: String): String {
        // 实际项目中使用 Spring Security 的 BCryptPasswordEncoder
        return rawPassword  // 简化示例
    }
    
    override fun matches(rawPassword: String, encodedPassword: String): Boolean {
        return rawPassword == encodedPassword  // 简化示例
    }
}
```

## 5.8 本章小结

在本章中，我们系统学习了以下内容：

✅ **应用层注解**：`@SpringBootApplication`、`@Configuration`、`@Bean`
✅ **组件层注解**：`@Component`、`@Service`、`@Repository`、`@Controller`、`@RestController`
✅ **控制层注解**：请求映射、参数绑定、响应控制、跨域配置
✅ **数据层注解**：`@Mapper`、`@Select`、`@Insert`、`@Update`、`@Delete`
✅ **注入与配置注解**：`@Autowired`、`@Value`、`@ConfigurationProperties`
✅ **事务注解**：`@Transactional` 及其各种配置
✅ **完整案例**：Service + Mapper + Entity 的标准流程

**关键要点：**
- 注解是 Spring Boot 的核心，理解每个注解的作用至关重要
- 构造器注入是推荐的依赖注入方式
- `@ConfigurationProperties` 比 `@Value` 更适合复杂配置
- 事务要注意传播行为和隔离级别
- 分层架构：Controller → Service → Mapper → Entity

**下一章预告：**
在下一章中，我们将深入学习 RESTful API 的设计和实现，包括请求处理、数据验证、错误处理等Web开发的核心技能。

---

# 第6章：Web 层：RESTful API 实战

本章将深入学习如何使用 Spring Boot + Kotlin 设计和实现规范的 RESTful API，包括请求处理、数据验证、全局返回体封装、异常处理等企业开发中的核心技能。

## 6.1 RESTful API 设计原则

### 6.1.1 什么是 RESTful API

REST（Representational State Transfer）是一种软件架构风格，用于设计网络应用程序的API。

**核心原则：**
1. **资源（Resource）**：API 操作的对象，用 URL 表示
2. **表现层（Representation）**：资源的表现形式（JSON、XML等）
3. **状态转移（State Transfer）**：通过 HTTP 方法操作资源

### 6.1.2 HTTP 方法与 CRUD 对应关系

| HTTP 方法 | CRUD 操作 | 说明 | 幂等性 |
|-----------|----------|------|--------|
| GET | Read | 获取资源 | ✅ |
| POST | Create | 创建资源 | ❌ |
| PUT | Update | 完整更新资源 | ✅ |
| PATCH | Update | 部分更新资源 | ❌ |
| DELETE | Delete | 删除资源 | ✅ |

### 6.1.3 URL 设计规范

```
正确示例：
GET    /api/users          # 获取用户列表
GET    /api/users/1        # 获取ID为1的用户
POST   /api/users          # 创建用户
PUT    /api/users/1        # 更新ID为1的用户
DELETE /api/users/1        # 删除ID为1的用户

GET    /api/users/1/orders # 获取用户1的订单列表
POST   /api/users/1/orders # 为用户1创建订单

错误示例：
GET    /api/getUsers       # ❌ 不要在URL中使用动词
POST   /api/createUser     # ❌ 使用HTTP方法表示操作
GET    /api/users/delete/1 # ❌ 删除应该用 DELETE 方法
```

### 6.1.4 HTTP 状态码规范

```kotlin
// 成功响应
200 OK              // 请求成功
201 Created         // 创建成功
204 No Content      // 删除成功（无返回内容）

// 客户端错误
400 Bad Request     // 请求参数错误
401 Unauthorized    // 未认证
403 Forbidden       // 无权限
404 Not Found       // 资源不存在
409 Conflict        // 资源冲突（如用户名已存在）
422 Unprocessable Entity  // 验证失败

// 服务器错误
500 Internal Server Error  // 服务器内部错误
502 Bad Gateway           // 网关错误
503 Service Unavailable   // 服务不可用
```

## 6.2 创建 RESTful Controller

### 6.2.1 基础 Controller 示例

```kotlin
package com.example.demo.controller

import com.example.demo.dto.request.CreateProductRequest
import com.example.demo.dto.request.UpdateProductRequest
import com.example.demo.dto.response.ApiResponse
import com.example.demo.dto.response.ProductResponse
import com.example.demo.service.ProductService
import org.springframework.http.HttpStatus
import org.springframework.web.bind.annotation.*

/**
 * 产品管理控制器
 * 
 * RESTful API 设计示例
 */
@RestController
@RequestMapping("/api/products")
class ProductController(
    private val productService: ProductService
) {
    
    /**
     * 获取所有产品
     * GET /api/products
     */
    @GetMapping
    fun getAllProducts(): ApiResponse<List<ProductResponse>> {
        val products = productService.getAllProducts()
        return ApiResponse.success(products)
    }
    
    /**
     * 获取单个产品
     * GET /api/products/{id}
     */
    @GetMapping("/{id}")
    fun getProduct(@PathVariable id: Long): ApiResponse<ProductResponse> {
        val product = productService.getProductById(id)
        return ApiResponse.success(product)
    }
    
    /**
     * 创建产品
     * POST /api/products
     */
    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    fun createProduct(
        @RequestBody request: CreateProductRequest
    ): ApiResponse<ProductResponse> {
        val product = productService.createProduct(request)
        return ApiResponse.success(product, "产品创建成功")
    }
    
    /**
     * 完整更新产品
     * PUT /api/products/{id}
     */
    @PutMapping("/{id}")
    fun updateProduct(
        @PathVariable id: Long,
        @RequestBody request: UpdateProductRequest
    ): ApiResponse<ProductResponse> {
        val product = productService.updateProduct(id, request)
        return ApiResponse.success(product, "产品更新成功")
    }
    
    /**
     * 部分更新产品
     * PATCH /api/products/{id}
     */
    @PatchMapping("/{id}")
    fun patchProduct(
        @PathVariable id: Long,
        @RequestBody updates: Map<String, Any>
    ): ApiResponse<ProductResponse> {
        val product = productService.patchProduct(id, updates)
        return ApiResponse.success(product, "产品更新成功")
    }
    
    /**
     * 删除产品
     * DELETE /api/products/{id}
     */
    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    fun deleteProduct(@PathVariable id: Long) {
        productService.deleteProduct(id)
    }
}
```

## 6.3 路径参数、查询参数与请求体

### 6.3.1 路径参数（Path Variable）

用于标识具体的资源。

```kotlin
@RestController
@RequestMapping("/api")
class PathVariableController {
    
    /**
     * 单个路径参数
     * GET /api/users/123
     */
    @GetMapping("/users/{id}")
    fun getUser(@PathVariable id: Long): String {
        return "User ID: $id"
    }
    
    /**
     * 多个路径参数
     * GET /api/users/123/posts/456
     */
    @GetMapping("/users/{userId}/posts/{postId}")
    fun getUserPost(
        @PathVariable userId: Long,
        @PathVariable postId: Long
    ): String {
        return "User: $userId, Post: $postId"
    }
    
    /**
     * 可选路径参数
     * GET /api/files/document.pdf
     * GET /api/files/
     */
    @GetMapping("/files/{filename:.*}")
    fun getFile(
        @PathVariable(required = false) filename: String?
    ): String {
        return "Filename: ${filename ?: "default.txt"}"
    }
    
    /**
     * 路径参数类型转换
     */
    @GetMapping("/products/{id}")
    fun getProduct(@PathVariable id: Long): String {
        // Spring 自动将字符串转换为 Long
        return "Product ID: $id"
    }
    
    /**
     * 自定义路径参数名称
     */
    @GetMapping("/items/{itemId}")
    fun getItem(
        @PathVariable("itemId") id: Long
    ): String {
        return "Item ID: $id"
    }
}
```

### 6.3.2 查询参数（Request Param）

用于过滤、排序、分页等操作。

```kotlin
@RestController
@RequestMapping("/api/products")
class QueryParamController {
    
    /**
     * 基本查询参数
     * GET /api/products/search?keyword=phone&category=electronics
     */
    @GetMapping("/search")
    fun search(
        @RequestParam keyword: String,
        @RequestParam category: String
    ): List<Product> {
        // 搜索逻辑
        return emptyList()
    }
    
    /**
     * 可选查询参数
     * GET /api/products?page=1&size=20&sort=price
     */
    @GetMapping
    fun getProducts(
        @RequestParam(defaultValue = "1") page: Int,
        @RequestParam(defaultValue = "10") size: Int,
        @RequestParam(required = false) sort: String?
    ): PageResponse<Product> {
        // 分页逻辑
        return PageResponse(emptyList(), 0, page, size, 0)
    }
    
    /**
     * 接收多个同名参数
     * GET /api/products/filter?tags=new&tags=hot&tags=sale
     */
    @GetMapping("/filter")
    fun filterByTags(
        @RequestParam tags: List<String>
    ): List<Product> {
        // 标签过滤逻辑
        return emptyList()
    }
    
    /**
     * 接收所有查询参数为 Map
     * GET /api/products/advanced?price_min=100&price_max=500&color=red
     */
    @GetMapping("/advanced")
    fun advancedSearch(
        @RequestParam allParams: Map<String, String>
    ): List<Product> {
        // allParams 包含所有查询参数
        return emptyList()
    }
    
    /**
     * 日期类型参数
     * GET /api/products/between?startDate=2024-01-01&endDate=2024-12-31
     */
    @GetMapping("/between")
    fun getProductsBetween(
        @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") startDate: LocalDate,
        @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") endDate: LocalDate
    ): List<Product> {
        // 日期范围查询
        return emptyList()
    }
}
```

### 6.3.3 请求体（Request Body）

用于传递复杂的数据结构。

```kotlin
/**
 * DTO 定义
 */
data class CreateProductRequest(
    val name: String,
    val description: String,
    val price: Double,
    val categoryId: Long,
    val tags: List<String> = emptyList(),
    val attributes: Map<String, String> = emptyMap()
)

data class UpdateProductRequest(
    val name: String?,
    val description: String?,
    val price: Double?,
    val categoryId: Long?
)

@RestController
@RequestMapping("/api/products")
class RequestBodyController {
    
    /**
     * 接收 JSON 请求体
     * POST /api/products
     * Content-Type: application/json
     * 
     * {
     *   "name": "iPhone 15",
     *   "description": "最新款手机",
     *   "price": 5999.00,
     *   "categoryId": 1,
     *   "tags": ["new", "hot"],
     *   "attributes": {
     *     "color": "black",
     *     "storage": "256GB"
     *   }
     * }
     */
    @PostMapping
    fun createProduct(
        @RequestBody request: CreateProductRequest
    ): ApiResponse<Product> {
        // 创建产品逻辑
        val product = Product(
            name = request.name,
            description = request.description,
            price = request.price
        )
        return ApiResponse.success(product)
    }
    
    /**
     * 混合使用路径参数和请求体
     * PUT /api/products/123
     */
    @PutMapping("/{id}")
    fun updateProduct(
        @PathVariable id: Long,
        @RequestBody request: UpdateProductRequest
    ): ApiResponse<Product> {
        // 更新产品逻辑
        return ApiResponse.success(Product(id = id, name = request.name ?: ""))
    }
    
    /**
     * 混合使用查询参数和请求体
     * POST /api/products/batch?notify=true
     */
    @PostMapping("/batch")
    fun batchCreate(
        @RequestParam(defaultValue = "false") notify: Boolean,
        @RequestBody products: List<CreateProductRequest>
    ): ApiResponse<List<Product>> {
        // 批量创建逻辑
        return ApiResponse.success(emptyList())
    }
}
```

## 6.4 数据验证（Validation）

使用 Hibernate Validator 进行数据验证。

### 6.4.1 添加依赖

```xml
<!-- pom.xml -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-validation</artifactId>
</dependency>
```

### 6.4.2 常用验证注解

```kotlin
import jakarta.validation.constraints.*
import jakarta.validation.Valid

/**
 * 带验证的 DTO
 */
data class CreateUserRequest(
    /**
     * @NotBlank: 不能为 null 且去除空格后长度大于 0
     * @Size: 长度限制
     */
    @field:NotBlank(message = "用户名不能为空")
    @field:Size(min = 3, max = 20, message = "用户名长度必须在3-20之间")
    val username: String,
    
    /**
     * @Email: 必须是有效的邮箱格式
     */
    @field:NotBlank(message = "邮箱不能为空")
    @field:Email(message = "邮箱格式不正确")
    val email: String,
    
    /**
     * @Pattern: 正则表达式验证
     */
    @field:NotBlank(message = "密码不能为空")
    @field:Size(min = 6, max = 20, message = "密码长度必须在6-20之间")
    @field:Pattern(
        regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).+$",
        message = "密码必须包含大小写字母和数字"
    )
    val password: String,
    
    /**
     * @Min, @Max: 数值范围
     */
    @field:Min(value = 0, message = "年龄不能小于0")
    @field:Max(value = 150, message = "年龄不能大于150")
    val age: Int,
    
    /**
     * @DecimalMin, @DecimalMax: 小数范围
     */
    @field:DecimalMin(value = "0.0", message = "工资不能为负数")
    @field:DecimalMax(value = "999999.99", message = "工资过高")
    val salary: Double?,
    
    /**
     * @NotNull: 不能为 null
     */
    @field:NotNull(message = "性别不能为空")
    val gender: Gender,
    
    /**
     * @NotEmpty: 集合不能为空
     */
    @field:NotEmpty(message = "至少选择一个角色")
    val roles: List<String>,
    
    /**
     * @Size: 集合大小限制
     */
    @field:Size(min = 1, max = 5, message = "标签数量必须在1-5之间")
    val tags: List<String>?,
    
    /**
     * @Past, @Future: 日期验证
     */
    @field:Past(message = "生日必须是过去的日期")
    val birthDate: LocalDate?,
    
    /**
     * @Valid: 嵌套对象验证
     */
    @field:Valid
    val address: AddressRequest?
)

data class AddressRequest(
    @field:NotBlank(message = "省份不能为空")
    val province: String,
    
    @field:NotBlank(message = "城市不能为空")
    val city: String,
    
    @field:NotBlank(message = "详细地址不能为空")
    val detail: String
)

enum class Gender {
    MALE, FEMALE, OTHER
}
```

### 6.4.3 在 Controller 中启用验证

```kotlin
@RestController
@RequestMapping("/api/users")
class UserController(
    private val userService: UserService
) {
    
    /**
     * 使用 @Valid 启用验证
     * 验证失败会抛出 MethodArgumentNotValidException
     */
    @PostMapping
    fun createUser(
        @Valid @RequestBody request: CreateUserRequest
    ): ApiResponse<UserResponse> {
        val user = userService.createUser(request)
        return ApiResponse.success(user, "用户创建成功")
    }
    
    /**
     * 验证路径参数
     */
    @GetMapping("/{id}")
    fun getUser(
        @PathVariable @Min(1, message = "ID必须大于0") id: Long
    ): ApiResponse<UserResponse> {
        val user = userService.getUserById(id)
        return ApiResponse.success(user)
    }
    
    /**
     * 验证查询参数
     */
    @GetMapping
    fun getUsers(
        @RequestParam(defaultValue = "1") 
        @Min(value = 1, message = "页码必须大于0") 
        page: Int,
        
        @RequestParam(defaultValue = "10")
        @Min(value = 1, message = "每页数量必须大于0")
        @Max(value = 100, message = "每页数量不能超过100")
        size: Int
    ): ApiResponse<PageResponse<UserResponse>> {
        val users = userService.getUsers(page, size)
        return ApiResponse.success(users)
    }
}
```

### 6.4.4 自定义验证注解

```kotlin
/**
 * 自定义手机号验证注解
 */
@Target(AnnotationTarget.FIELD)
@Retention(AnnotationRetention.RUNTIME)
@Constraint(validatedBy = [PhoneNumberValidator::class])
annotation class PhoneNumber(
    val message: String = "手机号格式不正确",
    val groups: Array<KClass<*>> = [],
    val payload: Array<KClass<out Payload>> = []
)

/**
 * 手机号验证器
 */
class PhoneNumberValidator : ConstraintValidator<PhoneNumber, String> {
    
    private val phonePattern = "^1[3-9]\\d{9}$".toRegex()
    
    override fun isValid(value: String?, context: ConstraintValidatorContext): Boolean {
        if (value == null || value.isBlank()) {
            return true  // 空值由 @NotBlank 处理
        }
        return phonePattern.matches(value)
    }
}

/**
 * 使用自定义验证
 */
data class RegisterRequest(
    @field:NotBlank(message = "用户名不能为空")
    val username: String,
    
    @field:PhoneNumber  // 使用自定义验证注解
    val phone: String
)
```

### 6.4.5 验证组（Validation Groups）

```kotlin
/**
 * 验证组定义
 */
interface CreateGroup
interface UpdateGroup

/**
 * 使用验证组
 */
data class ProductRequest(
    // 创建时不需要ID，更新时需要ID
    @field:Null(groups = [CreateGroup::class], message = "创建时不能指定ID")
    @field:NotNull(groups = [UpdateGroup::class], message = "更新时必须指定ID")
    val id: Long?,
    
    // 创建和更新时都需要名称
    @field:NotBlank(groups = [CreateGroup::class, UpdateGroup::class], message = "名称不能为空")
    val name: String,
    
    // 创建时必须指定价格，更新时可选
    @field:NotNull(groups = [CreateGroup::class], message = "创建时必须指定价格")
    val price: Double?
)

@RestController
@RequestMapping("/api/products")
class ProductValidationController {
    
    /**
     * 创建产品 - 使用 CreateGroup
     */
    @PostMapping
    fun createProduct(
        @Validated(CreateGroup::class) @RequestBody request: ProductRequest
    ): ApiResponse<Product> {
        // 创建逻辑
        return ApiResponse.success(Product(name = request.name, price = request.price ?: 0.0))
    }
    
    /**
     * 更新产品 - 使用 UpdateGroup
     */
    @PutMapping("/{id}")
    fun updateProduct(
        @PathVariable id: Long,
        @Validated(UpdateGroup::class) @RequestBody request: ProductRequest
    ): ApiResponse<Product> {
        // 更新逻辑
        return ApiResponse.success(Product(id = id, name = request.name, price = request.price ?: 0.0))
    }
}
```

## 6.5 全局返回体封装

### 6.5.1 统一返回格式

```kotlin
package com.example.demo.dto.response

/**
 * 统一 API 响应格式
 * 
 * @param T 数据类型
 * @property code 状态码
 * @property message 消息
 * @property data 数据
 * @property timestamp 时间戳
 */
data class ApiResponse<T>(
    val code: Int,
    val message: String,
    val data: T? = null,
    val timestamp: Long = System.currentTimeMillis()
) {
    companion object {
        /**
         * 成功响应
         */
        fun <T> success(data: T? = null, message: String = "操作成功"): ApiResponse<T> {
            return ApiResponse(
                code = 200,
                message = message,
                data = data
            )
        }
        
        /**
         * 失败响应
         */
        fun <T> error(
            code: Int = 500,
            message: String = "操作失败",
            data: T? = null
        ): ApiResponse<T> {
            return ApiResponse(
                code = code,
                message = message,
                data = data
            )
        }
        
        /**
         * 参数错误
         */
        fun <T> badRequest(message: String = "参数错误"): ApiResponse<T> {
            return error(code = 400, message = message)
        }
        
        /**
         * 未授权
         */
        fun <T> unauthorized(message: String = "未授权"): ApiResponse<T> {
            return error(code = 401, message = message)
        }
        
        /**
         * 无权限
         */
        fun <T> forbidden(message: String = "无权限"): ApiResponse<T> {
            return error(code = 403, message = message)
        }
        
        /**
         * 资源不存在
         */
        fun <T> notFound(message: String = "资源不存在"): ApiResponse<T> {
            return error(code = 404, message = message)
        }
    }
}

/**
 * 分页响应
 */
data class PageResponse<T>(
    val items: List<T>,
    val total: Long,
    val page: Int,
    val size: Int,
    val totalPages: Int
) {
    companion object {
        fun <T> of(
            items: List<T>,
            total: Long,
            page: Int,
            size: Int
        ): PageResponse<T> {
            val totalPages = if (size > 0) ((total + size - 1) / size).toInt() else 0
            return PageResponse(items, total, page, size, totalPages)
        }
    }
}
```

### 6.5.2 使用示例

```kotlin
@RestController
@RequestMapping("/api/products")
class ProductController(
    private val productService: ProductService
) {
    
    /**
     * 返回单个对象
     */
    @GetMapping("/{id}")
    fun getProduct(@PathVariable id: Long): ApiResponse<ProductResponse> {
        val product = productService.getProductById(id)
        return ApiResponse.success(product)
    }
    
    /**
     * 返回列表
     */
    @GetMapping
    fun getAllProducts(): ApiResponse<List<ProductResponse>> {
        val products = productService.getAllProducts()
        return ApiResponse.success(products)
    }
    
    /**
     * 返回分页数据
     */
    @GetMapping("/page")
    fun getProductsPage(
        @RequestParam(defaultValue = "1") page: Int,
        @RequestParam(defaultValue = "10") size: Int
    ): ApiResponse<PageResponse<ProductResponse>> {
        val pageResponse = productService.getProductsPage(page, size)
        return ApiResponse.success(pageResponse)
    }
    
    /**
     * 返回空数据（成功但无内容）
     */
    @DeleteMapping("/{id}")
    fun deleteProduct(@PathVariable id: Long): ApiResponse<Void> {
        productService.deleteProduct(id)
        return ApiResponse.success(message = "删除成功")
    }
    
    /**
     * 返回错误信息
     */
    @GetMapping("/check/{name}")
    fun checkProductName(@PathVariable name: String): ApiResponse<Boolean> {
        val exists = productService.existsByName(name)
        return if (exists) {
            ApiResponse.error(code = 409, message = "产品名称已存在", data = false)
        } else {
            ApiResponse.success(true, "产品名称可用")
        }
    }
}
```

## 6.6 常见异常与错误响应

### 6.6.1 自定义异常类

```kotlin
package com.example.demo.exception

/**
 * 业务异常基类
 */
open class BusinessException(
    override val message: String,
    val code: Int = 500
) : RuntimeException(message)

/**
 * 资源未找到异常
 */
class NotFoundException(
    message: String = "资源不存在"
) : BusinessException(message, 404)

/**
 * 参数验证异常
 */
class ValidationException(
    message: String = "参数验证失败"
) : BusinessException(message, 400)

/**
 * 未授权异常
 */
class UnauthorizedException(
    message: String = "未授权，请先登录"
) : BusinessException(message, 401)

/**
 * 无权限异常
 */
class ForbiddenException(
    message: String = "无权限访问"
) : BusinessException(message, 403)

/**
 * 资源冲突异常（如用户名已存在）
 */
class ConflictException(
    message: String = "资源冲突"
) : BusinessException(message, 409)
```

### 6.6.2 全局异常处理器

```kotlin
package com.example.demo.exception

import com.example.demo.dto.response.ApiResponse
import org.slf4j.LoggerFactory
import org.springframework.http.HttpStatus
import org.springframework.validation.BindException
import org.springframework.web.bind.MethodArgumentNotValidException
import org.springframework.web.bind.annotation.ExceptionHandler
import org.springframework.web.bind.annotation.ResponseStatus
import org.springframework.web.bind.annotation.RestControllerAdvice
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException
import jakarta.validation.ConstraintViolationException

/**
 * 全局异常处理器
 * 
 * @RestControllerAdvice 说明：
 * - 全局异常处理
 * - 自动将返回值转换为 JSON
 */
@RestControllerAdvice
class GlobalExceptionHandler {
    
    private val logger = LoggerFactory.getLogger(this::class.java)
    
    /**
     * 处理业务异常
     */
    @ExceptionHandler(BusinessException::class)
    fun handleBusinessException(e: BusinessException): ApiResponse<Void> {
        logger.warn("业务异常: {}", e.message)
        return ApiResponse.error(code = e.code, message = e.message)
    }
    
    /**
     * 处理未找到异常
     */
    @ExceptionHandler(NotFoundException::class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    fun handleNotFoundException(e: NotFoundException): ApiResponse<Void> {
        logger.warn("资源未找到: {}", e.message)
        return ApiResponse.notFound(e.message)
    }
    
    /**
     * 处理参数验证异常（@Valid）
     */
    @ExceptionHandler(MethodArgumentNotValidException::class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    fun handleValidationException(e: MethodArgumentNotValidException): ApiResponse<Map<String, String>> {
        logger.warn("参数验证失败")
        
        // 收集所有验证错误
        val errors = e.bindingResult.fieldErrors.associate {
            it.field to (it.defaultMessage ?: "验证失败")
        }
        
        return ApiResponse.badRequest("参数验证失败").copy(data = errors)
    }
    
    /**
     * 处理绑定异常
     */
    @ExceptionHandler(BindException::class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    fun handleBindException(e: BindException): ApiResponse<Map<String, String>> {
        logger.warn("参数绑定失败")
        
        val errors = e.bindingResult.fieldErrors.associate {
            it.field to (it.defaultMessage ?: "绑定失败")
        }
        
        return ApiResponse.badRequest("参数绑定失败").copy(data = errors)
    }
    
    /**
     * 处理约束违反异常（路径参数、查询参数验证）
     */
    @ExceptionHandler(ConstraintViolationException::class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    fun handleConstraintViolationException(e: ConstraintViolationException): ApiResponse<List<String>> {
        logger.warn("约束验证失败")
        
        val errors = e.constraintViolations.map { it.message }
        
        return ApiResponse.badRequest("参数验证失败").copy(data = errors)
    }
    
    /**
     * 处理参数类型不匹配异常
     */
    @ExceptionHandler(MethodArgumentTypeMismatchException::class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    fun handleTypeMismatchException(e: MethodArgumentTypeMismatchException): ApiResponse<Void> {
        logger.warn("参数类型不匹配: {}", e.message)
        
        val message = "参数 '${e.name}' 类型不正确，期望类型: ${e.requiredType?.simpleName}"
        return ApiResponse.badRequest(message)
    }
    
    /**
     * 处理空指针异常
     */
    @ExceptionHandler(NullPointerException::class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    fun handleNullPointerException(e: NullPointerException): ApiResponse<Void> {
        logger.error("空指针异常", e)
        return ApiResponse.error(message = "服务器内部错误")
    }
    
    /**
     * 处理所有未捕获的异常
     */
    @ExceptionHandler(Exception::class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    fun handleException(e: Exception): ApiResponse<Void> {
        logger.error("未知异常", e)
        return ApiResponse.error(message = "服务器内部错误：${e.message}")
    }
}
```

### 6.6.3 使用异常处理

```kotlin
@Service
class ProductService(
    private val productMapper: ProductMapper
) {
    
    fun getProductById(id: Long): ProductResponse {
        // 抛出业务异常，由全局异常处理器捕获
        val product = productMapper.findById(id)
            ?: throw NotFoundException("产品不存在，ID: $id")
        
        return ProductResponse.from(product)
    }
    
    fun createProduct(request: CreateProductRequest): ProductResponse {
        // 检查产品名称是否已存在
        if (productMapper.existsByName(request.name)) {
            throw ConflictException("产品名称已存在: ${request.name}")
        }
        
        val product = Product(
            name = request.name,
            price = request.price
        )
        productMapper.insert(product)
        
        return ProductResponse.from(product)
    }
    
    fun deleteProduct(id: Long) {
        val count = productMapper.deleteById(id)
        if (count == 0) {
            throw NotFoundException("产品不存在，无法删除，ID: $id")
        }
    }
}
```

## 6.7 本章小结

在本章中，我们学习了：

✅ **RESTful API 设计原则**：资源、HTTP方法、URL规范、状态码
✅ **Controller 开发**：路径参数、查询参数、请求体的使用
✅ **数据验证**：内置验证注解、自定义验证、验证组
✅ **统一返回格式**：ApiResponse 封装、分页响应
✅ **异常处理**：自定义异常、全局异常处理器

**关键要点：**
- RESTful API 要遵循统一的设计规范
- 使用 @Valid 和验证注解确保数据合法性
- 统一的返回格式让前端处理更简单
- 全局异常处理避免重复的异常处理代码
- 合理使用 HTTP 状态码

**下一章预告：**
在下一章中，我们将学习数据访问层的开发，包括 MyBatis 集成、SQL 编写、事务管理等数据库操作的核心技能。

---

# 第7章：数据访问层：MyBatis + 数据库实战

本章将详细讲解如何在 Spring Boot 项目中集成 MyBatis，进行数据库操作，包括实体类定义、Mapper 编写、SQL 语句、分页查询、事务管理等企业开发的核心技能。

## 7.1 为什么企业更常用 MyBatis

### 7.1.1 MyBatis vs JPA

| 特性 | MyBatis | JPA (Hibernate) |
|------|---------|-----------------|
| SQL控制 | 开发者完全控制SQL | ORM自动生成SQL |
| 学习曲线 | 较平缓，熟悉SQL即可 | 较陡峭，需要理解ORM概念 |
| 性能优化 | 容易优化，SQL可见 | 较难优化，需要深入理解 |
| 复杂查询 | 灵活，适合复杂查询 | 复杂查询较困难 |
| 适用场景 | 复杂业务、性能要求高 | 简单CRUD、快速开发 |

**企业选择 MyBatis 的原因：**
- ✅ SQL 可控性强，便于优化
- ✅ 学习成本低，DBA 可直接参与
- ✅ 适合复杂的业务查询
- ✅ 中国企业习惯和传统

## 7.2 集成 MyBatis

### 7.2.1 添加依赖

```xml
<!-- pom.xml -->
<dependencies>
    <!-- MyBatis Spring Boot Starter -->
    <dependency>
        <groupId>org.mybatis.spring.boot</groupId>
        <artifactId>mybatis-spring-boot-starter</artifactId>
        <version>3.0.3</version>
    </dependency>
    
    <!-- MySQL 驱动 -->
    <dependency>
        <groupId>com.mysql</groupId>
        <artifactId>mysql-connector-j</artifactId>
        <scope>runtime</scope>
    </dependency>
    
    <!-- HikariCP 连接池（Spring Boot 默认） -->
    <dependency>
        <groupId>com.zaxxer</groupId>
        <artifactId>HikariCP</artifactId>
    </dependency>
    
    <!-- H2 数据库（用于开发和测试） -->
    <dependency>
        <groupId>com.h2database</groupId>
        <artifactId>h2</artifactId>
        <scope>runtime</scope>
    </dependency>
</dependencies>
```

### 7.2.2 数据库配置

**application.yml**

```yaml
spring:
  # 数据源配置
  datasource:
    # MySQL 配置
    driver-class-name: com.mysql.cj.jdbc.Driver
    url: jdbc:mysql://localhost:3306/demo?useSSL=false&serverTimezone=Asia/Shanghai&characterEncoding=utf8&allowPublicKeyRetrieval=true
    username: root
    password: password
    
    # HikariCP 连接池配置
    hikari:
      # 连接池名称
      pool-name: HikariPool
      # 最小空闲连接数
      minimum-idle: 5
      # 最大连接数
      maximum-pool-size: 20
      # 连接超时时间（毫秒）
      connection-timeout: 30000
      # 空闲连接超时时间（毫秒）
      idle-timeout: 600000
      # 连接最大生命周期（毫秒）
      max-lifetime: 1800000
      # 连接测试查询
      connection-test-query: SELECT 1

# MyBatis 配置
mybatis:
  # Mapper XML 文件位置
  mapper-locations: classpath:mapper/*.xml
  # 实体类包路径（别名）
  type-aliases-package: com.example.demo.entity
  # MyBatis 配置
  configuration:
    # 开启驼峰命名转换（user_name -> userName）
    map-underscore-to-camel-case: true
    # 日志实现
    log-impl: org.apache.ibatis.logging.slf4j.Slf4jImpl
    # 开启二级缓存
    cache-enabled: true
    # 延迟加载
    lazy-loading-enabled: false
    # 积极的延迟加载
    aggressive-lazy-loading: false
    # 返回 null 时也创建对象
    return-instance-for-empty-row: false
```

**H2 数据库配置（开发/测试环境）**

```yaml
# application-dev.yml
spring:
  datasource:
    driver-class-name: org.h2.Driver
    url: jdbc:h2:mem:testdb;MODE=MySQL;DATABASE_TO_LOWER=TRUE
    username: sa
    password: 
  
  # H2 控制台（可选）
  h2:
    console:
      enabled: true
      path: /h2-console
      settings:
        web-allow-others: true

# 初始化数据库
  sql:
    init:
      mode: always
      schema-locations: classpath:sql/schema.sql
      data-locations: classpath:sql/data.sql
```

### 7.2.3 创建数据库表

**schema.sql**

```sql
-- 创建用户表
CREATE TABLE IF NOT EXISTS users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '用户ID',
    username VARCHAR(50) NOT NULL UNIQUE COMMENT '用户名',
    password VARCHAR(100) NOT NULL COMMENT '密码',
    email VARCHAR(100) NOT NULL UNIQUE COMMENT '邮箱',
    phone VARCHAR(20) COMMENT '手机号',
    age INT COMMENT '年龄',
    gender TINYINT COMMENT '性别：0-女，1-男，2-其他',
    status TINYINT DEFAULT 1 COMMENT '状态：0-禁用，1-正常',
    avatar VARCHAR(255) COMMENT '头像URL',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    deleted_at DATETIME COMMENT '删除时间（软删除）',
    INDEX idx_username (username),
    INDEX idx_email (email),
    INDEX idx_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- 创建角色表
CREATE TABLE IF NOT EXISTS roles (
    id BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '角色ID',
    name VARCHAR(50) NOT NULL UNIQUE COMMENT '角色名称',
    code VARCHAR(50) NOT NULL UNIQUE COMMENT '角色编码',
    description VARCHAR(200) COMMENT '角色描述',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- 创建用户角色关联表
CREATE TABLE IF NOT EXISTS user_roles (
    id BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID',
    user_id BIGINT NOT NULL COMMENT '用户ID',
    role_id BIGINT NOT NULL COMMENT '角色ID',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    UNIQUE KEY uk_user_role (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户角色关联表';

-- 创建产品表
CREATE TABLE IF NOT EXISTS products (
    id BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '产品ID',
    name VARCHAR(100) NOT NULL COMMENT '产品名称',
    description TEXT COMMENT '产品描述',
    price DECIMAL(10, 2) NOT NULL COMMENT '价格',
    stock INT DEFAULT 0 COMMENT '库存',
    category_id BIGINT COMMENT '分类ID',
    status TINYINT DEFAULT 1 COMMENT '状态：0-下架，1-上架',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    INDEX idx_name (name),
    INDEX idx_category (category_id),
    INDEX idx_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='产品表';
```

**data.sql（测试数据）**

```sql
-- 插入测试用户
INSERT INTO users (username, password, email, phone, age, gender, status) VALUES
('admin', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iAt6Z5EH', 'admin@example.com', '13800138000', 30, 1, 1),
('user1', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iAt6Z5EH', 'user1@example.com', '13800138001', 25, 0, 1),
('user2', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iAt6Z5EH', 'user2@example.com', '13800138002', 28, 1, 1);

-- 插入测试角色
INSERT INTO roles (name, code, description) VALUES
('管理员', 'ADMIN', '系统管理员'),
('普通用户', 'USER', '普通用户'),
('VIP用户', 'VIP', 'VIP会员');

-- 插入用户角色关联
INSERT INTO user_roles (user_id, role_id) VALUES
(1, 1),  -- admin 是管理员
(2, 2),  -- user1 是普通用户
(3, 3);  -- user2 是VIP用户

-- 插入测试产品
INSERT INTO products (name, description, price, stock, status) VALUES
('iPhone 15 Pro', '最新款苹果手机', 7999.00, 100, 1),
('MacBook Pro', '14英寸笔记本电脑', 14999.00, 50, 1),
('AirPods Pro', '主动降噪耳机', 1999.00, 200, 1);
```

## 7.3 定义实体类（Kotlin Data Class）

### 7.3.1 用户实体类

```kotlin
package com.example.demo.entity

import java.time.LocalDateTime

/**
 * 用户实体类
 * 
 * Kotlin data class 特点：
 * - 自动生成 equals()、hashCode()、toString()、copy() 方法
 * - 非常适合作为实体类和 DTO
 * 
 * 注意事项：
 * - 属性使用 var（可变）以支持 MyBatis 的字段赋值
 * - 提供默认值以支持无参构造函数
 */
data class User(
    /**
     * 用户ID
     * 主键，自增
     */
    var id: Long = 0,
    
    /**
     * 用户名
     * 唯一索引
     */
    var username: String = "",
    
    /**
     * 密码（加密后）
     */
    var password: String = "",
    
    /**
     * 邮箱
     * 唯一索引
     */
    var email: String = "",
    
    /**
     * 手机号
     */
    var phone: String? = null,
    
    /**
     * 年龄
     */
    var age: Int? = null,
    
    /**
     * 性别：0-女，1-男，2-其他
     */
    var gender: Int? = null,
    
    /**
     * 状态：0-禁用，1-正常
     */
    var status: Int = 1,
    
    /**
     * 头像URL
     */
    var avatar: String? = null,
    
    /**
     * 创建时间
     * MyBatis 会自动映射 created_at -> createdAt（驼峰命名）
     */
    var createdAt: LocalDateTime? = null,
    
    /**
     * 更新时间
     */
    var updatedAt: LocalDateTime? = null,
    
    /**
     * 删除时间（软删除）
     */
    var deletedAt: LocalDateTime? = null,
    
    /**
     * 用户角色列表（一对多）
     * 不在数据库表中，通过关联查询获取
     */
    var roles: List<Role>? = null
)

/**
 * 角色实体类
 */
data class Role(
    var id: Long = 0,
    var name: String = "",
    var code: String = "",
    var description: String? = null,
    var createdAt: LocalDateTime? = null,
    var updatedAt: LocalDateTime? = null
)

/**
 * 产品实体类
 */
data class Product(
    var id: Long = 0,
    var name: String = "",
    var description: String? = null,
    var price: Double = 0.0,
    var stock: Int = 0,
    var categoryId: Long? = null,
    var status: Int = 1,
    var createdAt: LocalDateTime? = null,
    var updatedAt: LocalDateTime? = null
)
```

### 7.3.2 实体类设计最佳实践

```kotlin
/**
 * 基础实体类（抽取公共字段）
 */
open class BaseEntity(
    var id: Long = 0,
    var createdAt: LocalDateTime? = null,
    var updatedAt: LocalDateTime? = null,
    var deletedAt: LocalDateTime? = null
)

/**
 * 继承基础实体类
 */
data class Article(
    var title: String = "",
    var content: String = "",
    var authorId: Long = 0,
    var viewCount: Int = 0,
    var status: Int = 1
) : BaseEntity()

/**
 * 使用枚举表示状态
 */
enum class UserStatus(val value: Int, val desc: String) {
    DISABLED(0, "禁用"),
    NORMAL(1, "正常"),
    LOCKED(2, "锁定");
    
    companion object {
        fun fromValue(value: Int): UserStatus? {
            return values().find { it.value == value }
        }
    }
}

/**
 * 使用枚举的实体类
 */
data class UserWithEnum(
    var id: Long = 0,
    var username: String = "",
    var status: UserStatus = UserStatus.NORMAL
)
```

## 7.4 编写 Mapper 接口

### 7.4.1 使用注解方式（简单 SQL）

```kotlin
package com.example.demo.mapper

import com.example.demo.entity.User
import org.apache.ibatis.annotations.*

/**
 * 用户 Mapper 接口
 * 
 * @Mapper 注解说明：
 * - 标识这是 MyBatis 的 Mapper 接口
 * - Spring Boot 会自动扫描并创建代理实现
 * - 也可以在启动类上使用 @MapperScan 批量扫描
 */
@Mapper
interface UserMapper {
    
    /**
     * ========== 查询操作 ==========
     */
    
    /**
     * 根据ID查询用户
     * 
     * @Select 注解说明：
     * - 定义 SELECT 查询语句
     * - #{id} 是 MyBatis 的参数占位符，会自动进行预编译（防止SQL注入）
     * - 返回值可以是实体类或基本类型
     */
    @Select("SELECT * FROM users WHERE id = #{id} AND deleted_at IS NULL")
    fun findById(id: Long): User?
    
    /**
     * 根据用户名查询用户
     */
    @Select("SELECT * FROM users WHERE username = #{username} AND deleted_at IS NULL")
    fun findByUsername(username: String): User?
    
    /**
     * 根据邮箱查询用户
     */
    @Select("SELECT * FROM users WHERE email = #{email} AND deleted_at IS NULL")
    fun findByEmail(email: String): User?
    
    /**
     * 查询所有用户
     */
    @Select("SELECT * FROM users WHERE deleted_at IS NULL ORDER BY created_at DESC")
    fun findAll(): List<User>
    
    /**
     * 根据状态查询用户
     */
    @Select("SELECT * FROM users WHERE status = #{status} AND deleted_at IS NULL")
    fun findByStatus(status: Int): List<User>
    
    /**
     * 模糊查询用户名
     * 
     * 注意：
     * - CONCAT 用于拼接字符串
     * - % 是 SQL 的通配符
     */
    @Select("SELECT * FROM users WHERE username LIKE CONCAT('%', #{keyword}, '%') AND deleted_at IS NULL")
    fun searchByUsername(keyword: String): List<User>
    
    /**
     * 统计用户数量
     */
    @Select("SELECT COUNT(*) FROM users WHERE deleted_at IS NULL")
    fun count(): Long
    
    /**
     * 检查用户名是否存在
     */
    @Select("SELECT COUNT(*) > 0 FROM users WHERE username = #{username} AND deleted_at IS NULL")
    fun existsByUsername(username: String): Boolean
    
    /**
     * ========== 插入操作 ==========
     */
    
    /**
     * 插入用户
     * 
     * @Insert 注解说明：
     * - 定义 INSERT 插入语句
     * - #{property} 会从参数对象中获取对应属性值
     * 
     * @Options 注解说明：
     * - useGeneratedKeys: 使用数据库自动生成的主键
     * - keyProperty: 将生成的主键值赋给对象的哪个属性
     * - keyColumn: 数据库主键列名
     * 
     * 返回值：
     * - Int: 受影响的行数
     */
    @Insert("""
        INSERT INTO users (username, password, email, phone, age, gender, status, avatar, created_at, updated_at)
        VALUES (#{username}, #{password}, #{email}, #{phone}, #{age}, #{gender}, #{status}, #{avatar}, NOW(), NOW())
    """)
    @Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
    fun insert(user: User): Int
    
    /**
     * 批量插入用户
     * 
     * @Param 注解说明：
     * - 为参数指定名称，在 SQL 中使用
     * - 批量操作需要使用 <foreach> 标签（需要 XML）
     */
    fun batchInsert(@Param("users") users: List<User>): Int
    
    /**
     * ========== 更新操作 ==========
     */
    
    /**
     * 更新用户信息
     * 
     * @Update 注解说明：
     * - 定义 UPDATE 更新语句
     */
    @Update("""
        UPDATE users
        SET username = #{username},
            email = #{email},
            phone = #{phone},
            age = #{age},
            gender = #{gender},
            avatar = #{avatar},
            updated_at = NOW()
        WHERE id = #{id}
    """)
    fun update(user: User): Int
    
    /**
     * 更新用户状态
     */
    @Update("UPDATE users SET status = #{status}, updated_at = NOW() WHERE id = #{id}")
    fun updateStatus(@Param("id") id: Long, @Param("status") status: Int): Int
    
    /**
     * 更新密码
     */
    @Update("UPDATE users SET password = #{password}, updated_at = NOW() WHERE id = #{id}")
    fun updatePassword(@Param("id") id: Long, @Param("password") password: String): Int
    
    /**
     * ========== 删除操作 ==========
     */
    
    /**
     * 物理删除用户
     * 
     * @Delete 注解说明：
     * - 定义 DELETE 删除语句
     */
    @Delete("DELETE FROM users WHERE id = #{id}")
    fun deleteById(id: Long): Int
    
    /**
     * 软删除用户
     * 推荐使用软删除，不直接删除数据
     */
    @Update("UPDATE users SET deleted_at = NOW() WHERE id = #{id}")
    fun softDeleteById(id: Long): Int
    
    /**
     * 批量删除
     */
    @Delete("DELETE FROM users WHERE id IN (#{ids})")
    fun batchDelete(@Param("ids") ids: List<Long>): Int
    
    /**
     * ========== 复杂查询（需要 XML） ==========
     */
    
    /**
     * 分页查询用户
     * 这个方法需要在 XML 文件中定义，因为涉及动态 SQL
     */
    fun findByPage(
        @Param("keyword") keyword: String?,
        @Param("status") status: Int?,
        @Param("offset") offset: Int,
        @Param("limit") limit: Int
    ): List<User>
    
    /**
     * 统计符合条件的用户数量
     */
    fun countByCondition(
        @Param("keyword") keyword: String?,
        @Param("status") status: Int?
    ): Long
    
    /**
     * 查询用户及其角色（一对多关联查询）
     */
    fun findByIdWithRoles(id: Long): User?
    
    /**
     * 动态更新（只更新非空字段）
     */
    fun updateSelective(user: User): Int
}
```

### 7.4.2 使用 XML 方式（复杂 SQL）

**UserMapper.xml**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" 
    "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<!-- 
    namespace: 对应的 Mapper 接口全限定名
-->
<mapper namespace="com.example.demo.mapper.UserMapper">

    <!-- 
        resultMap: 结果映射
        - 当数据库列名与实体类属性名不一致时使用
        - 或需要进行复杂的结果映射时使用
    -->
    <resultMap id="BaseResultMap" type="com.example.demo.entity.User">
        <!-- id: 主键映射 -->
        <id column="id" property="id" />
        
        <!-- result: 普通字段映射 -->
        <result column="username" property="username" />
        <result column="password" property="password" />
        <result column="email" property="email" />
        <result column="phone" property="phone" />
        <result column="age" property="age" />
        <result column="gender" property="gender" />
        <result column="status" property="status" />
        <result column="avatar" property="avatar" />
        <result column="created_at" property="createdAt" />
        <result column="updated_at" property="updatedAt" />
        <result column="deleted_at" property="deletedAt" />
    </resultMap>
    
    <!-- 
        带角色的结果映射（一对多）
    -->
    <resultMap id="UserWithRolesResultMap" type="com.example.demo.entity.User" extends="BaseResultMap">
        <!-- 
            collection: 一对多关联
            - property: 实体类中的集合属性名
            - ofType: 集合元素的类型
        -->
        <collection property="roles" ofType="com.example.demo.entity.Role">
            <id column="role_id" property="id" />
            <result column="role_name" property="name" />
            <result column="role_code" property="code" />
            <result column="role_description" property="description" />
        </collection>
    </resultMap>
    
    <!-- 
        SQL 片段：可重用的 SQL 代码
    -->
    <sql id="Base_Column_List">
        id, username, password, email, phone, age, gender, status, avatar, created_at, updated_at, deleted_at
    </sql>
    
    <sql id="Where_Condition">
        <where>
            deleted_at IS NULL
            <!-- 
                if: 条件判断
                - test: 条件表达式（OGNL 表达式）
            -->
            <if test="keyword != null and keyword != ''">
                AND (username LIKE CONCAT('%', #{keyword}, '%')
                     OR email LIKE CONCAT('%', #{keyword}, '%')
                     OR phone LIKE CONCAT('%', #{keyword}, '%'))
            </if>
            <if test="status != null">
                AND status = #{status}
            </if>
        </where>
    </sql>
    
    <!-- 
        分页查询
    -->
    <select id="findByPage" resultMap="BaseResultMap">
        SELECT
            <include refid="Base_Column_List" />
        FROM users
        <include refid="Where_Condition" />
        ORDER BY created_at DESC
        LIMIT #{offset}, #{limit}
    </select>
    
    <!-- 
        统计符合条件的数量
    -->
    <select id="countByCondition" resultType="long">
        SELECT COUNT(*)
        FROM users
        <include refid="Where_Condition" />
    </select>
    
    <!-- 
        查询用户及其角色（连接查询）
    -->
    <select id="findByIdWithRoles" resultMap="UserWithRolesResultMap">
        SELECT
            u.*,
            r.id AS role_id,
            r.name AS role_name,
            r.code AS role_code,
            r.description AS role_description
        FROM users u
        LEFT JOIN user_roles ur ON u.id = ur.user_id
        LEFT JOIN roles r ON ur.role_id = r.id
        WHERE u.id = #{id} AND u.deleted_at IS NULL
    </select>
    
    <!-- 
        动态更新（只更新非空字段）
    -->
    <update id="updateSelective">
        UPDATE users
        <set>
            <if test="username != null and username != ''">
                username = #{username},
            </if>
            <if test="email != null and email != ''">
                email = #{email},
            </if>
            <if test="phone != null and phone != ''">
                phone = #{phone},
            </if>
            <if test="age != null">
                age = #{age},
            </if>
            <if test="gender != null">
                gender = #{gender},
            </if>
            <if test="avatar != null and avatar != ''">
                avatar = #{avatar},
            </if>
            updated_at = NOW()
        </set>
        WHERE id = #{id}
    </update>
    
    <!-- 
        批量插入
    -->
    <insert id="batchInsert" useGeneratedKeys="true" keyProperty="id">
        INSERT INTO users (username, password, email, phone, age, gender, status, created_at, updated_at)
        VALUES
        <!-- 
            foreach: 循环
            - collection: 集合参数名
            - item: 当前元素变量名
            - separator: 分隔符
            - open: 开始字符
            - close: 结束字符
        -->
        <foreach collection="users" item="user" separator=",">
            (#{user.username}, #{user.password}, #{user.email}, #{user.phone}, 
             #{user.age}, #{user.gender}, #{user.status}, NOW(), NOW())
        </foreach>
    </insert>
    
    <!-- 
        多条件查询（choose/when/otherwise）
    -->
    <select id="findByCondition" resultMap="BaseResultMap">
        SELECT
            <include refid="Base_Column_List" />
        FROM users
        WHERE deleted_at IS NULL
        <choose>
            <when test="searchType == 'username'">
                AND username LIKE CONCAT('%', #{keyword}, '%')
            </when>
            <when test="searchType == 'email'">
                AND email LIKE CONCAT('%', #{keyword}, '%')
            </when>
            <when test="searchType == 'phone'">
                AND phone LIKE CONCAT('%', #{keyword}, '%')
            </when>
            <otherwise>
                AND (username LIKE CONCAT('%', #{keyword}, '%')
                     OR email LIKE CONCAT('%', #{keyword}, '%'))
            </otherwise>
        </choose>
    </select>
</mapper>
```

## 7.5 CRUD 示例：完整流程

### 7.5.1 Service 层实现

```kotlin
package com.example.demo.service

import com.example.demo.dto.request.CreateUserRequest
import com.example.demo.dto.request.UpdateUserRequest
import com.example.demo.dto.response.PageResponse
import com.example.demo.dto.response.UserResponse
import com.example.demo.entity.User
import com.example.demo.exception.ConflictException
import com.example.demo.exception.NotFoundException
import com.example.demo.mapper.UserMapper
import org.springframework.security.crypto.password.PasswordEncoder
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

@Service
class UserService(
    private val userMapper: UserMapper,
    private val passwordEncoder: PasswordEncoder
) {
    
    /**
     * ========== 创建（Create） ==========
     */
    
    /**
     * 创建用户
     */
    @Transactional(rollbackFor = [Exception::class])
    fun createUser(request: CreateUserRequest): UserResponse {
        // 1. 检查用户名是否已存在
        if (userMapper.existsByUsername(request.username)) {
            throw ConflictException("用户名已存在: ${request.username}")
        }
        
        // 2. 检查邮箱是否已存在
        userMapper.findByEmail(request.email)?.let {
            throw ConflictException("邮箱已被注册: ${request.email}")
        }
        
        // 3. 创建用户对象
        val user = User(
            username = request.username,
            password = passwordEncoder.encode(request.password),  // 加密密码
            email = request.email,
            phone = request.phone,
            age = request.age,
            gender = request.gender
        )
        
        // 4. 插入数据库
        userMapper.insert(user)
        
        // 5. 返回响应
        return UserResponse.from(user)
    }
    
    /**
     * 批量创建用户
     */
    @Transactional(rollbackFor = [Exception::class])
    fun batchCreateUsers(requests: List<CreateUserRequest>): List<UserResponse> {
        // 转换为实体类列表
        val users = requests.map { request ->
            User(
                username = request.username,
                password = passwordEncoder.encode(request.password),
                email = request.email
            )
        }
        
        // 批量插入
        userMapper.batchInsert(users)
        
        // 返回响应列表
        return users.map { UserResponse.from(it) }
    }
    
    /**
     * ========== 读取（Read） ==========
     */
    
    /**
     * 根据ID获取用户
     */
    @Transactional(readOnly = true)
    fun getUserById(id: Long): UserResponse {
        val user = userMapper.findById(id)
            ?: throw NotFoundException("用户不存在，ID: $id")
        
        return UserResponse.from(user)
    }
    
    /**
     * 根据用户名获取用户
     */
    @Transactional(readOnly = true)
    fun getUserByUsername(username: String): UserResponse {
        val user = userMapper.findByUsername(username)
            ?: throw NotFoundException("用户不存在: $username")
        
        return UserResponse.from(user)
    }
    
    /**
     * 获取所有用户
     */
    @Transactional(readOnly = true)
    fun getAllUsers(): List<UserResponse> {
        val users = userMapper.findAll()
        return users.map { UserResponse.from(it) }
    }
    
    /**
     * 分页查询用户
     */
    @Transactional(readOnly = true)
    fun getUsersPage(
        keyword: String?,
        status: Int?,
        page: Int,
        size: Int
    ): PageResponse<UserResponse> {
        // 1. 计算偏移量
        val offset = (page - 1) * size
        
        // 2. 查询用户列表
        val users = userMapper.findByPage(keyword, status, offset, size)
        
        // 3. 查询总数
        val total = userMapper.countByCondition(keyword, status)
        
        // 4. 转换为响应对象
        val userResponses = users.map { UserResponse.from(it) }
        
        // 5. 返回分页响应
        return PageResponse.of(userResponses, total, page, size)
    }
    
    /**
     * 搜索用户
     */
    @Transactional(readOnly = true)
    fun searchUsers(keyword: String): List<UserResponse> {
        val users = userMapper.searchByUsername(keyword)
        return users.map { UserResponse.from(it) }
    }
    
    /**
     * 获取用户及其角色
     */
    @Transactional(readOnly = true)
    fun getUserWithRoles(id: Long): UserResponse {
        val user = userMapper.findByIdWithRoles(id)
            ?: throw NotFoundException("用户不存在，ID: $id")
        
        return UserResponse.from(user)
    }
    
    /**
     * ========== 更新（Update） ==========
     */
    
    /**
     * 更新用户信息
     */
    @Transactional(rollbackFor = [Exception::class])
    fun updateUser(id: Long, request: UpdateUserRequest): UserResponse {
        // 1. 查询用户
        val user = userMapper.findById(id)
            ?: throw NotFoundException("用户不存在，ID: $id")
        
        // 2. 更新字段
        request.username?.let {
            // 检查新用户名是否已被使用
            userMapper.findByUsername(it)?.let { existing ->
                if (existing.id != id) {
                    throw ConflictException("用户名已存在: $it")
                }
            }
            user.username = it
        }
        
        request.email?.let {
            // 检查新邮箱是否已被使用
            userMapper.findByEmail(it)?.let { existing ->
                if (existing.id != id) {
                    throw ConflictException("邮箱已被注册: $it")
                }
            }
            user.email = it
        }
        
        request.phone?.let { user.phone = it }
        request.age?.let { user.age = it }
        request.gender?.let { user.gender = it }
        request.avatar?.let { user.avatar = it }
        
        // 3. 更新数据库
        userMapper.update(user)
        
        // 4. 返回响应
        return UserResponse.from(user)
    }
    
    /**
     * 动态更新（只更新非空字段）
     */
    @Transactional(rollbackFor = [Exception::class])
    fun updateUserSelective(id: Long, user: User): UserResponse {
        user.id = id
        val count = userMapper.updateSelective(user)
        if (count == 0) {
            throw NotFoundException("用户不存在，ID: $id")
        }
        
        return getUserById(id)
    }
    
    /**
     * 更新用户状态
     */
    @Transactional(rollbackFor = [Exception::class])
    fun updateUserStatus(id: Long, status: Int) {
        val count = userMapper.updateStatus(id, status)
        if (count == 0) {
            throw NotFoundException("用户不存在，ID: $id")
        }
    }
    
    /**
     * 更新密码
     */
    @Transactional(rollbackFor = [Exception::class])
    fun updatePassword(id: Long, newPassword: String) {
        val encodedPassword = passwordEncoder.encode(newPassword)
        val count = userMapper.updatePassword(id, encodedPassword)
        if (count == 0) {
            throw NotFoundException("用户不存在，ID: $id")
        }
    }
    
    /**
     * ========== 删除（Delete） ==========
     */
    
    /**
     * 删除用户（软删除）
     */
    @Transactional(rollbackFor = [Exception::class])
    fun deleteUser(id: Long) {
        val count = userMapper.softDeleteById(id)
        if (count == 0) {
            throw NotFoundException("用户不存在，ID: $id")
        }
    }
    
    /**
     * 永久删除用户（物理删除）
     */
    @Transactional(rollbackFor = [Exception::class])
    fun permanentlyDeleteUser(id: Long) {
        val count = userMapper.deleteById(id)
        if (count == 0) {
            throw NotFoundException("用户不存在，ID: $id")
        }
    }
    
    /**
     * 批量删除用户
     */
    @Transactional(rollbackFor = [Exception::class])
    fun batchDeleteUsers(ids: List<Long>): Int {
        return userMapper.batchDelete(ids)
    }
    
    /**
     * ========== 其他操作 ==========
     */
    
    /**
     * 统计用户数量
     */
    @Transactional(readOnly = true)
    fun countUsers(): Long {
        return userMapper.count()
    }
    
    /**
     * 检查用户名是否存在
     */
    @Transactional(readOnly = true)
    fun isUsernameExist(username: String): Boolean {
        return userMapper.existsByUsername(username)
    }
}
```

## 7.6 分页与条件查询

### 7.6.1 手动分页实现

上面的示例已经展示了手动分页，这里再总结一下：

```kotlin
/**
 * 分页查询参数
 */
data class PageQuery(
    val page: Int = 1,        // 当前页码（从1开始）
    val size: Int = 10,       // 每页大小
    val keyword: String? = null,
    val status: Int? = null
) {
    /**
     * 计算偏移量
     */
    val offset: Int
        get() = (page - 1) * size
}

/**
 * 使用示例
 */
fun getUsersPage(query: PageQuery): PageResponse<UserResponse> {
    val users = userMapper.findByPage(
        keyword = query.keyword,
        status = query.status,
        offset = query.offset,
        limit = query.size
    )
    
    val total = userMapper.countByCondition(query.keyword, query.status)
    val userResponses = users.map { UserResponse.from(it) }
    
    return PageResponse.of(userResponses, total, query.page, query.size)
}
```

### 7.6.2 使用 PageHelper 插件（推荐）

**添加依赖：**

```xml
<dependency>
    <groupId>com.github.pagehelper</groupId>
    <artifactId>pagehelper-spring-boot-starter</artifactId>
    <version>1.4.7</version>
</dependency>
```

**配置：**

```yaml
# application.yml
pagehelper:
  helper-dialect: mysql
  reasonable: true
  support-methods-arguments: true
  params: count=countSql
```

**使用：**

```kotlin
import com.github.pagehelper.PageHelper
import com.github.pagehelper.PageInfo

@Service
class UserService(
    private val userMapper: UserMapper
) {
    
    /**
     * 使用 PageHelper 进行分页
     */
    @Transactional(readOnly = true)
    fun getUsersPageWithHelper(
        keyword: String?,
        status: Int?,
        page: Int,
        size: Int
    ): PageResponse<UserResponse> {
        // 1. 设置分页参数（在查询之前调用）
        PageHelper.startPage<User>(page, size)
        
        // 2. 执行查询（普通查询，不需要手动计算offset和limit）
        val users = userMapper.findByCondition(keyword, status)
        
        // 3. 封装分页信息
        val pageInfo = PageInfo(users)
        
        // 4. 转换为响应对象
        val userResponses = users.map { UserResponse.from(it) }
        
        // 5. 返回分页响应
        return PageResponse.of(
            items = userResponses,
            total = pageInfo.total,
            page = page,
            size = size
        )
    }
}
```

## 7.7 本章小结

在本章中，我们详细学习了：

✅ **MyBatis 集成**：添加依赖、配置数据源、连接池
✅ **数据库设计**：创建表、索引、外键
✅ **实体类定义**：Kotlin data class、字段映射、枚举
✅ **Mapper 编写**：注解方式、XML方式、动态SQL
✅ **CRUD 操作**：完整的增删改查实现
✅ **分页查询**：手动分页、PageHelper 插件
✅ **事务管理**：@Transactional 注解

**关键要点：**
- MyBatis 提供了灵活的 SQL 控制能力
- 简单SQL使用注解，复杂SQL使用XML
- 动态SQL可以根据条件生成不同的查询
- 合理使用事务保证数据一致性
- 分页查询要同时查询数据和总数

**下一章预告：**
在下一章中，我们将学习配置文件与多环境管理，包括 application.yml 配置、Profile 切换、配置加密等内容。

---

# 第8章：配置文件与多环境管理

## 8.1 Spring Boot 配置文件概述

Spring Boot 支持多种配置文件格式，主要包括：

- **application.properties**：传统的 Java 属性文件格式
- **application.yml** / **application.yaml**：YAML 格式（推荐，更简洁、层次更清晰）

### 8.1.1 为什么推荐使用 YAML？

**YAML 优势：**
```yaml
# YAML 格式 - 层次清晰，易读
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/mydb
    username: root
    password: 123456
  redis:
    host: localhost
    port: 6379
```

**Properties 格式对比：**
```properties
# Properties 格式 - 冗余，不够直观
spring.datasource.url=jdbc:mysql://localhost:3306/mydb
spring.datasource.username=root
spring.datasource.password=123456
spring.redis.host=localhost
spring.redis.port=6379
```

**YAML 注意事项：**
- 使用**缩进**（通常2个空格）表示层级关系
- **不能使用 Tab 缩进**，必须使用空格
- 冒号后面必须有空格：`key: value`
- 字符串通常不需要引号，特殊字符时使用

## 8.2 application.yml 基础配置

### 8.2.1 应用基本配置

```yaml
# src/main/resources/application.yml

# 应用基本信息
spring:
  application:
    name: my-spring-boot-app  # 应用名称，用于服务注册发现等场景
  
# 服务器配置
server:
  port: 8080  # 应用端口号
  servlet:
    context-path: /api  # 应用上下文路径，所有接口前缀为 /api
    encoding:
      charset: UTF-8  # 字符编码
      enabled: true
      force: true
  compression:
    enabled: true  # 开启响应压缩
    mime-types: application/json,application/xml,text/html,text/xml,text/plain  # 压缩的MIME类型
    min-response-size: 1024  # 最小压缩大小（字节）
  
  # 错误页面配置
  error:
    include-message: always  # 错误响应中包含message
    include-binding-errors: always  # 包含参数绑定错误
    include-stacktrace: on_param  # 仅当请求参数trace=true时显示堆栈
    include-exception: false  # 不包含异常类名
```

### 8.2.2 数据库配置详解

```yaml
spring:
  # 数据源配置
  datasource:
    driver-class-name: com.mysql.cj.jdbc.Driver  # MySQL 8.x 驱动
    url: jdbc:mysql://localhost:3306/mydb?useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Shanghai&allowPublicKeyRetrieval=true
    # URL参数说明：
    # - useUnicode=true&characterEncoding=utf8: 使用UTF-8编码
    # - useSSL=false: 关闭SSL（开发环境）
    # - serverTimezone=Asia/Shanghai: 设置时区
    # - allowPublicKeyRetrieval=true: 允许客户端获取RSA公钥（MySQL 8+）
    
    username: root  # 数据库用户名
    password: 123456  # 数据库密码
    
    # HikariCP 连接池配置（Spring Boot 2.x 默认连接池）
    hikari:
      minimum-idle: 5  # 最小空闲连接数
      maximum-pool-size: 20  # 最大连接池大小
      connection-timeout: 30000  # 连接超时时间（毫秒）
      idle-timeout: 600000  # 空闲连接超时时间（10分钟）
      max-lifetime: 1800000  # 连接最大生命周期（30分钟）
      connection-test-query: SELECT 1  # 测试连接的SQL
      pool-name: MyHikariCP  # 连接池名称
      
  # SQL 初始化（开发/测试环境使用）
  sql:
    init:
      mode: always  # 总是执行初始化脚本（always/embedded/never）
      schema-locations: classpath:db/schema.sql  # DDL脚本路径
      data-locations: classpath:db/data.sql  # 数据初始化脚本
      continue-on-error: false  # SQL执行出错时是否继续
      encoding: UTF-8  # SQL文件编码
```

**数据库配置要点说明：**

1. **driver-class-name：**
   - MySQL 5.x: `com.mysql.jdbc.Driver`
   - MySQL 8.x: `com.mysql.cj.jdbc.Driver`

2. **连接池参数优化建议：**
   - `minimum-idle`: 根据并发量设置，一般5-10
   - `maximum-pool-size`: 一般设置为 CPU核心数 * 2 + 磁盘数
   - `connection-timeout`: 连接超时，默认30秒
   - `idle-timeout`: 空闲连接超时，避免占用资源

### 8.2.3 MyBatis 配置

```yaml
mybatis:
  # Mapper XML 文件位置
  mapper-locations: classpath:mapper/**/*.xml
  
  # 实体类包路径（配置后可以在XML中直接使用类名，无需全限定名）
  type-aliases-package: com.example.demo.entity
  
  # MyBatis 核心配置
  configuration:
    # 驼峰命名转换（数据库下划线 user_name -> 实体类驼峰 userName）
    map-underscore-to-camel-case: true
    
    # 日志实现（开发环境查看SQL语句）
    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl
    # 其他日志实现：
    # - org.apache.ibatis.logging.slf4j.Slf4jImpl （生产推荐）
    # - org.apache.ibatis.logging.log4j2.Log4j2Impl
    
    # 二级缓存开关（默认true）
    cache-enabled: true
    
    # 延迟加载开关
    lazy-loading-enabled: true
    aggressive-lazy-loading: false  # 按需加载，不是全部加载
    
    # 默认执行器类型
    # - SIMPLE: 普通执行器（默认）
    # - REUSE: 重用预处理语句
    # - BATCH: 批量执行器（批量更新）
    default-executor-type: SIMPLE
    
    # 超时时间（秒）
    default-statement-timeout: 25
    
    # 自动映射策略
    # - NONE: 不自动映射
    # - PARTIAL: 只自动映射没有嵌套结果的（默认）
    # - FULL: 自动映射所有
    auto-mapping-behavior: PARTIAL
    
    # NULL值处理（避免Oracle等数据库的NULL问题）
    jdbc-type-for-null: NULL
```

**MyBatis 配置说明：**

- `map-underscore-to-camel-case`: 企业项目必开，自动转换命名
- `log-impl`: 开发环境用 StdOutImpl 查看SQL，生产用 Slf4j
- `cache-enabled`: 开启二级缓存，需要实体类实现 Serializable
- `lazy-loading-enabled`: 开启懒加载，提高性能

### 8.2.4 日志配置

```yaml
# 日志配置
logging:
  level:
    root: INFO  # 根日志级别（TRACE < DEBUG < INFO < WARN < ERROR < FATAL）
    com.example.demo: DEBUG  # 项目包日志级别
    com.example.demo.mapper: DEBUG  # Mapper SQL日志
    org.springframework.web: DEBUG  # Spring Web日志
    org.springframework.security: DEBUG  # Security日志
    org.hibernate.SQL: DEBUG  # Hibernate SQL
    org.hibernate.type.descriptor.sql.BasicBinder: TRACE  # SQL参数绑定
  
  # 日志文件配置
  file:
    name: logs/application.log  # 日志文件路径
    max-size: 10MB  # 单个文件最大大小
    max-history: 30  # 保留天数
  
  # 日志输出格式
  pattern:
    console: "%d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %-5level %logger{50} - %msg%n"
    file: "%d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %-5level %logger{50} - %msg%n"
    # 格式说明：
    # %d: 日期时间
    # %thread: 线程名
    # %-5level: 日志级别（左对齐，宽度5）
    # %logger{50}: Logger名称（最大50字符）
    # %msg: 日志消息
    # %n: 换行符
```

**日志级别选择：**
- **开发环境**: DEBUG（查看详细信息）
- **测试环境**: INFO（关键业务日志）
- **生产环境**: WARN 或 ERROR（仅记录异常）

### 8.2.5 Jackson JSON 配置

```yaml
spring:
  jackson:
    # 日期时间格式化
    date-format: yyyy-MM-dd HH:mm:ss
    time-zone: GMT+8  # 时区设置
    
    # 序列化配置
    serialization:
      write-dates-as-timestamps: false  # 日期不转为时间戳
      write-null-map-values: false  # Map中的null值不序列化
      fail-on-empty-beans: false  # 空对象不报错
      indent-output: false  # 不格式化输出（生产环境关闭，节省带宽）
    
    # 反序列化配置
    deserialization:
      fail-on-unknown-properties: false  # 未知属性不报错
      fail-on-null-for-primitives: false  # 基本类型为null不报错
    
    # 默认属性包含规则
    default-property-inclusion: non_null  # 只序列化非null字段
    # 可选值：
    # - ALWAYS: 总是序列化
    # - NON_NULL: 非null
    # - NON_EMPTY: 非空（集合、字符串）
    # - NON_DEFAULT: 非默认值
    
    # 其他配置
    locale: zh_CN  # 本地化
    mapper:
      accept-case-insensitive-enums: true  # 枚举大小写不敏感
```

**Jackson 配置作用：**
- 统一 JSON 序列化/反序列化规则
- 避免前后端数据格式不一致
- 处理时区、日期格式等常见问题

## 8.3 多环境配置（Profiles）

在企业开发中，通常有多个运行环境：

- **dev**（开发环境）：本地开发使用
- **test**（测试环境）：测试团队使用
- **staging**（预发布环境）：生产环境的镜像
- **prod**（生产环境）：正式线上环境

### 8.3.1 创建多环境配置文件

```
src/main/resources/
├── application.yml              # 主配置文件（公共配置）
├── application-dev.yml          # 开发环境
├── application-test.yml         # 测试环境
├── application-staging.yml      # 预发布环境
└── application-prod.yml         # 生产环境
```

**application.yml （主配置，所有环境共享）：**

```yaml
# 主配置文件 - 公共配置

spring:
  application:
    name: my-spring-boot-app
  
  # 指定激活的环境（默认）
  profiles:
    active: dev  # 默认使用dev环境
    
  jackson:
    date-format: yyyy-MM-dd HH:mm:ss
    time-zone: GMT+8
    default-property-inclusion: non_null

# 公共服务器配置
server:
  servlet:
    encoding:
      charset: UTF-8
      enabled: true

# 公共日志配置
logging:
  pattern:
    console: "%d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %-5level %logger{50} - %msg%n"
```

**application-dev.yml （开发环境）：**

```yaml
# 开发环境配置

server:
  port: 8080  # 开发环境端口

spring:
  datasource:
    driver-class-name: org.h2.Driver  # 开发使用H2内存数据库
    url: jdbc:h2:mem:testdb
    username: sa
    password: 
  
  h2:
    console:
      enabled: true  # 开启H2控制台（http://localhost:8080/h2-console）
      path: /h2-console
  
  # 开发环境使用SQL初始化
  sql:
    init:
      mode: always
      schema-locations: classpath:db/schema.sql
      data-locations: classpath:db/data.sql

mybatis:
  configuration:
    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl  # 控制台打印SQL

logging:
  level:
    root: INFO
    com.example.demo: DEBUG  # 开发环境详细日志
```

**application-test.yml （测试环境）：**

```yaml
# 测试环境配置

server:
  port: 8081

spring:
  datasource:
    driver-class-name: com.mysql.cj.jdbc.Driver
    url: jdbc:mysql://test-db-server:3306/test_db?useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Shanghai
    username: test_user
    password: test_password
    hikari:
      maximum-pool-size: 10  # 测试环境连接池较小
      minimum-idle: 3

mybatis:
  configuration:
    log-impl: org.apache.ibatis.logging.slf4j.Slf4jImpl

logging:
  level:
    root: INFO
    com.example.demo: INFO
  file:
    name: logs/test/application.log
```

**application-prod.yml （生产环境）：**

```yaml
# 生产环境配置

server:
  port: 80  # 生产环境通常使用80端口

spring:
  datasource:
    driver-class-name: com.mysql.cj.jdbc.Driver
    url: jdbc:mysql://prod-db-server:3306/prod_db?useUnicode=true&characterEncoding=utf8&useSSL=true&serverTimezone=Asia/Shanghai
    username: ${DB_USERNAME}  # 使用环境变量（安全）
    password: ${DB_PASSWORD}
    hikari:
      maximum-pool-size: 50  # 生产环境连接池较大
      minimum-idle: 10
      connection-timeout: 20000
      idle-timeout: 300000
      max-lifetime: 1200000

mybatis:
  configuration:
    log-impl: org.apache.ibatis.logging.slf4j.Slf4jImpl  # 生产使用Slf4j
    cache-enabled: true  # 开启缓存

logging:
  level:
    root: WARN  # 生产环境仅记录警告和错误
    com.example.demo: INFO
  file:
    name: /var/log/myapp/application.log
    max-size: 100MB
    max-history: 90  # 保留90天日志
```

### 8.3.2 激活指定环境的多种方式

#### 方式1：配置文件中指定（application.yml）

```yaml
spring:
  profiles:
    active: dev  # 默认激活dev环境
```

#### 方式2：命令行参数

```bash
# 方式A: --spring.profiles.active
java -jar myapp.jar --spring.profiles.active=prod

# 方式B: -D系统属性
java -Dspring.profiles.active=prod -jar myapp.jar

# Maven 启动时指定
mvn spring-boot:run -Dspring-boot.run.profiles=prod
```

#### 方式3：环境变量

```bash
# Windows (PowerShell)
$env:SPRING_PROFILES_ACTIVE="prod"
java -jar myapp.jar

# Windows (CMD)
set SPRING_PROFILES_ACTIVE=prod
java -jar myapp.jar

# Linux/Mac
export SPRING_PROFILES_ACTIVE=prod
java -jar myapp.jar
```

#### 方式4：IDE 配置（Cursor/IntelliJ IDEA）

在 Cursor 中：
1. 打开 `Run/Debug Configurations`
2. 找到 `Spring Boot` 应用配置
3. 在 `Active profiles` 字段填入：`dev` 或 `prod`

#### 方式5：Maven Profile

`pom.xml` 中配置：

```xml
<profiles>
    <profile>
        <id>dev</id>
        <activation>
            <activeByDefault>true</activeByDefault>
        </activation>
        <properties>
            <spring.profiles.active>dev</spring.profiles.active>
        </properties>
    </profile>
    
    <profile>
        <id>prod</id>
        <properties>
            <spring.profiles.active>prod</spring.profiles.active>
        </properties>
    </profile>
</profiles>

<build>
    <resources>
        <resource>
            <directory>src/main/resources</directory>
            <filtering>true</filtering>
        </resource>
    </resources>
</build>
```

`application.yml`：
```yaml
spring:
  profiles:
    active: @spring.profiles.active@  # Maven变量替换
```

打包时指定：
```bash
mvn clean package -Pprod
```

### 8.3.3 Profile 优先级（从高到低）

1. 命令行参数：`--spring.profiles.active=prod`
2. Java系统属性：`-Dspring.profiles.active=prod`
3. 操作系统环境变量：`SPRING_PROFILES_ACTIVE=prod`
4. `application-{profile}.yml` 配置文件
5. `application.yml` 中的 `spring.profiles.active`

**优先级规则：**
- 高优先级配置会覆盖低优先级配置
- 同一级别，后加载的覆盖先加载的

### 8.3.4 使用 @Profile 注解条件化创建 Bean

```kotlin
package com.example.demo.config

import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.context.annotation.Profile

/**
 * 数据源配置类
 */
@Configuration
class DataSourceConfig {
    
    /**
     * 开发环境数据源
     * 仅在 dev 环境激活时创建
     */
    @Bean
    @Profile("dev")
    fun devDataSource(): String {
        println("使用开发环境H2数据库")
        return "H2 Database"
    }
    
    /**
     * 生产环境数据源
     * 仅在 prod 环境激活时创建
     */
    @Bean
    @Profile("prod")
    fun prodDataSource(): String {
        println("使用生产环境MySQL数据库")
        return "MySQL Database"
    }
    
    /**
     * 多环境Bean
     * 在 test 或 staging 环境激活时创建
     */
    @Bean
    @Profile("test", "staging")
    fun testDataSource(): String {
        println("使用测试/预发布环境数据库")
        return "Test MySQL Database"
    }
    
    /**
     * 非生产环境Bean
     * 除了 prod 环境，其他环境都创建
     */
    @Bean
    @Profile("!prod")
    fun mockService(): String {
        println("使用Mock服务（非生产环境）")
        return "Mock Service"
    }
}
```

**@Profile 注解说明：**

- `@Profile("dev")`：仅在 dev 环境创建
- `@Profile("test", "staging")`：在 test 或 staging 环境创建
- `@Profile("!prod")`：在非 prod 环境创建（取反）
- `@Profile({"dev", "test"})`：同时支持多个环境

**应用场景：**
- 不同环境使用不同的数据源
- 开发环境使用Mock服务，生产环境使用真实服务
- 开发环境开启某些调试功能

### 8.3.5 Profile Group（环境组）

**application.yml：**

```yaml
spring:
  profiles:
    active: dev  # 激活dev组
    
    # 定义Profile组
    group:
      dev:  # dev组包含多个profile
        - dev-db
        - dev-cache
        - dev-log
      
      prod:  # prod组
        - prod-db
        - prod-cache
        - prod-log
        - prod-security
```

**分离配置文件：**

```
resources/
├── application.yml
├── application-dev-db.yml      # 开发数据库配置
├── application-dev-cache.yml   # 开发缓存配置
├── application-dev-log.yml     # 开发日志配置
├── application-prod-db.yml     # 生产数据库配置
├── application-prod-cache.yml  # 生产缓存配置
├── application-prod-log.yml    # 生产日志配置
└── application-prod-security.yml  # 生产安全配置
```

**好处：**
- 配置文件更细粒度，便于管理
- 不同模块配置分离，职责清晰
- 可以灵活组合不同环境配置

## 8.4 @ConfigurationProperties 类型安全配置

使用 `@Value` 注解注入配置简单，但有以下缺点：
- 大量 `@Value` 注解分散在代码中，难以管理
- 不支持配置验证
- IDE 不友好，没有自动提示

**推荐使用 `@ConfigurationProperties` 实现类型安全的配置绑定。**

### 8.4.1 定义配置类

**application.yml：**

```yaml
# 应用自定义配置
app:
  name: 我的Spring Boot应用
  version: 1.0.0
  author: 张三
  description: 这是一个企业级Spring Boot项目
  
  # 文件上传配置
  upload:
    enabled: true
    max-file-size: 10485760  # 10MB（字节）
    allowed-extensions:
      - jpg
      - jpeg
      - png
      - pdf
      - doc
      - docx
    save-path: /data/uploads
  
  # API配置
  api:
    base-url: https://api.example.com
    timeout: 30000  # 超时时间（毫秒）
    retry-count: 3
    headers:
      User-Agent: MyApp/1.0
      Accept-Language: zh-CN
  
  # 业务配置
  business:
    enable-cache: true
    cache-ttl: 3600  # 缓存过期时间（秒）
    max-retry: 3
```

**配置属性类（Kotlin）：**

```kotlin
package com.example.demo.config

import org.springframework.boot.context.properties.ConfigurationProperties
import org.springframework.stereotype.Component
import org.springframework.validation.annotation.Validated
import jakarta.validation.constraints.*

/**
 * 应用配置属性
 * 
 * @ConfigurationProperties 说明：
 * - prefix: 配置前缀，绑定 app.* 开头的配置
 * - ignoreInvalidFields: 忽略无效字段（默认false）
 * - ignoreUnknownFields: 忽略未知字段（默认true）
 * 
 * @Component: 将配置类注册为Spring Bean
 * @Validated: 启用配置验证
 */
@Component
@ConfigurationProperties(prefix = "app")
@Validated  // 启用数据验证
data class AppProperties(
    /**
     * 应用名称
     */
    @field:NotBlank(message = "应用名称不能为空")
    var name: String = "",
    
    /**
     * 应用版本
     */
    @field:Pattern(regexp = "\\d+\\.\\d+\\.\\d+", message = "版本号格式错误")
    var version: String = "1.0.0",
    
    /**
     * 作者
     */
    var author: String = "",
    
    /**
     * 描述
     */
    var description: String = "",
    
    /**
     * 文件上传配置（嵌套对象）
     */
    @field:Valid  // 验证嵌套对象
    var upload: UploadConfig = UploadConfig(),
    
    /**
     * API配置
     */
    @field:Valid
    var api: ApiConfig = ApiConfig(),
    
    /**
     * 业务配置
     */
    var business: BusinessConfig = BusinessConfig()
)

/**
 * 文件上传配置
 */
data class UploadConfig(
    /**
     * 是否启用上传
     */
    var enabled: Boolean = true,
    
    /**
     * 最大文件大小（字节）
     */
    @field:Min(value = 1, message = "文件大小必须大于0")
    @field:Max(value = 104857600, message = "文件大小不能超过100MB")
    var maxFileSize: Long = 10485760,  // 默认10MB
    
    /**
     * 允许的文件扩展名
     */
    @field:NotEmpty(message = "允许的扩展名不能为空")
    var allowedExtensions: List<String> = listOf("jpg", "png"),
    
    /**
     * 保存路径
     */
    @field:NotBlank(message = "保存路径不能为空")
    var savePath: String = "/tmp/uploads"
)

/**
 * API配置
 */
data class ApiConfig(
    /**
     * API基础URL
     */
    @field:NotBlank(message = "API基础URL不能为空")
    var baseUrl: String = "",
    
    /**
     * 超时时间（毫秒）
     */
    @field:Min(value = 1000, message = "超时时间至少1秒")
    var timeout: Long = 30000,
    
    /**
     * 重试次数
     */
    @field:Min(value = 0, message = "重试次数不能为负数")
    @field:Max(value = 10, message = "重试次数不能超过10")
    var retryCount: Int = 3,
    
    /**
     * 自定义请求头
     */
    var headers: Map<String, String> = mapOf()
)

/**
 * 业务配置
 */
data class BusinessConfig(
    /**
     * 是否启用缓存
     */
    var enableCache: Boolean = true,
    
    /**
     * 缓存过期时间（秒）
     */
    var cacheTtl: Int = 3600,
    
    /**
     * 最大重试次数
     */
    var maxRetry: Int = 3
)
```

**配置类说明：**

1. **@ConfigurationProperties(prefix = "app")：**
   - 绑定以 `app` 开头的所有配置
   - 自动将 YAML 中的 `app.name` 映射到 `name` 属性
   - 支持驼峰命名和短横线命名的自动转换：`app.max-file-size` → `maxFileSize`

2. **@Component：**
   - 将配置类注册为 Spring Bean
   - 也可以在主类或配置类上使用 `@EnableConfigurationProperties(AppProperties::class)` 启用

3. **@Validated：**
   - 启用 JSR-303 数据验证
   - 配合 `@field:NotBlank`、`@field:Min` 等注解验证配置

4. **data class：**
   - Kotlin 数据类，自动生成 getter/setter
   - 必须有默认值，否则启动时可能报错

5. **嵌套配置：**
   - 使用 `@field:Valid` 验证嵌套对象
   - 支持无限层级嵌套

### 8.4.2 使用配置类

```kotlin
package com.example.demo.controller

import com.example.demo.config.AppProperties
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

/**
 * 配置测试控制器
 */
@RestController
@RequestMapping("/config")
class ConfigController(
    private val appProperties: AppProperties  // 构造器注入配置类
) {
    
    /**
     * 获取应用配置信息
     */
    @GetMapping("/app-info")
    fun getAppInfo(): Map<String, Any> {
        return mapOf(
            "name" to appProperties.name,
            "version" to appProperties.version,
            "author" to appProperties.author,
            "description" to appProperties.description
        )
    }
    
    /**
     * 获取上传配置
     */
    @GetMapping("/upload-config")
    fun getUploadConfig(): Map<String, Any> {
        val uploadConfig = appProperties.upload
        return mapOf(
            "enabled" to uploadConfig.enabled,
            "maxFileSize" to "${uploadConfig.maxFileSize / 1024 / 1024}MB",
            "allowedExtensions" to uploadConfig.allowedExtensions,
            "savePath" to uploadConfig.savePath
        )
    }
    
    /**
     * 获取API配置
     */
    @GetMapping("/api-config")
    fun getApiConfig(): Map<String, Any> {
        val apiConfig = appProperties.api
        return mapOf(
            "baseUrl" to apiConfig.baseUrl,
            "timeout" to "${apiConfig.timeout}ms",
            "retryCount" to apiConfig.retryCount,
            "headers" to apiConfig.headers
        )
    }
}
```

**测试：**

```bash
# 获取应用信息
curl http://localhost:8080/config/app-info

# 返回：
{
  "name": "我的Spring Boot应用",
  "version": "1.0.0",
  "author": "张三",
  "description": "这是一个企业级Spring Boot项目"
}
```

### 8.4.3 配置验证失败示例

如果配置不符合验证规则，应用启动时会抛出异常：

**错误的配置：**

```yaml
app:
  name: ""  # 空字符串，违反 @NotBlank
  version: abc  # 格式错误，违反 @Pattern
  upload:
    max-file-size: -1  # 负数，违反 @Min
```

**启动时报错：**

```
***************************
APPLICATION FAILED TO START
***************************

Description:

Binding to target org.springframework.boot.context.properties.bind.BindException: 
Failed to bind properties under 'app' to com.example.demo.config.AppProperties failed:

    Property: app.name
    Value: ""
    Reason: 应用名称不能为空

    Property: app.version
    Value: "abc"
    Reason: 版本号格式错误
    
    Property: app.upload.max-file-size
    Value: -1
    Reason: 文件大小必须大于0
```

## 8.5 外部化配置与配置优先级

Spring Boot 支持从多个位置加载配置，优先级从高到低：

### 8.5.1 配置加载顺序（优先级从高到低）

1. **命令行参数**
   ```bash
   java -jar myapp.jar --server.port=9090 --spring.profiles.active=prod
   ```

2. **Java系统属性**（`-D` 参数）
   ```bash
   java -Dserver.port=9090 -jar myapp.jar
   ```

3. **操作系统环境变量**
   ```bash
   export SERVER_PORT=9090
   ```

4. **application-{profile}.yml**（特定环境）
   - `application-prod.yml`
   - `application-dev.yml`

5. **application.yml**（主配置文件）

6. **@PropertySource** 注解指定的配置文件

7. **默认配置**（`SpringApplication.setDefaultProperties`）

### 8.5.2 配置文件搜索位置（优先级从高到低）

1. **当前目录的 `/config` 子目录**
   ```
   ./config/application.yml
   ```

2. **当前目录**
   ```
   ./application.yml
   ```

3. **classpath 的 `/config` 包**
   ```
   classpath:/config/application.yml
   ```

4. **classpath 根目录**
   ```
   classpath:/application.yml  （默认位置）
   ```

### 8.5.3 使用外部配置文件

**方式1：命令行指定配置文件路径**

```bash
java -jar myapp.jar --spring.config.location=file:/path/to/config/application.yml
```

**方式2：附加配置文件（不覆盖，追加）**

```bash
java -jar myapp.jar --spring.config.additional-location=file:/etc/myapp/
```

**方式3：使用配置文件名**

```bash
java -jar myapp.jar --spring.config.name=myconfig
# 会查找 myconfig.yml 而不是 application.yml
```

### 8.5.4 使用环境变量（推荐生产环境）

**application-prod.yml：**

```yaml
spring:
  datasource:
    url: ${DB_URL:jdbc:mysql://localhost:3306/mydb}
    # ${环境变量名:默认值}
    # 如果环境变量 DB_URL 存在，使用它；否则使用默认值
    
    username: ${DB_USERNAME:root}
    password: ${DB_PASSWORD:}

server:
  port: ${SERVER_PORT:8080}
```

**设置环境变量：**

```bash
# Linux/Mac
export DB_URL=jdbc:mysql://prod-server:3306/proddb
export DB_USERNAME=prod_user
export DB_PASSWORD=secret_password
export SERVER_PORT=80

# Windows PowerShell
$env:DB_URL="jdbc:mysql://prod-server:3306/proddb"
$env:DB_USERNAME="prod_user"
$env:DB_PASSWORD="secret_password"
$env:SERVER_PORT="80"
```

**Docker 容器中使用环境变量：**

```bash
docker run -d \
  -e DB_URL=jdbc:mysql://prod-server:3306/proddb \
  -e DB_USERNAME=prod_user \
  -e DB_PASSWORD=secret_password \
  -e SERVER_PORT=80 \
  myapp:latest
```

**docker-compose.yml：**

```yaml
version: '3.8'
services:
  app:
    image: myapp:latest
    environment:
      - DB_URL=jdbc:mysql://mysql:3306/mydb
      - DB_USERNAME=root
      - DB_PASSWORD=123456
      - SERVER_PORT=8080
    ports:
      - "8080:8080"
```

### 8.5.5 配置加密（Jasypt）

生产环境中，敏感配置（如数据库密码）不应明文存储。可以使用 Jasypt 加密。

**添加依赖：**

```xml
<dependency>
    <groupId>com.github.ulisesbocchio</groupId>
    <artifactId>jasypt-spring-boot-starter</artifactId>
    <version>3.0.5</version>
</dependency>
```

**application.yml：**

```yaml
# Jasypt 加密配置
jasypt:
  encryptor:
    password: ${JASYPT_ENCRYPTOR_PASSWORD:mySecretKey}  # 加密密钥（从环境变量获取）
    algorithm: PBEWithMD5AndDES  # 加密算法
    iv-generator-classname: org.jasypt.iv.NoIvGenerator

spring:
  datasource:
    username: root
    password: ENC(加密后的密码)  # 加密格式：ENC(...)
```

**生成加密密码（Java代码）：**

```kotlin
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor

fun main() {
    val encryptor = StandardPBEStringEncryptor()
    encryptor.setPassword("mySecretKey")  // 加密密钥
    encryptor.setAlgorithm("PBEWithMD5AndDES")
    
    val originalPassword = "123456"  // 原始密码
    val encryptedPassword = encryptor.encrypt(originalPassword)
    
    println("原始密码: $originalPassword")
    println("加密后: ENC($encryptedPassword)")
    
    // 验证解密
    val decrypted = encryptor.decrypt(encryptedPassword)
    println("解密后: $decrypted")
}
```

**启动时传入加密密钥：**

```bash
java -jar myapp.jar -Djasypt.encryptor.password=mySecretKey
```

## 8.6 实战：完整的多环境配置示例

### 项目结构

```
src/main/resources/
├── application.yml                 # 主配置（公共）
├── application-dev.yml             # 开发环境
├── application-test.yml            # 测试环境
├── application-prod.yml            # 生产环境
├── logback-spring.xml              # 日志配置
└── db/
    ├── schema.sql
    └── data.sql
```

### 完整配置文件

**application.yml （主配置）：**

```yaml
# ===================================================================
# Spring Boot 公共配置
# 本配置适用于所有环境，特定环境配置会覆盖这里的配置
# ===================================================================

spring:
  application:
    name: spring-boot-kotlin-demo
  
  # 默认激活dev环境
  profiles:
    active: ${SPRING_PROFILES_ACTIVE:dev}
  
  # Jackson JSON配置
  jackson:
    date-format: yyyy-MM-dd HH:mm:ss
    time-zone: GMT+8
    default-property-inclusion: non_null
    serialization:
      write-dates-as-timestamps: false
      fail-on-empty-beans: false
    deserialization:
      fail-on-unknown-properties: false
  
  # 文件上传配置
  servlet:
    multipart:
      enabled: true
      max-file-size: 10MB
      max-request-size: 50MB
  
# 服务器公共配置
server:
  servlet:
    encoding:
      charset: UTF-8
      enabled: true
      force: true
  compression:
    enabled: true
    mime-types: application/json,application/xml,text/html,text/plain
    min-response-size: 1024

# MyBatis公共配置
mybatis:
  mapper-locations: classpath:mapper/**/*.xml
  type-aliases-package: com.example.demo.entity
  configuration:
    map-underscore-to-camel-case: true
    cache-enabled: true
    lazy-loading-enabled: true

# 日志格式
logging:
  pattern:
    console: "%d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %-5level %logger{50} - %msg%n"
    file: "%d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %-5level %logger{50} - %msg%n"
```

**application-dev.yml （开发环境）：**

```yaml
# ===================================================================
# 开发环境配置
# 使用H2内存数据库，详细日志，开启调试工具
# ===================================================================

server:
  port: 8080

spring:
  # H2内存数据库
  datasource:
    driver-class-name: org.h2.Driver
    url: jdbc:h2:mem:devdb;MODE=MySQL;DB_CLOSE_DELAY=-1;DB_CLOSE_ON_EXIT=FALSE
    username: sa
    password: 
  
  h2:
    console:
      enabled: true  # http://localhost:8080/h2-console
      path: /h2-console
  
  # 自动初始化数据库
  sql:
    init:
      mode: always
      schema-locations: classpath:db/schema.sql
      data-locations: classpath:db/data.sql
  
  # 开发工具
  devtools:
    restart:
      enabled: true
    livereload:
      enabled: true

mybatis:
  configuration:
    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl  # 控制台打印SQL

logging:
  level:
    root: INFO
    com.example.demo: DEBUG  # 项目详细日志
    com.example.demo.mapper: DEBUG  # SQL日志
```

**application-prod.yml （生产环境）：**

```yaml
# ===================================================================
# 生产环境配置
# 使用MySQL，日志输出到文件，启用安全配置
# ===================================================================

server:
  port: ${SERVER_PORT:80}

spring:
  # MySQL数据库
  datasource:
    driver-class-name: com.mysql.cj.jdbc.Driver
    url: ${DB_URL:jdbc:mysql://localhost:3306/proddb?useUnicode=true&characterEncoding=utf8&useSSL=true&serverTimezone=Asia/Shanghai}
    username: ${DB_USERNAME:root}
    password: ${DB_PASSWORD:}
    hikari:
      maximum-pool-size: 50
      minimum-idle: 10
      connection-timeout: 20000
      idle-timeout: 300000
      max-lifetime: 1200000
      pool-name: ProdHikariCP

mybatis:
  configuration:
    log-impl: org.apache.ibatis.logging.slf4j.Slf4jImpl

logging:
  level:
    root: WARN
    com.example.demo: INFO
  file:
    name: /var/log/myapp/application.log
    max-size: 100MB
    max-history: 90
```

## 8.7 本章小结

本章详细介绍了 Spring Boot 配置文件管理：

✅ **配置文件格式**：application.yml vs application.properties
✅ **基础配置**：数据库、MyBatis、日志、Jackson
✅ **多环境管理**：dev/test/prod 环境配置与切换
✅ **Profile 激活**：配置文件、命令行、环境变量、Maven
✅ **@ConfigurationProperties**：类型安全的配置绑定与验证
✅ **配置优先级**：命令行 > 环境变量 > 配置文件
✅ **外部化配置**：环境变量、外部文件
✅ **配置加密**：Jasypt 加密敏感配置

**关键要点：**

- 使用 YAML 格式，层次更清晰
- 合理划分多环境配置，避免硬编码
- 使用 `@ConfigurationProperties` 代替大量 `@Value`
- 生产环境使用环境变量或加密配置
- 了解配置优先级，避免配置被意外覆盖

**最佳实践：**

1. 公共配置放在 `application.yml`
2. 特定环境配置放在 `application-{profile}.yml`
3. 敏感信息使用环境变量或加密
4. 配置类使用 `@ConfigurationProperties` + `@Validated`
5. 为配置提供合理的默认值

**下一章预告：**
在下一章中，我们将学习 Redis 缓存系统的集成，包括 Redis 基本操作、缓存注解、分布式缓存等内容。

---

# 第9章：缓存系统：Redis 集成

## 9.1 Redis 基础概念

### 9.1.1 什么是 Redis？

**Redis**（Remote Dictionary Server）是一个开源的、基于内存的高性能键值（Key-Value）存储系统。它可以用作：
- **数据库**：持久化存储数据
- **缓存**：提高数据读取速度
- **消息队列**：实现发布/订阅功能

### 9.1.2 Redis 的特点

✅ **高性能**：数据存储在内存中，读写速度极快（10万+ QPS）
✅ **丰富的数据类型**：String、Hash、List、Set、Sorted Set
✅ **持久化**：支持 RDB 和 AOF 两种持久化方式
✅ **原子性操作**：所有操作都是原子性的
✅ **支持事务**：通过 MULTI/EXEC 实现事务
✅ **发布/订阅**：支持消息的发布和订阅模式
✅ **过期策略**：支持键的过期时间设置

### 9.1.3 Redis 常见数据类型

| 数据类型 | 说明 | 常用场景 |
|---------|------|---------|
| **String** | 字符串，最大 512MB | 缓存对象、计数器、分布式锁 |
| **Hash** | 哈希表（字段-值对） | 存储对象（如用户信息） |
| **List** | 双向链表 | 消息队列、最新列表 |
| **Set** | 无序集合（不重复） | 标签、共同好友 |
| **Sorted Set** | 有序集合（带分数） | 排行榜、延迟队列 |

### 9.1.4 为什么使用 Redis 缓存？

**问题场景：**
```
用户请求 → 应用服务器 → 数据库查询 → 返回数据
             ↑                ↓
             |      数据库压力大，查询慢
             └────────────────┘
```

**引入 Redis 缓存后：**
```
用户请求 → 应用服务器 → Redis缓存（命中） → 返回数据（快！）
             ↓
          Redis缓存（未命中）
             ↓
          数据库查询 → 写入Redis → 返回数据
```

**优势：**
- ⚡ **提升性能**：内存读取比数据库快 100+ 倍
- 🛡️ **减轻数据库压力**：缓存承担大部分读请求
- 💰 **降低成本**：减少数据库连接和查询次数
- 🚀 **提升用户体验**：响应时间从秒级降到毫秒级

## 9.2 Spring Boot 集成 Redis

### 9.2.1 安装 Redis（Windows）

**方式1：使用 Docker（推荐）**

```bash
# 拉取 Redis 镜像
docker pull redis:latest

# 运行 Redis 容器
docker run -d \
  --name redis \
  -p 6379:6379 \
  redis:latest

# 测试连接
docker exec -it redis redis-cli
> ping
PONG
> set test "Hello Redis"
OK
> get test
"Hello Redis"
```

**方式2：使用 Docker Compose**

`docker-compose.yml`:
```yaml
version: '3.8'
services:
  redis:
    image: redis:latest
    container_name: redis
    ports:
      - "6379:6379"
    volumes:
      - redis-data:/data
    command: redis-server --appendonly yes
    # --appendonly yes: 开启AOF持久化
    restart: unless-stopped

volumes:
  redis-data:
```

启动：
```bash
docker-compose up -d
```

### 9.2.2 添加依赖

`pom.xml`:
```xml
<!-- Spring Boot Redis 依赖 -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-data-redis</artifactId>
</dependency>

<!-- Lettuce 连接池（Spring Boot 2.x 默认） -->
<dependency>
    <groupId>org.apache.commons</groupId>
    <artifactId>commons-pool2</artifactId>
</dependency>

<!-- Jackson Kotlin 模块（JSON序列化） -->
<dependency>
    <groupId>com.fasterxml.jackson.module</groupId>
    <artifactId>jackson-module-kotlin</artifactId>
</dependency>
```

**依赖说明：**
- `spring-boot-starter-data-redis`：Spring Data Redis 核心依赖
- `commons-pool2`：Lettuce 连接池支持
- `jackson-module-kotlin`：Kotlin 对象序列化支持

### 9.2.3 配置 Redis

**application.yml**:
```yaml
spring:
  # Redis 配置
  redis:
    host: localhost  # Redis 服务器地址
    port: 6379  # Redis 端口
    password:  # Redis 密码（如果设置了）
    database: 0  # 数据库索引（0-15）
    timeout: 5000ms  # 连接超时时间
    
    # Lettuce 连接池配置
    lettuce:
      pool:
        max-active: 20  # 连接池最大连接数
        max-idle: 10  # 连接池最大空闲连接数
        min-idle: 5  # 连接池最小空闲连接数
        max-wait: 2000ms  # 连接池最大阻塞等待时间
      shutdown-timeout: 100ms  # 关闭超时时间
    
    # 如果使用 Jedis 客户端（需要排除Lettuce依赖）
    # jedis:
    #   pool:
    #     max-active: 20
    #     max-idle: 10
    #     min-idle: 5
    #     max-wait: 2000ms
```

**配置参数说明：**
- `host`：Redis 服务器地址
- `port`：Redis 端口，默认 6379
- `password`：密码，如果 Redis 设置了密码需要填写
- `database`：Redis 有 16 个数据库（0-15），默认使用 0
- `timeout`：连接超时时间
- `lettuce.pool.max-active`：连接池最大连接数，根据并发量设置
- `lettuce.pool.max-wait`：当连接池耗尽时，最大等待时间

### 9.2.4 配置 RedisTemplate

```kotlin
package com.example.demo.config

import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.module.kotlin.registerKotlinModule
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.data.redis.connection.RedisConnectionFactory
import org.springframework.data.redis.core.RedisTemplate
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer
import org.springframework.data.redis.serializer.StringRedisSerializer

/**
 * Redis 配置类
 * 
 * RedisTemplate 是 Spring Data Redis 提供的核心类，用于操作 Redis
 */
@Configuration
class RedisConfig {
    
    /**
     * 配置 RedisTemplate
     * 
     * 默认的 RedisTemplate 使用 JDK 序列化，可读性差，且占用空间大
     * 这里配置使用 JSON 序列化，提高可读性
     * 
     * @param connectionFactory Redis 连接工厂（由 Spring Boot 自动配置）
     */
    @Bean
    fun redisTemplate(connectionFactory: RedisConnectionFactory): RedisTemplate<String, Any> {
        val template = RedisTemplate<String, Any>()
        template.connectionFactory = connectionFactory
        
        // 创建 ObjectMapper 并注册 Kotlin 模块
        val objectMapper = ObjectMapper().apply {
            registerKotlinModule()  // 支持 Kotlin 数据类
            // 可以添加其他配置
            // findAndRegisterModules()  // 自动注册所有模块
        }
        
        // JSON 序列化器（用于值）
        val jackson2JsonRedisSerializer = Jackson2JsonRedisSerializer(Any::class.java).apply {
            setObjectMapper(objectMapper)
        }
        
        // String 序列化器（用于键）
        val stringRedisSerializer = StringRedisSerializer()
        
        // 设置键的序列化方式：String
        template.keySerializer = stringRedisSerializer
        // 设置 Hash 键的序列化方式：String
        template.hashKeySerializer = stringRedisSerializer
        
        // 设置值的序列化方式：JSON
        template.valueSerializer = jackson2JsonRedisSerializer
        // 设置 Hash 值的序列化方式：JSON
        template.hashValueSerializer = jackson2JsonRedisSerializer
        
        template.afterPropertiesSet()
        return template
    }
}
```

**配置说明：**

1. **为什么要自定义 RedisTemplate？**
   - Spring Boot 默认的 RedisTemplate 使用 JDK 序列化
   - JDK 序列化的缺点：不可读、占用空间大、跨语言支持差
   - JSON 序列化：可读性好、占用空间小、通用性强

2. **序列化器选择：**
   - **Key**：使用 `StringRedisSerializer`，键始终是字符串
   - **Value**：使用 `Jackson2JsonRedisSerializer`，值序列化为 JSON
   - **HashKey/HashValue**：同上

3. **为什么注册 Kotlin 模块？**
   - Kotlin 数据类有特殊的构造方式
   - 注册 Kotlin 模块后，Jackson 才能正确序列化/反序列化 Kotlin 对象

## 9.3 RedisTemplate 基本操作

### 9.3.1 String 类型操作

```kotlin
package com.example.demo.service

import org.springframework.data.redis.core.RedisTemplate
import org.springframework.stereotype.Service
import java.time.Duration
import java.util.concurrent.TimeUnit

/**
 * Redis 服务类
 */
@Service
class RedisService(
    private val redisTemplate: RedisTemplate<String, Any>
) {
    
    // ========== String 类型操作 ==========
    
    /**
     * 设置缓存
     * 
     * @param key 键
     * @param value 值
     */
    fun set(key: String, value: Any) {
        redisTemplate.opsForValue().set(key, value)
    }
    
    /**
     * 设置缓存并指定过期时间
     * 
     * @param key 键
     * @param value 值
     * @param timeout 过期时间（秒）
     */
    fun set(key: String, value: Any, timeout: Long) {
        redisTemplate.opsForValue().set(key, value, timeout, TimeUnit.SECONDS)
    }
    
    /**
     * 设置缓存（使用 Duration）
     * 
     * @param key 键
     * @param value 值
     * @param duration 过期时间
     */
    fun set(key: String, value: Any, duration: Duration) {
        redisTemplate.opsForValue().set(key, value, duration)
    }
    
    /**
     * 获取缓存
     * 
     * @param key 键
     * @return 值，不存在返回 null
     */
    fun get(key: String): Any? {
        return redisTemplate.opsForValue().get(key)
    }
    
    /**
     * 获取缓存（泛型版本）
     * 
     * @param key 键
     * @return 值，不存在返回 null
     */
    inline fun <reified T> get(key: String): T? {
        return redisTemplate.opsForValue().get(key) as? T
    }
    
    /**
     * 删除缓存
     * 
     * @param key 键
     * @return 是否删除成功
     */
    fun delete(key: String): Boolean {
        return redisTemplate.delete(key)
    }
    
    /**
     * 批量删除缓存
     * 
     * @param keys 键列表
     * @return 删除的数量
     */
    fun delete(vararg keys: String): Long {
        return redisTemplate.delete(keys.toList()) ?: 0
    }
    
    /**
     * 判断键是否存在
     * 
     * @param key 键
     * @return 是否存在
     */
    fun hasKey(key: String): Boolean {
        return redisTemplate.hasKey(key)
    }
    
    /**
     * 设置过期时间
     * 
     * @param key 键
     * @param timeout 过期时间（秒）
     * @return 是否设置成功
     */
    fun expire(key: String, timeout: Long): Boolean {
        return redisTemplate.expire(key, timeout, TimeUnit.SECONDS)
    }
    
    /**
     * 获取过期时间
     * 
     * @param key 键
     * @return 剩余过期时间（秒），-1表示永不过期，-2表示键不存在
     */
    fun getExpire(key: String): Long {
        return redisTemplate.getExpire(key, TimeUnit.SECONDS)
    }
    
    /**
     * 递增
     * 
     * @param key 键
     * @param delta 增量（默认1）
     * @return 递增后的值
     */
    fun increment(key: String, delta: Long = 1): Long {
        return redisTemplate.opsForValue().increment(key, delta) ?: 0
    }
    
    /**
     * 递减
     * 
     * @param key 键
     * @param delta 减量（默认1）
     * @return 递减后的值
     */
    fun decrement(key: String, delta: Long = 1): Long {
        return redisTemplate.opsForValue().decrement(key, delta) ?: 0
    }
}
```

### 9.3.2 Hash 类型操作

```kotlin
/**
 * Hash 类型操作
 * 
 * Hash 类型适合存储对象，字段可以单独读写
 */
@Service
class RedisHashService(
    private val redisTemplate: RedisTemplate<String, Any>
) {
    
    /**
     * 设置 Hash 字段
     * 
     * @param key 键
     * @param field 字段
     * @param value 值
     */
    fun hSet(key: String, field: String, value: Any) {
        redisTemplate.opsForHash<String, Any>().put(key, field, value)
    }
    
    /**
     * 批量设置 Hash 字段
     * 
     * @param key 键
     * @param map 字段-值映射
     */
    fun hSetAll(key: String, map: Map<String, Any>) {
        redisTemplate.opsForHash<String, Any>().putAll(key, map)
    }
    
    /**
     * 获取 Hash 字段
     * 
     * @param key 键
     * @param field 字段
     * @return 值
     */
    fun hGet(key: String, field: String): Any? {
        return redisTemplate.opsForHash<String, Any>().get(key, field)
    }
    
    /**
     * 获取 Hash 所有字段
     * 
     * @param key 键
     * @return 所有字段-值映射
     */
    fun hGetAll(key: String): Map<String, Any> {
        return redisTemplate.opsForHash<String, Any>().entries(key)
    }
    
    /**
     * 删除 Hash 字段
     * 
     * @param key 键
     * @param fields 字段列表
     * @return 删除的数量
     */
    fun hDelete(key: String, vararg fields: String): Long {
        return redisTemplate.opsForHash<String, Any>().delete(key, *fields)
    }
    
    /**
     * 判断 Hash 字段是否存在
     * 
     * @param key 键
     * @param field 字段
     * @return 是否存在
     */
    fun hHasKey(key: String, field: String): Boolean {
        return redisTemplate.opsForHash<String, Any>().hasKey(key, field)
    }
    
    /**
     * Hash 字段递增
     * 
     * @param key 键
     * @param field 字段
     * @param delta 增量
     * @return 递增后的值
     */
    fun hIncrement(key: String, field: String, delta: Long): Long {
        return redisTemplate.opsForHash<String, Any>().increment(key, field, delta)
    }
}
```

### 9.3.3 List、Set、Sorted Set 操作

```kotlin
/**
 * List/Set/Sorted Set 操作
 */
@Service
class RedisCollectionService(
    private val redisTemplate: RedisTemplate<String, Any>
) {
    
    // ========== List 操作 ==========
    
    /**
     * 从右侧添加元素到 List
     * 
     * @param key 键
     * @param value 值
     * @return List 长度
     */
    fun listRightPush(key: String, value: Any): Long {
        return redisTemplate.opsForList().rightPush(key, value) ?: 0
    }
    
    /**
     * 从左侧添加元素到 List
     * 
     * @param key 键
     * @param value 值
     * @return List 长度
     */
    fun listLeftPush(key: String, value: Any): Long {
        return redisTemplate.opsForList().leftPush(key, value) ?: 0
    }
    
    /**
     * 从右侧弹出元素
     * 
     * @param key 键
     * @return 弹出的元素
     */
    fun listRightPop(key: String): Any? {
        return redisTemplate.opsForList().rightPop(key)
    }
    
    /**
     * 获取 List 指定范围的元素
     * 
     * @param key 键
     * @param start 开始位置（0开始）
     * @param end 结束位置（-1表示最后）
     * @return 元素列表
     */
    fun listRange(key: String, start: Long, end: Long): List<Any> {
        return redisTemplate.opsForList().range(key, start, end) ?: emptyList()
    }
    
    /**
     * 获取 List 长度
     * 
     * @param key 键
     * @return 长度
     */
    fun listSize(key: String): Long {
        return redisTemplate.opsForList().size(key) ?: 0
    }
    
    // ========== Set 操作 ==========
    
    /**
     * 添加元素到 Set
     * 
     * @param key 键
     * @param values 值列表
     * @return 添加的数量
     */
    fun setAdd(key: String, vararg values: Any): Long {
        return redisTemplate.opsForSet().add(key, *values) ?: 0
    }
    
    /**
     * 获取 Set 所有元素
     * 
     * @param key 键
     * @return 元素集合
     */
    fun setMembers(key: String): Set<Any> {
        return redisTemplate.opsForSet().members(key) ?: emptySet()
    }
    
    /**
     * 判断元素是否在 Set 中
     * 
     * @param key 键
     * @param value 值
     * @return 是否存在
     */
    fun setIsMember(key: String, value: Any): Boolean {
        return redisTemplate.opsForSet().isMember(key, value) ?: false
    }
    
    /**
     * 移除 Set 元素
     * 
     * @param key 键
     * @param values 值列表
     * @return 移除的数量
     */
    fun setRemove(key: String, vararg values: Any): Long {
        return redisTemplate.opsForSet().remove(key, *values) ?: 0
    }
    
    // ========== Sorted Set 操作 ==========
    
    /**
     * 添加元素到 Sorted Set
     * 
     * @param key 键
     * @param value 值
     * @param score 分数
     * @return 是否添加成功
     */
    fun zAdd(key: String, value: Any, score: Double): Boolean {
        return redisTemplate.opsForZSet().add(key, value, score) ?: false
    }
    
    /**
     * 获取 Sorted Set 指定范围的元素（按分数从小到大）
     * 
     * @param key 键
     * @param start 开始位置
     * @param end 结束位置
     * @return 元素集合
     */
    fun zRange(key: String, start: Long, end: Long): Set<Any> {
        return redisTemplate.opsForZSet().range(key, start, end) ?: emptySet()
    }
    
    /**
     * 获取 Sorted Set 指定范围的元素（按分数从大到小）
     * 
     * @param key 键
     * @param start 开始位置
     * @param end 结束位置
     * @return 元素集合
     */
    fun zReverseRange(key: String, start: Long, end: Long): Set<Any> {
        return redisTemplate.opsForZSet().reverseRange(key, start, end) ?: emptySet()
    }
    
    /**
     * 获取元素的排名（从小到大）
     * 
     * @param key 键
     * @param value 值
     * @return 排名（0开始），不存在返回null
     */
    fun zRank(key: String, value: Any): Long? {
        return redisTemplate.opsForZSet().rank(key, value)
    }
    
    /**
     * 移除 Sorted Set 元素
     * 
     * @param key 键
     * @param values 值列表
     * @return 移除的数量
     */
    fun zRemove(key: String, vararg values: Any): Long {
        return redisTemplate.opsForZSet().remove(key, *values) ?: 0
    }
}
```

## 9.4 Spring Cache 缓存注解

Spring 提供了一套声明式缓存注解，可以方便地为方法添加缓存功能。

### 9.4.1 启用缓存

在主类或配置类上添加 `@EnableCaching` 注解：

```kotlin
package com.example.demo

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.cache.annotation.EnableCaching

@SpringBootApplication
@EnableCaching  // 启用缓存
class DemoApplication

fun main(args: Array<String>) {
    runApplication<DemoApplication>(*args)
}
```

### 9.4.2 配置缓存管理器

```kotlin
package com.example.demo.config

import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.module.kotlin.registerKotlinModule
import org.springframework.cache.CacheManager
import org.springframework.cache.annotation.CachingConfigurerSupport
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.data.redis.cache.RedisCacheConfiguration
import org.springframework.data.redis.cache.RedisCacheManager
import org.springframework.data.redis.connection.RedisConnectionFactory
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer
import org.springframework.data.redis.serializer.RedisSerializationContext
import org.springframework.data.redis.serializer.StringRedisSerializer
import java.time.Duration

/**
 * 缓存配置类
 */
@Configuration
class CacheConfig : CachingConfigurerSupport() {
    
    /**
     * 配置缓存管理器
     * 
     * @param connectionFactory Redis 连接工厂
     * @return 缓存管理器
     */
    @Bean
    override fun cacheManager(): CacheManager {
        // 创建 ObjectMapper
        val objectMapper = ObjectMapper().apply {
            registerKotlinModule()
        }
        
        // JSON 序列化器
        val jackson2JsonRedisSerializer = Jackson2JsonRedisSerializer(Any::class.java).apply {
            setObjectMapper(objectMapper)
        }
        
        // String 序列化器
        val stringRedisSerializer = StringRedisSerializer()
        
        // 配置缓存
        val config = RedisCacheConfiguration.defaultCacheConfig()
            .entryTtl(Duration.ofHours(1))  // 默认缓存过期时间：1小时
            .serializeKeysWith(
                RedisSerializationContext.SerializationPair.fromSerializer(stringRedisSerializer)
            )
            .serializeValuesWith(
                RedisSerializationContext.SerializationPair.fromSerializer(jackson2JsonRedisSerializer)
            )
            .disableCachingNullValues()  // 不缓存 null 值
        
        return RedisCacheManager.builder(connectionFactory)
            .cacheDefaults(config)
            .build()
    }
    
    companion object {
        private lateinit var connectionFactory: RedisConnectionFactory
        
        @Bean
        fun setConnectionFactory(factory: RedisConnectionFactory): RedisConnectionFactory {
            connectionFactory = factory
            return factory
        }
    }
}
```

**需要修正的完整版本：**

```kotlin
package com.example.demo.config

import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.module.kotlin.registerKotlinModule
import org.springframework.cache.CacheManager
import org.springframework.cache.annotation.EnableCaching
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.data.redis.cache.RedisCacheConfiguration
import org.springframework.data.redis.cache.RedisCacheManager
import org.springframework.data.redis.connection.RedisConnectionFactory
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer
import org.springframework.data.redis.serializer.RedisSerializationContext
import org.springframework.data.redis.serializer.StringRedisSerializer
import java.time.Duration

/**
 * 缓存配置类
 */
@Configuration
@EnableCaching  // 启用缓存
class CacheConfig {
    
    /**
     * 配置缓存管理器
     * 
     * CacheManager 负责管理所有缓存，包括创建、获取、清除缓存
     * 
     * @param connectionFactory Redis 连接工厂（Spring Boot 自动注入）
     * @return 缓存管理器
     */
    @Bean
    fun cacheManager(connectionFactory: RedisConnectionFactory): CacheManager {
        // 创建 ObjectMapper 并注册 Kotlin 模块
        val objectMapper = ObjectMapper().apply {
            registerKotlinModule()
        }
        
        // JSON 序列化器（用于值）
        val jackson2JsonRedisSerializer = Jackson2JsonRedisSerializer(Any::class.java).apply {
            setObjectMapper(objectMapper)
        }
        
        // String 序列化器（用于键）
        val stringRedisSerializer = StringRedisSerializer()
        
        // 配置缓存
        val config = RedisCacheConfiguration.defaultCacheConfig()
            .entryTtl(Duration.ofHours(1))  // 默认缓存过期时间：1小时
            .serializeKeysWith(
                // 键序列化：String
                RedisSerializationContext.SerializationPair.fromSerializer(stringRedisSerializer)
            )
            .serializeValuesWith(
                // 值序列化：JSON
                RedisSerializationContext.SerializationPair.fromSerializer(jackson2JsonRedisSerializer)
            )
            .disableCachingNullValues()  // 不缓存 null 值（防止缓存穿透）
        
        // 创建缓存管理器
        return RedisCacheManager.builder(connectionFactory)
            .cacheDefaults(config)  // 使用默认配置
            .transactionAware()  // 支持事务
            .build()
    }
}
```

### 9.4.3 缓存注解详解

#### @Cacheable（查询缓存）

**作用**：在方法执行前，先查询缓存，如果缓存存在则直接返回；如果不存在则执行方法并将结果缓存。

```kotlin
package com.example.demo.service

import com.example.demo.entity.User
import com.example.demo.mapper.UserMapper
import org.springframework.cache.annotation.Cacheable
import org.springframework.stereotype.Service

@Service
class UserService(
    private val userMapper: UserMapper
) {
    
    /**
     * 根据ID查询用户（带缓存）
     * 
     * @Cacheable 注解参数：
     * - value/cacheNames: 缓存名称（必填）
     * - key: 缓存键，支持 SpEL 表达式（可选，默认使用方法参数）
     * - unless: 条件，为 true 时不缓存（可选）
     * - condition: 条件，为 true 时才缓存（可选）
     * 
     * 缓存键： user::1（缓存名::key）
     * 
     * @param id 用户ID
     * @return 用户信息
     */
    @Cacheable(
        value = ["user"],  // 缓存名称
        key = "#id",  // 缓存键：使用参数 id
        unless = "#result == null"  // 结果为 null 时不缓存
    )
    fun getUserById(id: Long): User? {
        println("从数据库查询用户: $id")
        return userMapper.findById(id)
    }
    
    /**
     * 根据用户名查询用户
     * 
     * key 可以使用方法名、参数、返回值等
     */
    @Cacheable(
        value = ["user"],
        key = "'username:' + #username"  // 缓存键：user::username:zhangsan
    )
    fun getUserByUsername(username: String): User? {
        println("从数据库查询用户名: $username")
        return userMapper.findByUsername(username)
    }
    
    /**
     * 查询所有用户
     * 
     * key 使用固定值
     */
    @Cacheable(
        value = ["users"],
        key = "'all'"  // 缓存键：users::all
    )
    fun getAllUsers(): List<User> {
        println("从数据库查询所有用户")
        return userMapper.findAll()
    }
}
```

**@Cacheable 常用 SpEL 表达式：**

| 表达式 | 说明 | 示例 |
|-------|------|------|
| `#id` | 参数名 | `#id`、`#username` |
| `#p0`、`#a0` | 第1个参数 | `#p0`、`#a0` |
| `#root.methodName` | 方法名 | `'method:' + #root.methodName` |
| `#result` | 返回值 | `#result.id`（unless 中使用） |
| `#root.target` | 目标对象 | `#root.target.class.name` |

#### @CachePut（更新缓存）

**作用**：无论缓存是否存在，都执行方法，并将结果更新到缓存。

```kotlin
/**
 * 更新用户（更新缓存）
 * 
 * @CachePut：先执行方法，再更新缓存
 * 注意：key 必须与 @Cacheable 的 key 一致，才能更新正确的缓存
 * 
 * @param user 用户信息
 * @return 更新后的用户信息
 */
@CachePut(
    value = ["user"],
    key = "#user.id"  // 使用返回值的 id 作为 key
)
fun updateUser(user: User): User {
    println("更新用户: ${user.id}")
    userMapper.update(user)
    return userMapper.findById(user.id)!!
}
```

#### @CacheEvict（删除缓存）

**作用**：删除指定的缓存。

```kotlin
/**
 * 删除用户（删除缓存）
 * 
 * @CacheEvict 注解参数：
 * - value/cacheNames: 缓存名称
 * - key: 缓存键
 * - allEntries: 是否删除所有缓存（默认 false）
 * - beforeInvocation: 是否在方法执行前删除（默认 false，方法执行后删除）
 * 
 * @param id 用户ID
 */
@CacheEvict(
    value = ["user"],
    key = "#id"
)
fun deleteUser(id: Long) {
    println("删除用户: $id")
    userMapper.deleteById(id)
}

/**
 * 清空用户缓存
 * 
 * allEntries = true: 删除 user 缓存下的所有数据
 */
@CacheEvict(
    value = ["user", "users"],  // 删除多个缓存
    allEntries = true
)
fun clearCache() {
    println("清空用户缓存")
}
```

#### @Caching（组合注解）

**作用**：组合多个缓存操作。

```kotlin
/**
 * 更新用户（组合缓存操作）
 * 
 * 同时更新多个缓存键
 */
@Caching(
    put = [
        CachePut(value = ["user"], key = "#user.id"),  // 更新 ID 缓存
        CachePut(value = ["user"], key = "'username:' + #user.username")  // 更新用户名缓存
    ],
    evict = [
        CacheEvict(value = ["users"], key = "'all'")  // 删除用户列表缓存
    ]
)
fun updateUserWithClear(user: User): User {
    userMapper.update(user)
    return userMapper.findById(user.id)!!
}
```

### 9.4.4 测试缓存

```kotlin
package com.example.demo.controller

import com.example.demo.dto.ApiResponse
import com.example.demo.entity.User
import com.example.demo.service.UserService
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/users")
class UserController(
    private val userService: UserService
) {
    
    /**
     * 查询用户（带缓存）
     * 
     * 第一次请求会查询数据库并缓存
     * 后续请求直接从缓存返回
     */
    @GetMapping("/{id}")
    fun getUser(@PathVariable id: Long): ApiResponse<User> {
        val user = userService.getUserById(id)
        return if (user != null) {
            ApiResponse.success(user)
        } else {
            ApiResponse.notFound("用户不存在")
        }
    }
    
    /**
     * 更新用户（更新缓存）
     */
    @PutMapping("/{id}")
    fun updateUser(
        @PathVariable id: Long,
        @RequestBody user: User
    ): ApiResponse<User> {
        user.id = id
        val updated = userService.updateUser(user)
        return ApiResponse.success(updated)
    }
    
    /**
     * 删除用户（删除缓存）
     */
    @DeleteMapping("/{id}")
    fun deleteUser(@PathVariable id: Long): ApiResponse<Void> {
        userService.deleteUser(id)
        return ApiResponse.success(message = "删除成功")
    }
    
    /**
     * 清空缓存
     */
    @PostMapping("/clear-cache")
    fun clearCache(): ApiResponse<Void> {
        userService.clearCache()
        return ApiResponse.success(message = "缓存已清空")
    }
}
```

**测试步骤：**

```bash
# 1. 第一次查询（查数据库）
curl http://localhost:8080/users/1
# 控制台输出：从数据库查询用户: 1

# 2. 第二次查询（从缓存）
curl http://localhost:8080/users/1
# 控制台无输出，直接从缓存返回

# 3. 更新用户（更新缓存）
curl -X PUT http://localhost:8080/users/1 \
  -H "Content-Type: application/json" \
  -d '{"username":"newname","email":"new@example.com"}'
# 控制台输出：更新用户: 1

# 4. 再次查询（从缓存获取更新后的数据）
curl http://localhost:8080/users/1
# 返回更新后的数据，无数据库查询

# 5. 删除用户（删除缓存）
curl -X DELETE http://localhost:8080/users/1
# 控制台输出：删除用户: 1
```

## 9.5 Redis 常见应用场景

### 9.5.1 接口结果缓存

**场景**：热点数据查询，如首页商品列表、文章详情等。

```kotlin
@Service
class ProductService(
    private val productMapper: ProductMapper
) {
    
    /**
     * 获取热门商品（缓存30分钟）
     */
    @Cacheable(
        value = ["hot_products"],
        key = "'list'",
        unless = "#result.isEmpty()"
    )
    fun getHotProducts(): List<Product> {
        return productMapper.findHotProducts()
    }
}
```

**配置不同过期时间：**

```kotlin
@Bean
fun cacheManager(connectionFactory: RedisConnectionFactory): CacheManager {
    // 不同缓存不同过期时间
    val cacheConfigurations = mapOf(
        "user" to createCacheConfig(Duration.ofHours(1)),  // 用户缓存：1小时
        "product" to createCacheConfig(Duration.ofMinutes(30)),  // 商品缓存：30分钟
        "hot_products" to createCacheConfig(Duration.ofMinutes(10))  // 热门商品：10分钟
    )
    
    return RedisCacheManager.builder(connectionFactory)
        .cacheDefaults(createCacheConfig(Duration.ofHours(1)))  // 默认1小时
        .withInitialCacheConfigurations(cacheConfigurations)  // 自定义配置
        .build()
}

private fun createCacheConfig(ttl: Duration): RedisCacheConfiguration {
    val objectMapper = ObjectMapper().apply { registerKotlinModule() }
    val jackson2JsonRedisSerializer = Jackson2JsonRedisSerializer(Any::class.java).apply {
        setObjectMapper(objectMapper)
    }
    
    return RedisCacheConfiguration.defaultCacheConfig()
        .entryTtl(ttl)
        .serializeKeysWith(RedisSerializationContext.SerializationPair.fromSerializer(StringRedisSerializer()))
        .serializeValuesWith(RedisSerializationContext.SerializationPair.fromSerializer(jackson2JsonRedisSerializer))
        .disableCachingNullValues()
}
```

### 9.5.2 计数器

**场景**：文章阅读量、点赞数、访问统计等。

```kotlin
@Service
class ArticleService(
    private val redisService: RedisService
) {
    
    /**
     * 增加文章阅读量
     * 
     * @param articleId 文章ID
     * @return 新的阅读量
     */
    fun incrementViewCount(articleId: Long): Long {
        val key = "article:view:$articleId"
        return redisService.increment(key)
    }
    
    /**
     * 获取文章阅读量
     * 
     * @param articleId 文章ID
     * @return 阅读量
     */
    fun getViewCount(articleId: Long): Long {
        val key = "article:view:$articleId"
        val count = redisService.get<String>(key)
        return count?.toLongOrNull() ?: 0
    }
    
    /**
     * 点赞文章
     * 
     * 使用 Set 存储点赞用户，防止重复点赞
     * 
     * @param articleId 文章ID
     * @param userId 用户ID
     * @return 是否点赞成功
     */
    fun likeArticle(articleId: Long, userId: Long): Boolean {
        val key = "article:like:$articleId"
        // Set.add 返回添加的数量，如果已存在返回0
        val added = redisTemplate.opsForSet().add(key, userId) ?: 0
        return added > 0
    }
    
    /**
     * 取消点赞
     * 
     * @param articleId 文章ID
     * @param userId 用户ID
     * @return 是否取消成功
     */
    fun unlikeArticle(articleId: Long, userId: Long): Boolean {
        val key = "article:like:$articleId"
        val removed = redisTemplate.opsForSet().remove(key, userId) ?: 0
        return removed > 0
    }
    
    /**
     * 获取文章点赞数
     * 
     * @param articleId 文章ID
     * @return 点赞数
     */
    fun getLikeCount(articleId: Long): Long {
        val key = "article:like:$articleId"
        return redisTemplate.opsForSet().size(key) ?: 0
    }
    
    /**
     * 判断用户是否点赞
     * 
     * @param articleId 文章ID
     * @param userId 用户ID
     * @return 是否已点赞
     */
    fun isLiked(articleId: Long, userId: Long): Boolean {
        val key = "article:like:$articleId"
        return redisTemplate.opsForSet().isMember(key, userId) ?: false
    }
}
```

### 9.5.3 排行榜

**场景**：游戏积分排行、销量排行、热搜榜等。

```kotlin
@Service
class RankService(
    private val redisTemplate: RedisTemplate<String, Any>
) {
    
    companion object {
        private const val RANK_KEY = "rank:score"
    }
    
    /**
     * 添加/更新用户分数
     * 
     * @param userId 用户ID
     * @param score 分数
     */
    fun addScore(userId: Long, score: Double) {
        redisTemplate.opsForZSet().add(RANK_KEY, userId, score)
    }
    
    /**
     * 增加用户分数
     * 
     * @param userId 用户ID
     * @param delta 增量
     * @return 新分数
     */
    fun incrementScore(userId: Long, delta: Double): Double {
        return redisTemplate.opsForZSet().incrementScore(RANK_KEY, userId, delta) ?: 0.0
    }
    
    /**
     * 获取用户排名（从高到低）
     * 
     * @param userId 用户ID
     * @return 排名（0开始），不存在返回null
     */
    fun getRank(userId: Long): Long? {
        return redisTemplate.opsForZSet().reverseRank(RANK_KEY, userId)
    }
    
    /**
     * 获取用户分数
     * 
     * @param userId 用户ID
     * @return 分数
     */
    fun getScore(userId: Long): Double? {
        return redisTemplate.opsForZSet().score(RANK_KEY, userId)
    }
    
    /**
     * 获取排行榜（TOP N）
     * 
     * @param topN 排名数量
     * @return 排行榜（用户ID列表，按分数从高到低）
     */
    fun getTopN(topN: Int): List<Pair<Long, Double>> {
        val set = redisTemplate.opsForZSet()
            .reverseRangeWithScores(RANK_KEY, 0, (topN - 1).toLong())
            ?: emptySet()
        
        return set.map { 
            (it.value as Long) to (it.score ?: 0.0)
        }
    }
    
    /**
     * 获取指定分数范围的用户
     * 
     * @param minScore 最小分数
     * @param maxScore 最大分数
     * @return 用户ID列表
     */
    fun getUsersByScoreRange(minScore: Double, maxScore: Double): Set<Any> {
        return redisTemplate.opsForZSet()
            .rangeByScore(RANK_KEY, minScore, maxScore)
            ?: emptySet()
    }
}
```

### 9.5.4 Session 共享

**场景**：分布式系统中，多个服务器共享用户登录状态。

**配置使用 Redis 存储 Session：**

```xml
<!-- Spring Session Redis 依赖 -->
<dependency>
    <groupId>org.springframework.session</groupId>
    <artifactId>spring-session-data-redis</artifactId>
</dependency>
```

**application.yml**:
```yaml
spring:
  session:
    store-type: redis  # 使用 Redis 存储 Session
    timeout: 30m  # Session 过期时间
    redis:
      namespace: spring:session  # Session 键前缀
```

**启用 Session：**

```kotlin
@SpringBootApplication
@EnableRedisHttpSession  // 启用 Redis Session
class DemoApplication

fun main(args: Array<String>) {
    runApplication<DemoApplication>(*args)
}
```

**使用 Session：**

```kotlin
@RestController
@RequestMapping("/session")
class SessionController {
    
    /**
     * 设置 Session
     */
    @PostMapping("/set")
    fun setSession(
        @RequestParam key: String,
        @RequestParam value: String,
        session: HttpSession
    ): ApiResponse<Void> {
        session.setAttribute(key, value)
        return ApiResponse.success(message = "Session已设置")
    }
    
    /**
     * 获取 Session
     */
    @GetMapping("/get")
    fun getSession(
        @RequestParam key: String,
        session: HttpSession
    ): ApiResponse<String> {
        val value = session.getAttribute(key) as? String
        return if (value != null) {
            ApiResponse.success(value)
        } else {
            ApiResponse.notFound("Session不存在")
        }
    }
}
```

### 9.5.5 分布式锁

**场景**：防止并发问题，如库存扣减、订单生成等。

```kotlin
@Service
class RedisLockService(
    private val redisTemplate: RedisTemplate<String, Any>
) {
    
    /**
     * 获取锁
     * 
     * @param key 锁的键
     * @param value 锁的值（通常是唯一标识，如UUID）
     * @param timeout 锁的过期时间（秒）
     * @return 是否获取成功
     */
    fun tryLock(key: String, value: String, timeout: Long): Boolean {
        // setIfAbsent: 如果不存在则设置（SET key value NX EX timeout）
        return redisTemplate.opsForValue()
            .setIfAbsent(key, value, timeout, TimeUnit.SECONDS) ?: false
    }
    
    /**
     * 释放锁
     * 
     * 使用 Lua 脚本保证原子性：
     * 只有锁的持有者才能释放锁
     * 
     * @param key 锁的键
     * @param value 锁的值
     * @return 是否释放成功
     */
    fun unlock(key: String, value: String): Boolean {
        val script = """
            if redis.call('get', KEYS[1]) == ARGV[1] then
                return redis.call('del', KEYS[1])
            else
                return 0
            end
        """.trimIndent()
        
        val result = redisTemplate.execute(
            org.springframework.data.redis.core.script.DefaultRedisScript(
                script,
                Long::class.java
            ),
            listOf(key),
            value
        )
        
        return result == 1L
    }
}

/**
 * 使用分布式锁的示例
 */
@Service
class OrderService(
    private val redisLockService: RedisLockService
) {
    
    /**
     * 扣减库存（使用分布式锁）
     * 
     * @param productId 商品ID
     * @param quantity 数量
     * @return 是否成功
     */
    fun reduceStock(productId: Long, quantity: Int): Boolean {
        val lockKey = "lock:stock:$productId"
        val lockValue = UUID.randomUUID().toString()
        
        try {
            // 尝试获取锁（最多等待3秒）
            if (!redisLockService.tryLock(lockKey, lockValue, 10)) {
                println("获取锁失败")
                return false
            }
            
            // 执行业务逻辑
            println("获取锁成功，开始扣减库存")
            // ... 查询库存、扣减库存、更新数据库等操作
            Thread.sleep(1000)  // 模拟业务处理
            println("库存扣减完成")
            
            return true
        } finally {
            // 释放锁
            redisLockService.unlock(lockKey, lockValue)
            println("释放锁")
        }
    }
}
```

## 9.6 缓存常见问题与解决方案

### 9.6.1 缓存穿透

**问题**：查询一个不存在的数据，缓存和数据库都没有，导致每次都查询数据库。

**解决方案1：缓存空值**

```kotlin
@Cacheable(
    value = ["user"],
    key = "#id"
    // 不使用 unless，允许缓存 null
)
fun getUserById(id: Long): User? {
    return userMapper.findById(id)  // 即使返回 null 也会缓存
}
```

**解决方案2：布隆过滤器**

提前将所有可能存在的数据加载到布隆过滤器，查询时先判断是否可能存在。

### 9.6.2 缓存击穿

**问题**：热点数据过期瞬间，大量请求同时查询数据库。

**解决方案：分布式锁**

```kotlin
fun getUserById(id: Long): User? {
    val cacheKey = "user:$id"
    
    // 先查缓存
    val cached = redisService.get<User>(cacheKey)
    if (cached != null) {
        return cached
    }
    
    // 缓存不存在，使用分布式锁
    val lockKey = "lock:user:$id"
    val lockValue = UUID.randomUUID().toString()
    
    try {
        if (redisLockService.tryLock(lockKey, lockValue, 10)) {
            // 获取锁成功，再次检查缓存（双重检查）
            val cached2 = redisService.get<User>(cacheKey)
            if (cached2 != null) {
                return cached2
            }
            
            // 查询数据库
            val user = userMapper.findById(id)
            if (user != null) {
                // 写入缓存
                redisService.set(cacheKey, user, 3600)
            }
            return user
        } else {
            // 获取锁失败，等待并重试
            Thread.sleep(100)
            return getUserById(id)
        }
    } finally {
        redisLockService.unlock(lockKey, lockValue)
    }
}
```

### 9.6.3 缓存雪崩

**问题**：大量缓存同时过期，导致数据库压力激增。

**解决方案：随机过期时间**

```kotlin
fun set(key: String, value: Any, baseTimeout: Long) {
    // 在基础过期时间上增加随机值（0-300秒）
    val randomTimeout = baseTimeout + Random.nextLong(300)
    redisTemplate.opsForValue().set(key, value, randomTimeout, TimeUnit.SECONDS)
}
```

### 9.6.4 缓存一致性

**问题**：缓存和数据库数据不一致。

**解决方案：先更新数据库，再删除缓存**

```kotlin
@CacheEvict(value = ["user"], key = "#user.id")
@Transactional
fun updateUser(user: User): User {
    // 1. 先更新数据库
    userMapper.update(user)
    
    // 2. 删除缓存（由 @CacheEvict 自动完成）
    // 下次查询时会重新加载最新数据
    
    return userMapper.findById(user.id)!!
}
```

## 9.7 本章小结

本章详细介绍了 Redis 缓存系统的集成与使用：

✅ **Redis 基础**：概念、特点、数据类型、应用场景
✅ **Spring Boot 集成**：添加依赖、配置 Redis、配置 RedisTemplate
✅ **RedisTemplate 操作**：String、Hash、List、Set、Sorted Set 操作
✅ **Spring Cache 注解**：@Cacheable、@CachePut、@CacheEvict、@Caching
✅ **实战场景**：接口缓存、计数器、排行榜、Session 共享、分布式锁
✅ **常见问题**：缓存穿透、缓存击穿、缓存雪崩、缓存一致性

**关键要点：**

- Redis 是高性能的内存数据库，适合做缓存
- 使用 JSON 序列化提高可读性和通用性
- 合理设置缓存过期时间，避免内存溢出
- 使用 Spring Cache 注解简化缓存操作
- 注意缓存一致性问题，先更新数据库再删除缓存
- 使用分布式锁解决并发问题

**最佳实践：**

1. 热点数据使用缓存，冷数据直接查数据库
2. 缓存过期时间加随机值，避免雪崩
3. 缓存空值或使用布隆过滤器，防止穿透
4. 使用分布式锁保护热点数据，防止击穿
5. 定期清理无用缓存，释放内存

**下一章预告：**
在下一章中，我们将学习项目通用功能模块，包括统一异常处理、全局返回包装、日志系统、接口文档等企业项目常见功能。

---

# 第10章：项目通用功能模块（企业项目常见）

企业级项目需要一些通用的基础功能模块来提高代码质量、开发效率和用户体验。本章将介绍这些常见的通用功能模块。

## 10.1 统一异常处理

### 10.1.1 为什么需要统一异常处理？

**没有统一异常处理的问题：**
- 每个接口都要写 try-catch，代码冗余
- 异常信息不统一，前端难以处理
- 敏感的系统错误信息可能暴露给用户
- 无法统一记录异常日志

**统一异常处理的好处：**
- ✅ 集中处理异常，代码简洁
- ✅ 统一返回格式，前后端对接方便
- ✅ 隐藏敏感信息，增强安全性
- ✅ 统一日志记录，便于排查问题

### 10.1.2 自定义业务异常

首先定义常用的业务异常类：

```kotlin
package com.example.demo.exception

import org.springframework.http.HttpStatus

/**
 * 业务异常基类
 * 
 * @property message 异常信息
 * @property code 错误码（默认400）
 * @property httpStatus HTTP状态码（默认400 Bad Request）
 */
open class BusinessException(
    override val message: String,
    val code: Int = 400,
    val httpStatus: HttpStatus = HttpStatus.BAD_REQUEST
) : RuntimeException(message)

/**
 * 资源未找到异常（404）
 */
class NotFoundException(
    message: String = "资源不存在"
) : BusinessException(
    message = message,
    code = 404,
    httpStatus = HttpStatus.NOT_FOUND
)

/**
 * 参数验证异常（400）
 */
class ValidationException(
    message: String = "参数验证失败"
) : BusinessException(
    message = message,
    code = 400,
    httpStatus = HttpStatus.BAD_REQUEST
)

/**
 * 未授权异常（401）
 */
class UnauthorizedException(
    message: String = "未登录或登录已过期"
) : BusinessException(
    message = message,
    code = 401,
    httpStatus = HttpStatus.UNAUTHORIZED
)

/**
 * 无权限异常（403）
 */
class ForbiddenException(
    message: String = "无权限访问"
) : BusinessException(
    message = message,
    code = 403,
    httpStatus = HttpStatus.FORBIDDEN
)

/**
 * 资源冲突异常（409）
 * 
 * 常用场景：用户名已存在、邮箱已注册等
 */
class ConflictException(
    message: String = "资源冲突"
) : BusinessException(
    message = message,
    code = 409,
    httpStatus = HttpStatus.CONFLICT
)

/**
 * 服务器内部错误（500）
 */
class InternalServerException(
    message: String = "服务器内部错误"
) : BusinessException(
    message = message,
    code = 500,
    httpStatus = HttpStatus.INTERNAL_SERVER_ERROR
)
```

### 10.1.3 全局异常处理器

使用 `@RestControllerAdvice` 创建全局异常处理器：

```kotlin
package com.example.demo.exception

import com.example.demo.dto.ApiResponse
import org.slf4j.LoggerFactory
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.validation.BindException
import org.springframework.web.bind.MethodArgumentNotValidException
import org.springframework.web.bind.annotation.ExceptionHandler
import org.springframework.web.bind.annotation.RestControllerAdvice
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException
import jakarta.validation.ConstraintViolationException

/**
 * 全局异常处理器
 * 
 * @RestControllerAdvice 注解说明：
 * - 作用：拦截所有 @RestController 的异常
 * - 相当于 @ControllerAdvice + @ResponseBody
 * - 可以指定拦截的包或类：@RestControllerAdvice(basePackages = ["com.example.demo"])
 */
@RestControllerAdvice
class GlobalExceptionHandler {
    
    private val logger = LoggerFactory.getLogger(javaClass)
    
    /**
     * 处理业务异常
     * 
     * @ExceptionHandler 注解说明：
     * - 作用：指定处理的异常类型
     * - value：要处理的异常类（可以是多个）
     */
    @ExceptionHandler(BusinessException::class)
    fun handleBusinessException(e: BusinessException): ResponseEntity<ApiResponse<Nothing>> {
        logger.warn("业务异常: ${e.message}", e)
        return ResponseEntity
            .status(e.httpStatus)
            .body(ApiResponse.error(e.code, e.message))
    }
    
    /**
     * 处理资源未找到异常（404）
     */
    @ExceptionHandler(NotFoundException::class)
    fun handleNotFoundException(e: NotFoundException): ResponseEntity<ApiResponse<Nothing>> {
        logger.warn("资源未找到: ${e.message}")
        return ResponseEntity
            .status(HttpStatus.NOT_FOUND)
            .body(ApiResponse.notFound(e.message))
    }
    
    /**
     * 处理未授权异常（401）
     */
    @ExceptionHandler(UnauthorizedException::class)
    fun handleUnauthorizedException(e: UnauthorizedException): ResponseEntity<ApiResponse<Nothing>> {
        logger.warn("未授权访问: ${e.message}")
        return ResponseEntity
            .status(HttpStatus.UNAUTHORIZED)
            .body(ApiResponse.unauthorized(e.message))
    }
    
    /**
     * 处理无权限异常（403）
     */
    @ExceptionHandler(ForbiddenException::class)
    fun handleForbiddenException(e: ForbiddenException): ResponseEntity<ApiResponse<Nothing>> {
        logger.warn("无权限访问: ${e.message}")
        return ResponseEntity
            .status(HttpStatus.FORBIDDEN)
            .body(ApiResponse.forbidden(e.message))
    }
    
    /**
     * 处理参数验证异常（@Valid 验证失败）
     * 
     * MethodArgumentNotValidException：
     * - 由 @RequestBody + @Valid 触发
     * - 包含所有验证失败的字段信息
     */
    @ExceptionHandler(MethodArgumentNotValidException::class)
    fun handleMethodArgumentNotValidException(
        e: MethodArgumentNotValidException
    ): ResponseEntity<ApiResponse<Nothing>> {
        // 提取所有验证失败的字段及错误信息
        val errors = e.bindingResult.fieldErrors.map { fieldError ->
            "${fieldError.field}: ${fieldError.defaultMessage}"
        }
        
        val message = errors.joinToString("; ")
        logger.warn("参数验证失败: $message")
        
        return ResponseEntity
            .status(HttpStatus.BAD_REQUEST)
            .body(ApiResponse.badRequest(message))
    }
    
    /**
     * 处理参数绑定异常
     * 
     * BindException：
     * - 由 @ModelAttribute 绑定失败触发
     */
    @ExceptionHandler(BindException::class)
    fun handleBindException(e: BindException): ResponseEntity<ApiResponse<Nothing>> {
        val errors = e.bindingResult.fieldErrors.map { fieldError ->
            "${fieldError.field}: ${fieldError.defaultMessage}"
        }
        
        val message = errors.joinToString("; ")
        logger.warn("参数绑定失败: $message")
        
        return ResponseEntity
            .status(HttpStatus.BAD_REQUEST)
            .body(ApiResponse.badRequest(message))
    }
    
    /**
     * 处理约束违反异常（@Validated 验证失败）
     * 
     * ConstraintViolationException：
     * - 由方法级别的 @Validated 验证触发
     * - 如：@PathVariable、@RequestParam 上的验证注解
     */
    @ExceptionHandler(ConstraintViolationException::class)
    fun handleConstraintViolationException(
        e: ConstraintViolationException
    ): ResponseEntity<ApiResponse<Nothing>> {
        val errors = e.constraintViolations.map { violation ->
            "${violation.propertyPath}: ${violation.message}"
        }
        
        val message = errors.joinToString("; ")
        logger.warn("约束验证失败: $message")
        
        return ResponseEntity
            .status(HttpStatus.BAD_REQUEST)
            .body(ApiResponse.badRequest(message))
    }
    
    /**
     * 处理参数类型不匹配异常
     * 
     * 例如：接口需要 Long 类型，传入了字符串 "abc"
     */
    @ExceptionHandler(MethodArgumentTypeMismatchException::class)
    fun handleMethodArgumentTypeMismatchException(
        e: MethodArgumentTypeMismatchException
    ): ResponseEntity<ApiResponse<Nothing>> {
        val message = "参数类型错误: ${e.name} 应为 ${e.requiredType?.simpleName} 类型"
        logger.warn(message)
        
        return ResponseEntity
            .status(HttpStatus.BAD_REQUEST)
            .body(ApiResponse.badRequest(message))
    }
    
    /**
     * 处理空指针异常
     * 
     * 通常是代码bug，应该修复而不是让用户看到
     */
    @ExceptionHandler(NullPointerException::class)
    fun handleNullPointerException(e: NullPointerException): ResponseEntity<ApiResponse<Nothing>> {
        logger.error("空指针异常", e)
        
        return ResponseEntity
            .status(HttpStatus.INTERNAL_SERVER_ERROR)
            .body(ApiResponse.error(500, "服务器内部错误"))
    }
    
    /**
     * 处理所有未捕获的异常（兜底）
     * 
     * 注意：这个方法应该放在最后，作为兜底处理
     */
    @ExceptionHandler(Exception::class)
    fun handleException(e: Exception): ResponseEntity<ApiResponse<Nothing>> {
        logger.error("未捕获的异常", e)
        
        return ResponseEntity
            .status(HttpStatus.INTERNAL_SERVER_ERROR)
            .body(ApiResponse.error(500, "服务器内部错误"))
    }
}
```

### 10.1.4 使用示例

```kotlin
package com.example.demo.service

import com.example.demo.entity.User
import com.example.demo.exception.ConflictException
import com.example.demo.exception.NotFoundException
import com.example.demo.mapper.UserMapper
import org.springframework.stereotype.Service

@Service
class UserService(
    private val userMapper: UserMapper
) {
    
    /**
     * 获取用户
     * 
     * 不存在时抛出 NotFoundException
     */
    fun getUserById(id: Long): User {
        return userMapper.findById(id)
            ?: throw NotFoundException("用户不存在: $id")
    }
    
    /**
     * 创建用户
     * 
     * 用户名已存在时抛出 ConflictException
     */
    fun createUser(user: User): User {
        // 检查用户名是否已存在
        if (userMapper.existsByUsername(user.username)) {
            throw ConflictException("用户名已存在: ${user.username}")
        }
        
        // 检查邮箱是否已存在
        if (userMapper.existsByEmail(user.email)) {
            throw ConflictException("邮箱已被注册: ${user.email}")
        }
        
        userMapper.insert(user)
        return user
    }
}
```

**Controller 中无需 try-catch：**

```kotlin
@RestController
@RequestMapping("/users")
class UserController(
    private val userService: UserService
) {
    
    /**
     * 获取用户
     * 
     * 不存在时，GlobalExceptionHandler 会自动捕获 NotFoundException
     * 并返回 404 状态码和统一的错误响应
     */
    @GetMapping("/{id}")
    fun getUser(@PathVariable id: Long): ApiResponse<User> {
        val user = userService.getUserById(id)  // 可能抛出异常
        return ApiResponse.success(user)
    }
    
    /**
     * 创建用户
     * 
     * 用户名冲突时，自动返回 409 状态码
     */
    @PostMapping
    fun createUser(@RequestBody @Valid user: User): ApiResponse<User> {
        val created = userService.createUser(user)  // 可能抛出异常
        return ApiResponse.success(created)
    }
}
```

## 10.2 日志系统配置（Logback）

### 10.2.1 日志级别

日志级别从低到高：
- **TRACE**：最详细的日志，通常只在开发时使用
- **DEBUG**：调试信息，开发环境使用
- **INFO**：一般信息，如业务流程日志
- **WARN**：警告信息，不影响运行但需要注意
- **ERROR**：错误信息，需要立即处理

### 10.2.2 配置 Logback

创建 `src/main/resources/logback-spring.xml`：

```xml
<?xml version="1.0" encoding="UTF-8"?>
<configuration>
    <!-- 
        日志配置说明：
        - %d{yyyy-MM-dd HH:mm:ss.SSS}: 日期时间
        - [%thread]: 线程名
        - %-5level: 日志级别（左对齐，宽度5）
        - %logger{50}: Logger名称（最大50字符）
        - %msg: 日志消息
        - %n: 换行符
        - %X{requestId}: MDC中的requestId（用于追踪请求）
    -->
    
    <!-- 日志输出格式 -->
    <property name="LOG_PATTERN" 
              value="%d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %-5level %logger{50} - %msg%n"/>
    
    <!-- 彩色日志格式（控制台） -->
    <property name="CONSOLE_LOG_PATTERN" 
              value="%d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %highlight(%-5level) %cyan(%logger{50}) - %msg%n"/>
    
    <!-- 日志文件路径 -->
    <property name="LOG_FILE" value="logs/application"/>
    
    <!-- 控制台输出 -->
    <appender name="CONSOLE" class="ch.qos.logback.core.ConsoleAppender">
        <encoder>
            <pattern>${CONSOLE_LOG_PATTERN}</pattern>
            <charset>UTF-8</charset>
        </encoder>
    </appender>
    
    <!-- 文件输出：所有日志 -->
    <appender name="FILE" class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>${LOG_FILE}.log</file>
        <!-- 滚动策略：按时间和大小 -->
        <rollingPolicy class="ch.qos.logback.core.rolling.SizeAndTimeBasedRollingPolicy">
            <!-- 日志文件名格式 -->
            <fileNamePattern>${LOG_FILE}.%d{yyyy-MM-dd}.%i.log</fileNamePattern>
            <!-- 单个文件最大大小 -->
            <maxFileSize>100MB</maxFileSize>
            <!-- 保留天数 -->
            <maxHistory>30</maxHistory>
            <!-- 总大小限制 -->
            <totalSizeCap>10GB</totalSizeCap>
        </rollingPolicy>
        <encoder>
            <pattern>${LOG_PATTERN}</pattern>
            <charset>UTF-8</charset>
        </encoder>
    </appender>
    
    <!-- 文件输出：错误日志 -->
    <appender name="ERROR_FILE" class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>${LOG_FILE}-error.log</file>
        <rollingPolicy class="ch.qos.logback.core.rolling.SizeAndTimeBasedRollingPolicy">
            <fileNamePattern>${LOG_FILE}-error.%d{yyyy-MM-dd}.%i.log</fileNamePattern>
            <maxFileSize>100MB</maxFileSize>
            <maxHistory>60</maxHistory>
            <totalSizeCap>10GB</totalSizeCap>
        </rollingPolicy>
        <encoder>
            <pattern>${LOG_PATTERN}</pattern>
            <charset>UTF-8</charset>
        </encoder>
        <!-- 只记录 ERROR 级别日志 -->
        <filter class="ch.qos.logback.classic.filter.LevelFilter">
            <level>ERROR</level>
            <onMatch>ACCEPT</onMatch>
            <onMismatch>DENY</onMismatch>
        </filter>
    </appender>
    
    <!-- 异步日志（提高性能） -->
    <appender name="ASYNC_FILE" class="ch.qos.logback.classic.AsyncAppender">
        <!-- 队列大小 -->
        <queueSize>512</queueSize>
        <!-- 丢弃阈值（队列剩余容量小于此值时丢弃低级别日志） -->
        <discardingThreshold>0</discardingThreshold>
        <!-- 引用的 appender -->
        <appender-ref ref="FILE"/>
    </appender>
    
    <!-- 异步错误日志 -->
    <appender name="ASYNC_ERROR_FILE" class="ch.qos.logback.classic.AsyncAppender">
        <queueSize>512</queueSize>
        <discardingThreshold>0</discardingThreshold>
        <appender-ref ref="ERROR_FILE"/>
    </appender>
    
    <!-- 开发环境配置 -->
    <springProfile name="dev">
        <root level="INFO">
            <appender-ref ref="CONSOLE"/>
            <appender-ref ref="FILE"/>
        </root>
        <!-- 项目包日志级别：DEBUG -->
        <logger name="com.example.demo" level="DEBUG"/>
        <!-- MyBatis SQL 日志 -->
        <logger name="com.example.demo.mapper" level="DEBUG"/>
    </springProfile>
    
    <!-- 生产环境配置 -->
    <springProfile name="prod">
        <root level="WARN">
            <appender-ref ref="ASYNC_FILE"/>
            <appender-ref ref="ASYNC_ERROR_FILE"/>
        </root>
        <!-- 项目包日志级别：INFO -->
        <logger name="com.example.demo" level="INFO"/>
    </springProfile>
    
    <!-- 其他环境（默认） -->
    <springProfile name="!dev &amp; !prod">
        <root level="INFO">
            <appender-ref ref="CONSOLE"/>
            <appender-ref ref="FILE"/>
            <appender-ref ref="ERROR_FILE"/>
        </root>
        <logger name="com.example.demo" level="INFO"/>
    </springProfile>
</configuration>
```

### 10.2.3 使用日志

```kotlin
package com.example.demo.service

import org.slf4j.LoggerFactory
import org.springframework.stereotype.Service

@Service
class UserService {
    
    // 创建 Logger 实例
    private val logger = LoggerFactory.getLogger(javaClass)
    
    fun createUser(user: User): User {
        // INFO 日志：记录业务流程
        logger.info("开始创建用户: username=${user.username}")
        
        try {
            // 业务逻辑
            userMapper.insert(user)
            
            // 成功日志
            logger.info("用户创建成功: id=${user.id}, username=${user.username}")
            
            return user
        } catch (e: Exception) {
            // ERROR 日志：记录异常
            logger.error("用户创建失败: username=${user.username}", e)
            throw e
        }
    }
    
    fun debugExample() {
        // DEBUG 日志：调试信息（生产环境不输出）
        logger.debug("调试信息：当前用户数量=${userMapper.count()}")
        
        // WARN 日志：警告信息
        logger.warn("警告：用户名长度超过建议值")
        
        // TRACE 日志：最详细的日志（通常不使用）
        logger.trace("TRACE 日志：进入方法")
    }
}
```

### 10.2.4 请求追踪（MDC）

使用 MDC（Mapped Diagnostic Context）为每个请求生成唯一ID：

```kotlin
package com.example.demo.interceptor

import org.slf4j.MDC
import org.springframework.stereotype.Component
import org.springframework.web.servlet.HandlerInterceptor
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse
import java.util.UUID

/**
 * 日志追踪拦截器
 * 
 * 为每个请求生成唯一的 requestId，便于日志追踪
 */
@Component
class LogTraceInterceptor : HandlerInterceptor {
    
    companion object {
        private const val REQUEST_ID = "requestId"
    }
    
    /**
     * 请求前：生成 requestId
     */
    override fun preHandle(
        request: HttpServletRequest,
        response: HttpServletResponse,
        handler: Any
    ): Boolean {
        // 生成唯一ID
        val requestId = UUID.randomUUID().toString()
        
        // 存入 MDC（线程上下文）
        MDC.put(REQUEST_ID, requestId)
        
        // 也可以放入响应头，返回给前端
        response.setHeader("X-Request-ID", requestId)
        
        return true
    }
    
    /**
     * 请求后：清除 requestId
     */
    override fun afterCompletion(
        request: HttpServletRequest,
        response: HttpServletResponse,
        handler: Any,
        ex: Exception?
    ) {
        // 清除 MDC（避免内存泄漏）
        MDC.remove(REQUEST_ID)
    }
}
```

**注册拦截器：**

```kotlin
package com.example.demo.config

import com.example.demo.interceptor.LogTraceInterceptor
import org.springframework.context.annotation.Configuration
import org.springframework.web.servlet.config.annotation.InterceptorRegistry
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer

@Configuration
class WebMvcConfig(
    private val logTraceInterceptor: LogTraceInterceptor
) : WebMvcConfigurer {
    
    override fun addInterceptors(registry: InterceptorRegistry) {
        registry.addInterceptor(logTraceInterceptor)
            .addPathPatterns("/**")  // 拦截所有请求
    }
}
```

**日志格式中使用 requestId：**

修改 `logback-spring.xml` 的日志格式：

```xml
<property name="LOG_PATTERN" 
          value="%d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] [%X{requestId}] %-5level %logger{50} - %msg%n"/>
```

**输出示例：**

```
2025-10-11 14:30:25.123 [http-nio-8080-exec-1] [a1b2c3d4-e5f6-7890-abcd-ef1234567890] INFO  c.e.d.controller.UserController - 查询用户: id=1
2025-10-11 14:30:25.145 [http-nio-8080-exec-1] [a1b2c3d4-e5f6-7890-abcd-ef1234567890] DEBUG c.e.d.mapper.UserMapper - SQL: SELECT * FROM users WHERE id = 1
2025-10-11 14:30:25.189 [http-nio-8080-exec-1] [a1b2c3d4-e5f6-7890-abcd-ef1234567890] INFO  c.e.d.controller.UserController - 查询成功
```

所有日志都带有相同的 `requestId`，便于追踪一个请求的完整生命周期。

## 10.3 接口文档自动生成（Knife4j）

### 10.3.1 为什么使用 Knife4j？

**Knife4j** 是 Swagger 的增强版，提供了更好的UI和功能：
- ✅ 美观的界面，支持中文
- ✅ 接口测试更方便
- ✅ 支持接口分组
- ✅ 支持导出离线文档

### 10.3.2 添加依赖

```xml
<!-- Knife4j（Swagger 增强版） -->
<dependency>
    <groupId>com.github.xiaoymin</groupId>
    <artifactId>knife4j-openapi3-jakarta-spring-boot-starter</artifactId>
    <version>4.3.0</version>
</dependency>
```

### 10.3.3 配置 Knife4j

```kotlin
package com.example.demo.config

import io.swagger.v3.oas.models.OpenAPI
import io.swagger.v3.oas.models.info.Contact
import io.swagger.v3.oas.models.info.Info
import io.swagger.v3.oas.models.info.License
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration

/**
 * Knife4j 配置类
 * 
 * 访问地址：http://localhost:8080/doc.html
 */
@Configuration
class Knife4jConfig {
    
    @Bean
    fun openAPI(): OpenAPI {
        return OpenAPI()
            .info(
                Info()
                    .title("Spring Boot Kotlin 项目接口文档")  // 标题
                    .description("基于 Knife4j 的接口文档")  // 描述
                    .version("v1.0.0")  // 版本
                    .contact(
                        Contact()
                            .name("张三")  // 联系人
                            .email("zhangsan@example.com")  // 邮箱
                            .url("https://example.com")  // 网站
                    )
                    .license(
                        License()
                            .name("Apache 2.0")  // 许可证
                            .url("https://www.apache.org/licenses/LICENSE-2.0")
                    )
            )
    }
}
```

**application.yml 配置：**

```yaml
# Knife4j 配置
springdoc:
  api-docs:
    enabled: true  # 开启 API 文档
    path: /v3/api-docs  # API 文档路径
  swagger-ui:
    enabled: true  # 开启 Swagger UI
    path: /swagger-ui.html  # Swagger UI 路径
  group-configs:
    - group: '用户模块'
      paths-to-match: '/users/**'
    - group: '商品模块'
      paths-to-match: '/products/**'

knife4j:
  enable: true  # 开启 Knife4j
  setting:
    language: zh_CN  # 中文界面
```

### 10.3.4 接口文档注解

```kotlin
package com.example.demo.controller

import com.example.demo.dto.ApiResponse
import com.example.demo.dto.CreateUserRequest
import com.example.demo.entity.User
import com.example.demo.service.UserService
import io.swagger.v3.oas.annotations.Operation
import io.swagger.v3.oas.annotations.Parameter
import io.swagger.v3.oas.annotations.tags.Tag
import io.swagger.v3.oas.annotations.responses.ApiResponse as SwaggerApiResponse
import io.swagger.v3.oas.annotations.responses.ApiResponses
import io.swagger.v3.oas.annotations.media.Content
import io.swagger.v3.oas.annotations.media.Schema
import org.springframework.web.bind.annotation.*
import jakarta.validation.Valid

/**
 * 用户管理接口
 * 
 * @Tag：标记Controller，会在文档中作为一个模块
 * - name：模块名称
 * - description：模块描述
 */
@Tag(name = "用户管理", description = "用户的增删改查接口")
@RestController
@RequestMapping("/users")
class UserController(
    private val userService: UserService
) {
    
    /**
     * 查询用户列表
     * 
     * @Operation：描述接口
     * - summary：简要描述
     * - description：详细描述
     */
    @Operation(
        summary = "查询用户列表",
        description = "查询所有用户，支持分页"
    )
    @GetMapping
    fun getUsers(
        /**
         * @Parameter：描述参数
         * - name：参数名
         * - description：参数描述
         * - required：是否必填
         * - example：示例值
         */
        @Parameter(description = "页码", example = "1")
        @RequestParam(defaultValue = "1") page: Int,
        
        @Parameter(description = "每页大小", example = "10")
        @RequestParam(defaultValue = "10") size: Int
    ): ApiResponse<List<User>> {
        val users = userService.getUsers(page, size)
        return ApiResponse.success(users)
    }
    
    /**
     * 根据ID查询用户
     * 
     * @ApiResponses：描述多个响应
     */
    @Operation(summary = "查询用户详情", description = "根据用户ID查询用户详细信息")
    @ApiResponses(
        value = [
            SwaggerApiResponse(
                responseCode = "200",
                description = "查询成功",
                content = [Content(schema = Schema(implementation = User::class))]
            ),
            SwaggerApiResponse(
                responseCode = "404",
                description = "用户不存在"
            )
        ]
    )
    @GetMapping("/{id}")
    fun getUser(
        @Parameter(description = "用户ID", required = true, example = "1")
        @PathVariable id: Long
    ): ApiResponse<User> {
        val user = userService.getUserById(id)
        return ApiResponse.success(user)
    }
    
    /**
     * 创建用户
     */
    @Operation(summary = "创建用户", description = "创建新用户")
    @PostMapping
    fun createUser(
        @Parameter(description = "用户信息", required = true)
        @RequestBody @Valid request: CreateUserRequest
    ): ApiResponse<User> {
        val user = userService.createUser(request)
        return ApiResponse.success(user)
    }
    
    /**
     * 更新用户
     */
    @Operation(summary = "更新用户", description = "更新用户信息")
    @PutMapping("/{id}")
    fun updateUser(
        @Parameter(description = "用户ID", required = true)
        @PathVariable id: Long,
        
        @Parameter(description = "用户信息", required = true)
        @RequestBody @Valid user: User
    ): ApiResponse<User> {
        user.id = id
        val updated = userService.updateUser(user)
        return ApiResponse.success(updated)
    }
    
    /**
     * 删除用户
     */
    @Operation(summary = "删除用户", description = "根据ID删除用户")
    @DeleteMapping("/{id}")
    fun deleteUser(
        @Parameter(description = "用户ID", required = true)
        @PathVariable id: Long
    ): ApiResponse<Void> {
        userService.deleteUser(id)
        return ApiResponse.success(message = "删除成功")
    }
}
```

**实体类注解：**

```kotlin
package com.example.demo.entity

import io.swagger.v3.oas.annotations.media.Schema

/**
 * 用户实体
 * 
 * @Schema：描述实体类和字段
 */
@Schema(description = "用户实体")
data class User(
    @Schema(description = "用户ID", example = "1")
    var id: Long? = null,
    
    @Schema(description = "用户名", example = "zhangsan", required = true)
    var username: String,
    
    @Schema(description = "邮箱", example = "zhangsan@example.com")
    var email: String?,
    
    @Schema(description = "手机号", example = "13800138000")
    var phone: String?,
    
    @Schema(description = "状态：1-正常，0-禁用", example = "1")
    var status: Int = 1,
    
    @Schema(description = "创建时间")
    var createdAt: LocalDateTime? = null,
    
    @Schema(description = "更新时间")
    var updatedAt: LocalDateTime? = null
)
```

### 10.3.5 访问接口文档

启动应用后，访问：
- **Knife4j 文档**：http://localhost:8080/doc.html
- **Swagger UI**：http://localhost:8080/swagger-ui.html
- **OpenAPI JSON**：http://localhost:8080/v3/api-docs

**Knife4j 界面功能：**
- 📖 查看所有接口
- 🧪 在线测试接口
- 📥 导出离线文档
- 🔍 搜索接口
- 📋 查看请求/响应示例

## 10.4 数据库版本控制（Flyway）

### 10.4.1 为什么需要数据库版本控制？

**问题场景：**
- 多人协作时，数据库结构不一致
- 部署到生产环境，忘记执行SQL脚本
- 无法追溯数据库结构的变更历史

**Flyway 解决方案：**
- ✅ 自动管理数据库版本
- ✅ 记录所有SQL变更历史
- ✅ 确保各环境数据库结构一致
- ✅ 支持回滚（通过编写回滚脚本）

### 10.4.2 添加依赖

```xml
<!-- Flyway 数据库版本控制 -->
<dependency>
    <groupId>org.flywaydb</groupId>
    <artifactId>flyway-core</artifactId>
</dependency>

<!-- Flyway MySQL 驱动 -->
<dependency>
    <groupId>org.flywaydb</groupId>
    <artifactId>flyway-mysql</artifactId>
</dependency>
```

### 10.4.3 配置 Flyway

**application.yml:**

```yaml
spring:
  flyway:
    enabled: true  # 启用 Flyway
    baseline-on-migrate: true  # 首次运行时创建基线
    locations: classpath:db/migration  # SQL脚本位置
    encoding: UTF-8  # 脚本编码
    validate-on-migrate: true  # 迁移前验证
    out-of-order: false  # 是否允许乱序执行
```

### 10.4.4 编写迁移脚本

**脚本命名规则：**
```
V{版本号}__{描述}.sql

例如：
V1__init_tables.sql         // 版本1：初始化表
V2__add_user_phone.sql      // 版本2：添加用户手机号字段
V3__create_product_table.sql  // 版本3：创建商品表
```

**版本号格式：**
- `V1`、`V2`、`V3`：整数版本
- `V1.0`、`V1.1`、`V2.0`：小数版本
- `V1.0.0`、`V1.0.1`：三段式版本

**创建脚本目录：**

```
src/main/resources/
└── db/
    └── migration/
        ├── V1__init_tables.sql
        ├── V2__add_user_phone.sql
        └── V3__create_product_table.sql
```

**V1__init_tables.sql（初始化表）：**

```sql
-- 创建用户表
CREATE TABLE IF NOT EXISTS users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '用户ID',
    username VARCHAR(50) NOT NULL UNIQUE COMMENT '用户名',
    password VARCHAR(100) NOT NULL COMMENT '密码',
    email VARCHAR(100) COMMENT '邮箱',
    status TINYINT DEFAULT 1 COMMENT '状态：1-正常，0-禁用',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    INDEX idx_username (username),
    INDEX idx_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- 创建角色表
CREATE TABLE IF NOT EXISTS roles (
    id BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '角色ID',
    name VARCHAR(50) NOT NULL UNIQUE COMMENT '角色名称',
    description VARCHAR(200) COMMENT '角色描述',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- 创建用户角色关联表
CREATE TABLE IF NOT EXISTS user_roles (
    user_id BIGINT NOT NULL COMMENT '用户ID',
    role_id BIGINT NOT NULL COMMENT '角色ID',
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户角色关联表';

-- 插入默认角色
INSERT INTO roles (name, description) VALUES
('USER', '普通用户'),
('ADMIN', '管理员');
```

**V2__add_user_phone.sql（添加字段）：**

```sql
-- 添加手机号字段
ALTER TABLE users ADD COLUMN phone VARCHAR(20) COMMENT '手机号' AFTER email;

-- 添加索引
CREATE INDEX idx_phone ON users(phone);
```

**V3__create_product_table.sql（创建新表）：**

```sql
-- 创建商品表
CREATE TABLE IF NOT EXISTS products (
    id BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '商品ID',
    name VARCHAR(100) NOT NULL COMMENT '商品名称',
    price DECIMAL(10, 2) NOT NULL COMMENT '价格',
    stock INT DEFAULT 0 COMMENT '库存',
    description TEXT COMMENT '商品描述',
    status TINYINT DEFAULT 1 COMMENT '状态：1-上架，0-下架',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    INDEX idx_name (name),
    INDEX idx_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品表';
```

### 10.4.5 Flyway 工作流程

1. **首次启动**：
   - Flyway 创建 `flyway_schema_history` 表记录版本
   - 执行所有未执行的迁移脚本（V1、V2、V3...）

2. **后续启动**：
   - 检查 `flyway_schema_history` 表
   - 仅执行新增的脚本

3. **版本记录表结构：**

```sql
SELECT * FROM flyway_schema_history;

+----------------+---------+---------------------+----------+---------------------+-------------+---------+
| installed_rank | version | description         | type     | script              | checksum    | success |
+----------------+---------+---------------------+----------+---------------------+-------------+---------+
| 1              | 1       | init tables         | SQL      | V1__init_tables.sql | 1234567890  | 1       |
| 2              | 2       | add user phone      | SQL      | V2__add_user_phone.sql | 987654321 | 1       |
| 3              | 3       | create product table| SQL      | V3__create_product_table.sql | 123456 | 1  |
+----------------+---------+---------------------+----------+---------------------+-------------+---------+
```

### 10.4.6 注意事项

**✅ 最佳实践：**
1. **已执行的脚本不要修改**：Flyway 会通过 checksum 检测变更并报错
2. **使用描述性命名**：`V1__init_tables.sql` 比 `V1.sql` 更清晰
3. **测试脚本**：在开发环境测试通过后再提交
4. **版本递增**：新脚本版本号必须大于已有版本
5. **幂等性**：使用 `IF NOT EXISTS` 等语句确保重复执行不报错

**❌ 常见错误：**
1. 修改已执行的脚本 → Checksum 校验失败
2. 版本号冲突 → 多人同时创建相同版本号
3. SQL 语法错误 → 脚本执行失败，需要手动修复

**解决 Checksum 错误：**

```sql
-- 方案1：修复 checksum（不推荐）
UPDATE flyway_schema_history 
SET checksum = (新的checksum值) 
WHERE version = '1';

-- 方案2：清空历史重新执行（仅限开发环境）
DROP TABLE flyway_schema_history;
```

## 10.5 本章小结

本章介绍了企业项目中常见的通用功能模块：

✅ **统一异常处理**：使用 @RestControllerAdvice 集中处理异常
✅ **自定义异常**：BusinessException、NotFoundException 等
✅ **日志系统**：Logback 配置、日志级别、MDC 请求追踪
✅ **接口文档**：Knife4j 自动生成 API 文档
✅ **数据库版本控制**：Flyway 管理数据库迁移

**关键要点：**

- 统一异常处理让代码更简洁，前后端对接更规范
- 日志是排查问题的关键，要合理设置日志级别
- 接口文档自动生成，减少手工维护成本
- 数据库版本控制保证多环境结构一致

**最佳实践：**

1. 为不同的业务异常创建专门的异常类
2. 日志要包含关键信息（用户ID、请求ID等），便于追踪
3. 接口文档要写清楚参数、返回值、错误码
4. Flyway 脚本一旦执行就不要修改
5. 开发环境和生产环境使用不同的日志配置

**下一章预告：**
在下一章中，我们将学习登录与用户模块的实战开发，包括用户注册、密码加密、JWT Token 生成与验证、登录状态管理等内容。

---

# 第11章：登录与用户模块（实战）

本章将实现一个完整的用户登录认证系统，包括用户注册、密码加密、JWT Token 认证、登录状态管理等功能。

## 11.1 用户注册与密码加密

### 11.1.1 添加依赖

```xml
<!-- Spring Security（仅用于密码加密） -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-security</artifactId>
</dependency>

<!-- JWT Token -->
<dependency>
    <groupId>io.jsonwebtoken</groupId>
    <artifactId>jjwt-api</artifactId>
    <version>0.11.5</version>
</dependency>
<dependency>
    <groupId>io.jsonwebtoken</groupId>
    <artifactId>jjwt-impl</artifactId>
    <version>0.11.5</version>
    <scope>runtime</scope>
</dependency>
<dependency>
    <groupId>io.jsonwebtoken</groupId>
    <artifactId>jjwt-jackson</artifactId>
    <version>0.11.5</version>
    <scope>runtime</scope>
</dependency>
```

### 11.1.2 禁用 Spring Security 默认配置

由于我们只使用 Spring Security 的密码加密功能，需要禁用其默认的安全配置：

```kotlin
package com.example.demo.config

import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.security.config.annotation.web.builders.HttpSecurity
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.security.crypto.password.PasswordEncoder
import org.springframework.security.web.SecurityFilterChain

/**
 * 安全配置类
 * 
 * 这里仅使用 Spring Security 的密码加密功能
 * 认证授权使用自定义的 JWT 方案
 */
@Configuration
@EnableWebSecurity
class SecurityConfig {
    
    /**
     * 配置密码编码器
     * 
     * BCryptPasswordEncoder：
     * - 基于 BCrypt 强哈希算法
     * - 自动加盐，每次加密结果不同
     * - 不可逆，无法解密
     * - 强度高，推荐使用
     */
    @Bean
    fun passwordEncoder(): PasswordEncoder {
        return BCryptPasswordEncoder()
    }
    
    /**
     * 配置安全过滤链
     * 
     * 禁用 Spring Security 默认的认证授权
     */
    @Bean
    fun securityFilterChain(http: HttpSecurity): SecurityFilterChain {
        http
            .csrf { it.disable() }  // 禁用 CSRF（前后端分离项目通常禁用）
            .authorizeHttpRequests { 
                it.anyRequest().permitAll()  // 允许所有请求（我们用自定义的JWT验证）
            }
        
        return http.build()
    }
}
```

### 11.1.3 用户注册 DTO

```kotlin
package com.example.demo.dto

import io.swagger.v3.oas.annotations.media.Schema
import jakarta.validation.constraints.*

/**
 * 用户注册请求
 */
@Schema(description = "用户注册请求")
data class RegisterRequest(
    @Schema(description = "用户名", example = "zhangsan", required = true)
    @field:NotBlank(message = "用户名不能为空")
    @field:Size(min = 3, max = 20, message = "用户名长度为3-20个字符")
    @field:Pattern(regexp = "^[a-zA-Z0-9_]+$", message = "用户名只能包含字母、数字、下划线")
    val username: String,
    
    @Schema(description = "密码", example = "123456", required = true)
    @field:NotBlank(message = "密码不能为空")
    @field:Size(min = 6, max = 20, message = "密码长度为6-20个字符")
    val password: String,
    
    @Schema(description = "确认密码", example = "123456", required = true)
    @field:NotBlank(message = "确认密码不能为空")
    val confirmPassword: String,
    
    @Schema(description = "邮箱", example = "zhangsan@example.com")
    @field:Email(message = "邮箱格式不正确")
    val email: String?,
    
    @Schema(description = "手机号", example = "13800138000")
    @field:Pattern(regexp = "^1[3-9]\\d{9}$", message = "手机号格式不正确")
    val phone: String?
)

/**
 * 登录请求
 */
@Schema(description = "登录请求")
data class LoginRequest(
    @Schema(description = "用户名", example = "zhangsan", required = true)
    @field:NotBlank(message = "用户名不能为空")
    val username: String,
    
    @Schema(description = "密码", example = "123456", required = true)
    @field:NotBlank(message = "密码不能为空")
    val password: String
)

/**
 * 登录响应
 */
@Schema(description = "登录响应")
data class LoginResponse(
    @Schema(description = "访问令牌")
    val accessToken: String,
    
    @Schema(description = "令牌类型", example = "Bearer")
    val tokenType: String = "Bearer",
    
    @Schema(description = "过期时间（秒）", example = "7200")
    val expiresIn: Long,
    
    @Schema(description = "用户信息")
    val user: UserInfo
)

/**
 * 用户信息（不包含敏感信息）
 */
@Schema(description = "用户信息")
data class UserInfo(
    @Schema(description = "用户ID")
    val id: Long,
    
    @Schema(description = "用户名")
    val username: String,
    
    @Schema(description = "邮箱")
    val email: String?,
    
    @Schema(description = "手机号")
    val phone: String?,
    
    @Schema(description = "状态：1-正常，0-禁用")
    val status: Int,
    
    @Schema(description = "创建时间")
    val createdAt: java.time.LocalDateTime?
)
```

### 11.1.4 用户注册服务

```kotlin
package com.example.demo.service

import com.example.demo.dto.RegisterRequest
import com.example.demo.dto.UserInfo
import com.example.demo.entity.User
import com.example.demo.exception.ConflictException
import com.example.demo.exception.ValidationException
import com.example.demo.mapper.UserMapper
import org.springframework.security.crypto.password.PasswordEncoder
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional
import java.time.LocalDateTime

@Service
class AuthService(
    private val userMapper: UserMapper,
    private val passwordEncoder: PasswordEncoder
) {
    
    /**
     * 用户注册
     * 
     * @param request 注册请求
     * @return 用户信息
     */
    @Transactional
    fun register(request: RegisterRequest): UserInfo {
        // 1. 验证两次密码是否一致
        if (request.password != request.confirmPassword) {
            throw ValidationException("两次密码不一致")
        }
        
        // 2. 检查用户名是否已存在
        if (userMapper.existsByUsername(request.username)) {
            throw ConflictException("用户名已存在")
        }
        
        // 3. 检查邮箱是否已注册
        if (!request.email.isNullOrBlank() && userMapper.existsByEmail(request.email)) {
            throw ConflictException("邮箱已被注册")
        }
        
        // 4. 检查手机号是否已注册
        if (!request.phone.isNullOrBlank() && userMapper.existsByPhone(request.phone)) {
            throw ConflictException("手机号已被注册")
        }
        
        // 5. 创建用户
        val user = User(
            username = request.username,
            password = passwordEncoder.encode(request.password),  // 加密密码
            email = request.email,
            phone = request.phone,
            status = 1,
            createdAt = LocalDateTime.now(),
            updatedAt = LocalDateTime.now()
        )
        
        userMapper.insert(user)
        
        // 6. 返回用户信息（不包含密码）
        return UserInfo(
            id = user.id!!,
            username = user.username,
            email = user.email,
            phone = user.phone,
            status = user.status,
            createdAt = user.createdAt
        )
    }
}
```

**BCrypt 密码加密说明：**

```kotlin
// 原始密码
val password = "123456"

// 加密（每次结果不同，因为自动加盐）
val encoded1 = passwordEncoder.encode(password)
// 结果：$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iY3g9b6i

val encoded2 = passwordEncoder.encode(password)
// 结果：$2a$10$5Z9mfXJT8YXZXZXZXZXZXZXZXZXZXZXZXZXZXZXZXZXZXZXZXZX

// 验证密码（与加密结果比对）
passwordEncoder.matches(password, encoded1)  // true
passwordEncoder.matches(password, encoded2)  // true
passwordEncoder.matches("wrong", encoded1)   // false
```

## 11.2 JWT Token 工具类

### 11.2.1 JWT 配置

**application.yml:**

```yaml
# JWT 配置
app:
  jwt:
    secret: mySecretKeyForJWT123456789012345678901234567890  # 密钥（至少32字符）
    expiration: 7200  # 过期时间（秒）= 2小时
    issuer: my-spring-boot-app  # 签发者
```

**配置类：**

```kotlin
package com.example.demo.config

import org.springframework.boot.context.properties.ConfigurationProperties
import org.springframework.stereotype.Component

/**
 * JWT 配置属性
 */
@Component
@ConfigurationProperties(prefix = "app.jwt")
data class JwtProperties(
    /**
     * JWT 密钥（用于签名和验证）
     * 建议至少32字符，生产环境使用复杂密钥
     */
    var secret: String = "",
    
    /**
     * JWT 过期时间（秒）
     * 默认 2 小时
     */
    var expiration: Long = 7200,
    
    /**
     * JWT 签发者
     */
    var issuer: String = "my-app"
)
```

### 11.2.2 JWT 工具类

```kotlin
package com.example.demo.util

import com.example.demo.config.JwtProperties
import io.jsonwebtoken.Claims
import io.jsonwebtoken.Jwts
import io.jsonwebtoken.SignatureAlgorithm
import io.jsonwebtoken.security.Keys
import org.springframework.stereotype.Component
import java.util.Date
import javax.crypto.SecretKey

/**
 * JWT 工具类
 * 
 * JWT（JSON Web Token）由三部分组成：
 * 1. Header（头部）：算法和令牌类型
 * 2. Payload（载荷）：存放用户信息
 * 3. Signature（签名）：防止篡改
 * 
 * 格式：Header.Payload.Signature
 * 例如：eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMiLCJleHAiOjE2MzYwMDAwMDB9.abc123
 */
@Component
class JwtUtil(
    private val jwtProperties: JwtProperties
) {
    
    /**
     * 获取签名密钥
     * 
     * 将配置的密钥字符串转为 SecretKey
     */
    private fun getSigningKey(): SecretKey {
        return Keys.hmacShaKeyFor(jwtProperties.secret.toByteArray())
    }
    
    /**
     * 生成 Token
     * 
     * @param userId 用户ID
     * @param username 用户名
     * @return JWT Token
     */
    fun generateToken(userId: Long, username: String): String {
        val now = Date()
        val expirationDate = Date(now.time + jwtProperties.expiration * 1000)
        
        return Jwts.builder()
            .setSubject(userId.toString())  // 主题（通常是用户ID）
            .claim("username", username)  // 自定义声明：用户名
            .setIssuer(jwtProperties.issuer)  // 签发者
            .setIssuedAt(now)  // 签发时间
            .setExpiration(expirationDate)  // 过期时间
            .signWith(getSigningKey(), SignatureAlgorithm.HS256)  // 签名算法
            .compact()
    }
    
    /**
     * 生成 Token（支持更多自定义声明）
     * 
     * @param userId 用户ID
     * @param claims 自定义声明
     * @return JWT Token
     */
    fun generateToken(userId: Long, claims: Map<String, Any>): String {
        val now = Date()
        val expirationDate = Date(now.time + jwtProperties.expiration * 1000)
        
        return Jwts.builder()
            .setSubject(userId.toString())
            .setClaims(claims)  // 添加自定义声明
            .setIssuer(jwtProperties.issuer)
            .setIssuedAt(now)
            .setExpiration(expirationDate)
            .signWith(getSigningKey(), SignatureAlgorithm.HS256)
            .compact()
    }
    
    /**
     * 解析 Token
     * 
     * @param token JWT Token
     * @return Claims（载荷）
     * @throws io.jsonwebtoken.JwtException Token 无效或过期
     */
    fun parseToken(token: String): Claims {
        return Jwts.parserBuilder()
            .setSigningKey(getSigningKey())
            .build()
            .parseClaimsJws(token)
            .body
    }
    
    /**
     * 从 Token 中获取用户ID
     * 
     * @param token JWT Token
     * @return 用户ID
     */
    fun getUserIdFromToken(token: String): Long {
        val claims = parseToken(token)
        return claims.subject.toLong()
    }
    
    /**
     * 从 Token 中获取用户名
     * 
     * @param token JWT Token
     * @return 用户名
     */
    fun getUsernameFromToken(token: String): String? {
        val claims = parseToken(token)
        return claims["username"] as? String
    }
    
    /**
     * 验证 Token 是否有效
     * 
     * @param token JWT Token
     * @return 是否有效
     */
    fun validateToken(token: String): Boolean {
        return try {
            parseToken(token)
            true
        } catch (e: Exception) {
            false
        }
    }
    
    /**
     * 判断 Token 是否过期
     * 
     * @param token JWT Token
     * @return 是否过期
     */
    fun isTokenExpired(token: String): Boolean {
        return try {
            val claims = parseToken(token)
            val expiration = claims.expiration
            expiration.before(Date())
        } catch (e: Exception) {
            true
        }
    }
}
```

## 11.3 登录接口实现

### 11.3.1 登录服务

```kotlin
package com.example.demo.service

import com.example.demo.dto.LoginRequest
import com.example.demo.dto.LoginResponse
import com.example.demo.dto.UserInfo
import com.example.demo.exception.UnauthorizedException
import com.example.demo.mapper.UserMapper
import com.example.demo.util.JwtUtil
import org.springframework.data.redis.core.RedisTemplate
import org.springframework.security.crypto.password.PasswordEncoder
import org.springframework.stereotype.Service
import java.util.concurrent.TimeUnit

@Service
class AuthService(
    private val userMapper: UserMapper,
    private val passwordEncoder: PasswordEncoder,
    private val jwtUtil: JwtUtil,
    private val redisTemplate: RedisTemplate<String, Any>
) {
    
    companion object {
        private const val TOKEN_PREFIX = "token:"
        private const val USER_PREFIX = "user:"
    }
    
    /**
     * 用户登录
     * 
     * @param request 登录请求
     * @return 登录响应（包含Token）
     */
    fun login(request: LoginRequest): LoginResponse {
        // 1. 查询用户
        val user = userMapper.findByUsername(request.username)
            ?: throw UnauthorizedException("用户名或密码错误")
        
        // 2. 验证密码
        if (!passwordEncoder.matches(request.password, user.password)) {
            throw UnauthorizedException("用户名或密码错误")
        }
        
        // 3. 检查用户状态
        if (user.status != 1) {
            throw UnauthorizedException("账号已被禁用")
        }
        
        // 4. 生成 Token
        val token = jwtUtil.generateToken(
            userId = user.id!!,
            username = user.username
        )
        
        // 5. 将 Token 和用户信息存入 Redis（设置过期时间）
        val tokenKey = "$TOKEN_PREFIX$token"
        val userKey = "$USER_PREFIX${user.id}"
        
        val userInfo = UserInfo(
            id = user.id!!,
            username = user.username,
            email = user.email,
            phone = user.phone,
            status = user.status,
            createdAt = user.createdAt
        )
        
        // Token 作为 key，存储用户ID
        redisTemplate.opsForValue().set(
            tokenKey,
            user.id!!,
            jwtProperties.expiration,
            TimeUnit.SECONDS
        )
        
        // 用户ID 作为 key，存储用户信息
        redisTemplate.opsForValue().set(
            userKey,
            userInfo,
            jwtProperties.expiration,
            TimeUnit.SECONDS
        )
        
        // 6. 返回登录响应
        return LoginResponse(
            accessToken = token,
            tokenType = "Bearer",
            expiresIn = jwtProperties.expiration,
            user = userInfo
        )
    }
    
    /**
     * 退出登录
     * 
     * @param token JWT Token
     */
    fun logout(token: String) {
        try {
            // 从 Token 中获取用户ID
            val userId = jwtUtil.getUserIdFromToken(token)
            
            // 删除 Redis 中的 Token 和用户信息
            val tokenKey = "$TOKEN_PREFIX$token"
            val userKey = "$USER_PREFIX$userId"
            
            redisTemplate.delete(tokenKey)
            redisTemplate.delete(userKey)
        } catch (e: Exception) {
            // Token 无效时忽略
        }
    }
    
    /**
     * 验证 Token 并获取用户信息
     * 
     * @param token JWT Token
     * @return 用户信息
     */
    fun validateTokenAndGetUser(token: String): UserInfo? {
        return try {
            // 1. 验证 Token 格式和签名
            if (!jwtUtil.validateToken(token)) {
                return null
            }
            
            // 2. 检查 Redis 中是否存在（是否已登录）
            val tokenKey = "$TOKEN_PREFIX$token"
            val userId = redisTemplate.opsForValue().get(tokenKey) as? Long
                ?: return null
            
            // 3. 获取用户信息
            val userKey = "$USER_PREFIX$userId"
            redisTemplate.opsForValue().get(userKey) as? UserInfo
        } catch (e: Exception) {
            null
        }
    }
}
```

### 11.3.2 认证控制器

```kotlin
package com.example.demo.controller

import com.example.demo.dto.*
import com.example.demo.service.AuthService
import io.swagger.v3.oas.annotations.Operation
import io.swagger.v3.oas.annotations.tags.Tag
import jakarta.validation.Valid
import org.springframework.web.bind.annotation.*

/**
 * 认证接口
 */
@Tag(name = "认证管理", description = "用户注册、登录、退出等接口")
@RestController
@RequestMapping("/auth")
class AuthController(
    private val authService: AuthService
) {
    
    /**
     * 用户注册
     */
    @Operation(summary = "用户注册", description = "注册新用户")
    @PostMapping("/register")
    fun register(@RequestBody @Valid request: RegisterRequest): ApiResponse<UserInfo> {
        val userInfo = authService.register(request)
        return ApiResponse.success(userInfo, "注册成功")
    }
    
    /**
     * 用户登录
     */
    @Operation(summary = "用户登录", description = "用户名密码登录，返回Token")
    @PostMapping("/login")
    fun login(@RequestBody @Valid request: LoginRequest): ApiResponse<LoginResponse> {
        val response = authService.login(request)
        return ApiResponse.success(response, "登录成功")
    }
    
    /**
     * 退出登录
     */
    @Operation(summary = "退出登录", description = "清除登录状态")
    @PostMapping("/logout")
    fun logout(@RequestHeader("Authorization") authorization: String): ApiResponse<Void> {
        // 去掉 "Bearer " 前缀
        val token = authorization.removePrefix("Bearer ")
        authService.logout(token)
        return ApiResponse.success(message = "退出成功")
    }
    
    /**
     * 获取当前用户信息
     */
    @Operation(summary = "获取当前用户", description = "根据Token获取当前登录用户信息")
    @GetMapping("/me")
    fun getCurrentUser(@RequestHeader("Authorization") authorization: String): ApiResponse<UserInfo> {
        val token = authorization.removePrefix("Bearer ")
        val userInfo = authService.validateTokenAndGetUser(token)
            ?: return ApiResponse.unauthorized("未登录或登录已过期")
        
        return ApiResponse.success(userInfo)
    }
}
```

## 11.4 Token 拦截器

### 11.4.1 实现拦截器

```kotlin
package com.example.demo.interceptor

import com.example.demo.exception.UnauthorizedException
import com.example.demo.service.AuthService
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse
import org.springframework.stereotype.Component
import org.springframework.web.servlet.HandlerInterceptor

/**
 * JWT Token 拦截器
 * 
 * 拦截需要登录的接口，验证 Token
 */
@Component
class JwtInterceptor(
    private val authService: AuthService
) : HandlerInterceptor {
    
    /**
     * 请求前拦截：验证 Token
     */
    override fun preHandle(
        request: HttpServletRequest,
        response: HttpServletResponse,
        handler: Any
    ): Boolean {
        // OPTIONS 请求直接放行（CORS 预检请求）
        if (request.method == "OPTIONS") {
            return true
        }
        
        // 1. 从请求头获取 Token
        val authorization = request.getHeader("Authorization")
        
        if (authorization.isNullOrBlank() || !authorization.startsWith("Bearer ")) {
            throw UnauthorizedException("未登录或登录已过期")
        }
        
        // 2. 去掉 "Bearer " 前缀
        val token = authorization.removePrefix("Bearer ")
        
        // 3. 验证 Token 并获取用户信息
        val userInfo = authService.validateTokenAndGetUser(token)
            ?: throw UnauthorizedException("未登录或登录已过期")
        
        // 4. 将用户信息存入请求属性（后续可以直接获取）
        request.setAttribute("currentUser", userInfo)
        request.setAttribute("userId", userInfo.id)
        
        return true
    }
}
```

### 11.4.2 注册拦截器

```kotlin
package com.example.demo.config

import com.example.demo.interceptor.JwtInterceptor
import com.example.demo.interceptor.LogTraceInterceptor
import org.springframework.context.annotation.Configuration
import org.springframework.web.servlet.config.annotation.InterceptorRegistry
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer

/**
 * Web MVC 配置
 */
@Configuration
class WebMvcConfig(
    private val logTraceInterceptor: LogTraceInterceptor,
    private val jwtInterceptor: JwtInterceptor
) : WebMvcConfigurer {
    
    override fun addInterceptors(registry: InterceptorRegistry) {
        // 日志追踪拦截器（所有请求）
        registry.addInterceptor(logTraceInterceptor)
            .addPathPatterns("/**")
        
        // JWT Token 拦截器（需要登录的接口）
        registry.addInterceptor(jwtInterceptor)
            .addPathPatterns("/**")  // 拦截所有请求
            .excludePathPatterns(
                // 排除不需要登录的接口
                "/auth/register",  // 注册
                "/auth/login",     // 登录
                "/doc.html",       // 接口文档
                "/swagger-ui/**",  // Swagger UI
                "/v3/api-docs/**", // OpenAPI
                "/error"           // 错误页面
            )
    }
}
```

### 11.4.3 获取当前登录用户

在 Controller 中获取当前登录用户：

```kotlin
@RestController
@RequestMapping("/users")
class UserController {
    
    /**
     * 获取当前用户信息
     * 
     * 方式1：从请求属性中获取
     */
    @GetMapping("/me")
    fun getCurrentUser(request: HttpServletRequest): ApiResponse<UserInfo> {
        val userInfo = request.getAttribute("currentUser") as UserInfo
        return ApiResponse.success(userInfo)
    }
    
    /**
     * 更新当前用户信息
     * 
     * 方式2：从请求属性中获取用户ID
     */
    @PutMapping("/me")
    fun updateCurrentUser(
        request: HttpServletRequest,
        @RequestBody updateRequest: UpdateUserRequest
    ): ApiResponse<User> {
        val userId = request.getAttribute("userId") as Long
        
        // 更新用户信息
        val user = userService.updateUser(userId, updateRequest)
        return ApiResponse.success(user)
    }
}
```

**使用自定义注解获取当前用户（可选）：**

```kotlin
/**
 * 当前用户注解
 */
@Target(AnnotationTarget.VALUE_PARAMETER)
@Retention(AnnotationRetention.RUNTIME)
annotation class CurrentUser

/**
 * 参数解析器
 */
@Component
class CurrentUserArgumentResolver : HandlerMethodArgumentResolver {
    
    override fun supportsParameter(parameter: MethodParameter): Boolean {
        return parameter.hasParameterAnnotation(CurrentUser::class.java)
    }
    
    override fun resolveArgument(
        parameter: MethodParameter,
        mavContainer: ModelAndViewContainer?,
        webRequest: NativeWebRequest,
        binderFactory: WebDataBinderFactory?
    ): Any? {
        val request = webRequest.getNativeRequest(HttpServletRequest::class.java)
        return request?.getAttribute("currentUser")
    }
}

// 注册参数解析器
@Configuration
class WebMvcConfig : WebMvcConfigurer {
    override fun addArgumentResolvers(resolvers: MutableList<HandlerMethodArgumentResolver>) {
        resolvers.add(CurrentUserArgumentResolver())
    }
}

// 使用
@GetMapping("/me")
fun getCurrentUser(@CurrentUser user: UserInfo): ApiResponse<UserInfo> {
    return ApiResponse.success(user)
}
```

## 11.5 测试认证流程

### 11.5.1 注册用户

```bash
curl -X POST http://localhost:8080/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "username": "zhangsan",
    "password": "123456",
    "confirmPassword": "123456",
    "email": "zhangsan@example.com",
    "phone": "13800138000"
  }'

# 响应：
{
  "code": 200,
  "message": "注册成功",
  "data": {
    "id": 1,
    "username": "zhangsan",
    "email": "zhangsan@example.com",
    "phone": "13800138000",
    "status": 1,
    "createdAt": "2025-10-11T15:30:00"
  },
  "timestamp": "2025-10-11T15:30:00"
}
```

### 11.5.2 登录

```bash
curl -X POST http://localhost:8080/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "username": "zhangsan",
    "password": "123456"
  }'

# 响应：
{
  "code": 200,
  "message": "登录成功",
  "data": {
    "accessToken": "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwidXNlcm5hbWUiOiJ6aGFuZ3NhbiIsImlzcyI6Im15LWFwcCIsImlhdCI6MTYzNjAwMDAwMCwiZXhwIjoxNjM2MDA3MjAwfQ.abc123def456",
    "tokenType": "Bearer",
    "expiresIn": 7200,
    "user": {
      "id": 1,
      "username": "zhangsan",
      "email": "zhangsan@example.com",
      "phone": "13800138000",
      "status": 1,
      "createdAt": "2025-10-11T15:30:00"
    }
  },
  "timestamp": "2025-10-11T15:31:00"
}
```

### 11.5.3 访问需要登录的接口

```bash
# 获取当前用户信息（需要 Token）
curl -X GET http://localhost:8080/auth/me \
  -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9..."

# 响应：
{
  "code": 200,
  "message": "success",
  "data": {
    "id": 1,
    "username": "zhangsan",
    "email": "zhangsan@example.com",
    "phone": "13800138000",
    "status": 1,
    "createdAt": "2025-10-11T15:30:00"
  }
}
```

### 11.5.4 退出登录

```bash
curl -X POST http://localhost:8080/auth/logout \
  -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9..."

# 响应：
{
  "code": 200,
  "message": "退出成功",
  "timestamp": "2025-10-11T15:35:00"
}
```

## 11.6 本章小结

本章实现了完整的用户登录认证系统：

✅ **用户注册**：参数验证、密码加密（BCrypt）、唯一性检查
✅ **用户登录**：密码验证、JWT Token 生成、Redis 存储登录状态
✅ **Token 认证**：JWT 工具类、Token 拦截器、登录状态验证
✅ **退出登录**：清除 Redis 中的登录状态
✅ **获取当前用户**：从请求属性中获取、自定义注解获取

**关键要点：**

- 使用 BCrypt 加密密码，每次加密结果不同，安全性高
- JWT Token 分为三部分：Header、Payload、Signature
- Token 存储在 Redis 中，便于管理登录状态（如踢出用户）
- 使用拦截器验证 Token，无需在每个接口中重复验证
- Token 过期时间不宜过长，建议 2-24 小时

**最佳实践：**

1. 密码至少 6 位，包含字母、数字
2. Token 密钥使用复杂字符串，生产环境不要硬编码
3. 敏感操作（如修改密码）需要验证原密码
4. 登录失败次数限制，防止暴力破解
5. Token 存储在 Redis 中，便于统一管理和清除

**下一章预告：**
在下一章中，我们将学习异步处理与任务调度，包括 @Async 异步方法、@Scheduled 定时任务、线程池配置等内容。

---

# 第12章：异步与任务调度

本章将介绍如何在 Spring Boot 中实现异步处理和定时任务，提升系统性能和自动化能力。

## 12.1 异步方法（@Async）

### 12.1.1 为什么需要异步处理？

**同步调用的问题：**
```kotlin
fun processOrder(orderId: Long) {
    saveOrder(orderId)           // 50ms
    sendEmail(orderId)           // 2000ms  等待邮件发送
    sendSMS(orderId)             // 1000ms  等待短信发送
    updateInventory(orderId)     // 100ms
    // 总耗时：3150ms
}
```

**异步调用的优势：**
```kotlin
fun processOrder(orderId: Long) {
    saveOrder(orderId)           // 50ms
    asyncSendEmail(orderId)      // 异步执行，不等待
    asyncSendSMS(orderId)        // 异步执行，不等待
    updateInventory(orderId)     // 100ms
    // 总耗时：150ms，提升21倍性能
}
```

**适用场景：**
- 📧 发送邮件、短信
- 📊 生成报表、导出数据
- 🖼️ 图片处理、视频转码
- 📝 记录日志、审计信息
- 🔄 数据同步、备份

### 12.1.2 启用异步支持

```kotlin
package com.example.demo

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.scheduling.annotation.EnableAsync
import org.springframework.scheduling.annotation.EnableScheduling

/**
 * Spring Boot 主类
 */
@SpringBootApplication
@EnableAsync  // 启用异步方法支持
@EnableScheduling  // 启用定时任务支持
class DemoApplication

fun main(args: Array<String>) {
    runApplication<DemoApplication>(*args)
}
```

### 12.1.3 配置线程池

**为什么要配置线程池？**
- Spring 默认使用 `SimpleAsyncTaskExecutor`，每次创建新线程，性能差
- 自定义线程池可以控制线程数量、队列大小、拒绝策略等

```kotlin
package com.example.demo.config

import org.slf4j.LoggerFactory
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.scheduling.annotation.AsyncConfigurer
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor
import java.util.concurrent.Executor
import java.util.concurrent.ThreadPoolExecutor

/**
 * 异步配置类
 */
@Configuration
class AsyncConfig : AsyncConfigurer {
    
    private val logger = LoggerFactory.getLogger(javaClass)
    
    /**
     * 配置异步线程池
     * 
     * 线程池参数说明：
     * - corePoolSize：核心线程数（始终保持的线程数）
     * - maxPoolSize：最大线程数（线程池能创建的最大线程数）
     * - queueCapacity：队列容量（核心线程满后，任务放入队列）
     * - keepAliveSeconds：空闲线程存活时间
     * - threadNamePrefix：线程名称前缀
     * - rejectedExecutionHandler：拒绝策略（队列满时如何处理新任务）
     */
    @Bean(name = ["asyncExecutor"])
    override fun getAsyncExecutor(): Executor {
        val executor = ThreadPoolTaskExecutor()
        
        // 核心线程数（CPU核心数 * 2）
        executor.corePoolSize = Runtime.getRuntime().availableProcessors() * 2
        
        // 最大线程数
        executor.maxPoolSize = 50
        
        // 队列容量
        executor.queueCapacity = 200
        
        // 空闲线程存活时间（秒）
        executor.setKeepAliveSeconds(60)
        
        // 线程名称前缀（便于日志追踪）
        executor.setThreadNamePrefix("Async-")
        
        // 拒绝策略：由调用线程执行
        // 其他策略：
        // - AbortPolicy：抛出异常（默认）
        // - CallerRunsPolicy：由调用线程执行
        // - DiscardPolicy：直接丢弃
        // - DiscardOldestPolicy：丢弃最旧的任务
        executor.setRejectedExecutionHandler(ThreadPoolExecutor.CallerRunsPolicy())
        
        // 等待任务完成后再关闭线程池（优雅停机）
        executor.setWaitForTasksToCompleteOnShutdown(true)
        
        // 最大等待时间（秒）
        executor.setAwaitTerminationSeconds(60)
        
        // 初始化
        executor.initialize()
        
        logger.info("异步线程池已初始化：核心线程=${executor.corePoolSize}, 最大线程=${executor.maxPoolSize}, 队列容量=${executor.queueCapacity}")
        
        return executor
    }
}
```

**线程池参数计算建议：**

| 任务类型 | 核心线程数 | 最大线程数 | 队列容量 |
|---------|----------|-----------|---------|
| **CPU密集型**（计算） | CPU核心数 + 1 | CPU核心数 * 2 | 10-50 |
| **IO密集型**（网络、数据库） | CPU核心数 * 2 | CPU核心数 * 4 | 100-500 |
| **混合型** | CPU核心数 * 2 | CPU核心数 * 3 | 50-200 |

### 12.1.4 使用 @Async 注解

```kotlin
package com.example.demo.service

import org.slf4j.LoggerFactory
import org.springframework.scheduling.annotation.Async
import org.springframework.stereotype.Service
import java.util.concurrent.CompletableFuture

/**
 * 异步服务示例
 */
@Service
class AsyncService {
    
    private val logger = LoggerFactory.getLogger(javaClass)
    
    /**
     * 异步发送邮件（无返回值）
     * 
     * @Async 注解说明：
     * - 方法必须是 public
     * - 不能在同一个类中调用（需要通过Spring代理调用）
     * - 可以指定线程池：@Async("asyncExecutor")
     */
    @Async
    fun sendEmail(to: String, subject: String, content: String) {
        logger.info("开始发送邮件: to=$to, subject=$subject, thread=${Thread.currentThread().name}")
        
        try {
            // 模拟发送邮件（耗时操作）
            Thread.sleep(2000)
            
            logger.info("邮件发送成功: to=$to")
        } catch (e: Exception) {
            logger.error("邮件发送失败: to=$to", e)
        }
    }
    
    /**
     * 异步发送短信（无返回值）
     */
    @Async
    fun sendSMS(phone: String, message: String) {
        logger.info("开始发送短信: phone=$phone, thread=${Thread.currentThread().name}")
        
        try {
            Thread.sleep(1000)
            logger.info("短信发送成功: phone=$phone")
        } catch (e: Exception) {
            logger.error("短信发送失败: phone=$phone", e)
        }
    }
    
    /**
     * 异步处理（有返回值）
     * 
     * 使用 CompletableFuture 返回异步结果
     */
    @Async
    fun processData(data: String): CompletableFuture<String> {
        logger.info("开始处理数据: data=$data, thread=${Thread.currentThread().name}")
        
        try {
            // 模拟数据处理
            Thread.sleep(3000)
            val result = "处理结果: ${data.uppercase()}"
            
            logger.info("数据处理完成: result=$result")
            return CompletableFuture.completedFuture(result)
        } catch (e: Exception) {
            logger.error("数据处理失败", e)
            return CompletableFuture.failedFuture(e)
        }
    }
    
    /**
     * 批量异步处理（并行执行）
     */
    @Async
    fun batchProcess(items: List<String>): CompletableFuture<List<String>> {
        logger.info("开始批量处理: size=${items.size}, thread=${Thread.currentThread().name}")
        
        val results = items.map { item ->
            // 处理每个项目
            Thread.sleep(100)
            "处理: $item"
        }
        
        logger.info("批量处理完成")
        return CompletableFuture.completedFuture(results)
    }
}
```

### 12.1.5 调用异步方法

```kotlin
package com.example.demo.service

import org.slf4j.LoggerFactory
import org.springframework.stereotype.Service
import java.util.concurrent.CompletableFuture

@Service
class OrderService(
    private val asyncService: AsyncService
) {
    
    private val logger = LoggerFactory.getLogger(javaClass)
    
    /**
     * 处理订单（使用异步方法）
     */
    fun processOrder(orderId: Long) {
        logger.info("开始处理订单: orderId=$orderId")
        
        // 保存订单（同步）
        saveOrder(orderId)
        
        // 异步发送邮件（不等待）
        asyncService.sendEmail(
            to = "user@example.com",
            subject = "订单确认",
            content = "您的订单 $orderId 已确认"
        )
        
        // 异步发送短信（不等待）
        asyncService.sendSMS(
            phone = "13800138000",
            message = "订单 $orderId 已确认"
        )
        
        // 更新库存（同步）
        updateInventory(orderId)
        
        logger.info("订单处理完成: orderId=$orderId")
        // 方法立即返回，不等待邮件和短信发送完成
    }
    
    /**
     * 使用异步方法的返回值
     */
    fun processWithResult() {
        logger.info("开始异步处理")
        
        // 调用异步方法，返回 CompletableFuture
        val future1 = asyncService.processData("data1")
        val future2 = asyncService.processData("data2")
        val future3 = asyncService.processData("data3")
        
        // 等待所有异步任务完成
        CompletableFuture.allOf(future1, future2, future3).join()
        
        // 获取结果
        val result1 = future1.get()
        val result2 = future2.get()
        val result3 = future3.get()
        
        logger.info("所有异步任务完成: result1=$result1, result2=$result2, result3=$result3")
    }
    
    /**
     * 异步任务的异常处理
     */
    fun processWithExceptionHandling() {
        val future = asyncService.processData("test")
        
        // 方式1：使用 exceptionally
        future.exceptionally { ex ->
            logger.error("异步任务执行失败", ex)
            "默认值"
        }
        
        // 方式2：使用 handle
        future.handle { result, ex ->
            if (ex != null) {
                logger.error("异步任务执行失败", ex)
                "默认值"
            } else {
                result
            }
        }
        
        // 方式3：使用 whenComplete
        future.whenComplete { result, ex ->
            if (ex != null) {
                logger.error("异步任务执行失败", ex)
            } else {
                logger.info("异步任务执行成功: result=$result")
            }
        }
    }
    
    private fun saveOrder(orderId: Long) {
        Thread.sleep(50)
        logger.info("订单已保存: orderId=$orderId")
    }
    
    private fun updateInventory(orderId: Long) {
        Thread.sleep(100)
        logger.info("库存已更新: orderId=$orderId")
    }
}
```

### 12.1.6 异步方法注意事项

**❌ 常见错误：**

```kotlin
@Service
class UserService {
    
    @Async
    fun asyncMethod() {
        println("异步方法")
    }
    
    // ❌ 错误：在同一个类中调用异步方法
    fun callAsync() {
        asyncMethod()  // 不会异步执行，因为没有通过代理
    }
}
```

**✅ 正确做法：**

```kotlin
@Service
class UserService(
    private val asyncService: AsyncService  // 注入其他Service
) {
    
    fun callAsync() {
        asyncService.asyncMethod()  // 通过Spring代理调用，会异步执行
    }
}
```

## 12.2 定时任务（@Scheduled）

### 12.2.1 基本用法

```kotlin
package com.example.demo.task

import org.slf4j.LoggerFactory
import org.springframework.scheduling.annotation.Scheduled
import org.springframework.stereotype.Component
import java.time.LocalDateTime

/**
 * 定时任务示例
 */
@Component
class ScheduledTasks {
    
    private val logger = LoggerFactory.getLogger(javaClass)
    
    /**
     * 固定延迟执行
     * 
     * @Scheduled(fixedDelay = 5000)
     * - 上次执行完成后，延迟5秒再执行
     * - 单位：毫秒
     */
    @Scheduled(fixedDelay = 5000)
    fun taskWithFixedDelay() {
        logger.info("固定延迟任务执行: ${LocalDateTime.now()}")
        Thread.sleep(2000)  // 模拟任务执行
    }
    
    /**
     * 固定速率执行
     * 
     * @Scheduled(fixedRate = 5000)
     * - 每隔5秒执行一次
     * - 如果任务执行时间超过间隔，会立即执行下一次
     */
    @Scheduled(fixedRate = 5000)
    fun taskWithFixedRate() {
        logger.info("固定速率任务执行: ${LocalDateTime.now()}")
    }
    
    /**
     * 初始延迟后执行
     * 
     * @Scheduled(initialDelay = 10000, fixedRate = 5000)
     * - 启动后延迟10秒首次执行
     * - 之后每隔5秒执行一次
     */
    @Scheduled(initialDelay = 10000, fixedRate = 5000)
    fun taskWithInitialDelay() {
        logger.info("初始延迟任务执行: ${LocalDateTime.now()}")
    }
    
    /**
     * Cron 表达式执行
     * 
     * @Scheduled(cron = "0 0 2 * * ?")
     * - 每天凌晨2点执行
     */
    @Scheduled(cron = "0 0 2 * * ?")
    fun taskWithCron() {
        logger.info("Cron任务执行: ${LocalDateTime.now()}")
    }
}
```

### 12.2.2 Cron 表达式详解

**Cron 表达式格式：**
```
秒 分 时 日 月 星期

例如：0 0 12 * * ?  // 每天12点执行
```

**字段说明：**

| 字段 | 允许值 | 允许的特殊字符 |
|-----|-------|--------------|
| 秒 | 0-59 | , - * / |
| 分 | 0-59 | , - * / |
| 时 | 0-23 | , - * / |
| 日 | 1-31 | , - * ? / L W |
| 月 | 1-12 或 JAN-DEC | , - * / |
| 星期 | 1-7 或 SUN-SAT | , - * ? / L # |

**特殊字符说明：**
- `*`：所有值
- `?`：不指定值（日和星期只能用其中一个）
- `-`：范围（如：10-12）
- `,`：列举（如：1,3,5）
- `/`：步长（如：0/15 表示每15秒）
- `L`：最后（如：L 表示月末，6L 表示最后一个星期五）
- `W`：工作日（如：15W 表示15号最近的工作日）
- `#`：第几个（如：6#3 表示第3个星期五）

**常用 Cron 表达式示例：**

```kotlin
// 每分钟执行
@Scheduled(cron = "0 * * * * ?")

// 每小时执行
@Scheduled(cron = "0 0 * * * ?")

// 每天凌晨2点执行
@Scheduled(cron = "0 0 2 * * ?")

// 每天上午9点和下午6点执行
@Scheduled(cron = "0 0 9,18 * * ?")

// 工作日上午9点执行
@Scheduled(cron = "0 0 9 ? * MON-FRI")

// 每月1号凌晨1点执行
@Scheduled(cron = "0 0 1 1 * ?")

// 每周一凌晨3点执行
@Scheduled(cron = "0 0 3 ? * MON")

// 每15分钟执行
@Scheduled(cron = "0 0/15 * * * ?")

// 每30秒执行
@Scheduled(cron = "0/30 * * * * ?")

// 每小时的第5分钟和第35分钟执行
@Scheduled(cron = "0 5,35 * * * ?")
```

### 12.2.3 实战案例

```kotlin
package com.example.demo.task

import com.example.demo.service.DataService
import com.example.demo.service.ReportService
import org.slf4j.LoggerFactory
import org.springframework.scheduling.annotation.Scheduled
import org.springframework.stereotype.Component

/**
 * 企业常见定时任务
 */
@Component
class BusinessScheduledTasks(
    private val dataService: DataService,
    private val reportService: ReportService
) {
    
    private val logger = LoggerFactory.getLogger(javaClass)
    
    /**
     * 定时清理过期数据
     * 
     * 每天凌晨3点执行
     */
    @Scheduled(cron = "0 0 3 * * ?")
    fun cleanExpiredData() {
        logger.info("开始清理过期数据")
        
        try {
            val count = dataService.deleteExpiredData()
            logger.info("过期数据清理完成，删除 $count 条记录")
        } catch (e: Exception) {
            logger.error("过期数据清理失败", e)
        }
    }
    
    /**
     * 定时备份数据库
     * 
     * 每天凌晨2点执行
     */
    @Scheduled(cron = "0 0 2 * * ?")
    fun backupDatabase() {
        logger.info("开始备份数据库")
        
        try {
            dataService.backupDatabase()
            logger.info("数据库备份完成")
        } catch (e: Exception) {
            logger.error("数据库备份失败", e)
        }
    }
    
    /**
     * 定时生成日报
     * 
     * 每天早上8点执行
     */
    @Scheduled(cron = "0 0 8 * * ?")
    fun generateDailyReport() {
        logger.info("开始生成日报")
        
        try {
            reportService.generateDailyReport()
            logger.info("日报生成完成")
        } catch (e: Exception) {
            logger.error("日报生成失败", e)
        }
    }
    
    /**
     * 定时同步数据
     * 
     * 每小时执行一次
     */
    @Scheduled(cron = "0 0 * * * ?")
    fun syncData() {
        logger.info("开始同步数据")
        
        try {
            val count = dataService.syncDataFromRemote()
            logger.info("数据同步完成，同步 $count 条记录")
        } catch (e: Exception) {
            logger.error("数据同步失败", e)
        }
    }
    
    /**
     * 定时检查系统状态
     * 
     * 每5分钟执行一次
     */
    @Scheduled(fixedRate = 300000)  // 5分钟 = 300000毫秒
    fun checkSystemStatus() {
        logger.info("开始检查系统状态")
        
        try {
            val status = dataService.getSystemStatus()
            if (!status.healthy) {
                logger.warn("系统状态异常: ${status.message}")
                // 发送告警通知
            }
        } catch (e: Exception) {
            logger.error("系统状态检查失败", e)
        }
    }
    
    /**
     * 定时刷新缓存
     * 
     * 每30分钟执行一次
     */
    @Scheduled(fixedRate = 1800000)  // 30分钟
    fun refreshCache() {
        logger.info("开始刷新缓存")
        
        try {
            dataService.refreshCache()
            logger.info("缓存刷新完成")
        } catch (e: Exception) {
            logger.error("缓存刷新失败", e)
        }
    }
}
```

### 12.2.4 动态定时任务

有时需要动态配置定时任务（如从数据库读取执行时间），可以使用 `ScheduledTaskRegistrar`：

```kotlin
package com.example.demo.config

import org.springframework.context.annotation.Configuration
import org.springframework.scheduling.annotation.SchedulingConfigurer
import org.springframework.scheduling.config.ScheduledTaskRegistrar
import org.springframework.scheduling.support.CronTrigger
import java.util.concurrent.Executors

/**
 * 动态定时任务配置
 */
@Configuration
class DynamicSchedulingConfig : SchedulingConfigurer {
    
    override fun configureTasks(taskRegistrar: ScheduledTaskRegistrar) {
        // 设置线程池
        taskRegistrar.setScheduler(Executors.newScheduledThreadPool(10))
        
        // 动态添加定时任务
        taskRegistrar.addTriggerTask(
            {
                // 任务执行逻辑
                println("动态定时任务执行: ${System.currentTimeMillis()}")
            },
            {
                // 动态获取 Cron 表达式（可以从数据库读取）
                val cronExpression = getCronExpressionFromDatabase()
                CronTrigger(cronExpression).nextExecutionTime(it)
            }
        )
    }
    
    private fun getCronExpressionFromDatabase(): String {
        // 从数据库读取 Cron 表达式
        // 这里简化为返回固定值
        return "0 0/5 * * * ?"  // 每5分钟执行
    }
}
```

### 12.2.5 定时任务配置

**application.yml:**

```yaml
spring:
  task:
    scheduling:
      # 定时任务线程池大小
      pool:
        size: 10
      # 线程名称前缀
      thread-name-prefix: Task-
      # 关闭时等待任务完成
      shutdown:
        await-termination: true
        await-termination-period: 60s
```

## 12.3 异步与定时任务的最佳实践

### 12.3.1 异常处理

```kotlin
package com.example.demo.config

import org.slf4j.LoggerFactory
import org.springframework.aop.interceptor.AsyncUncaughtExceptionHandler
import org.springframework.context.annotation.Configuration
import org.springframework.scheduling.annotation.AsyncConfigurer
import java.lang.reflect.Method
import java.util.concurrent.Executor

/**
 * 异步异常处理配置
 */
@Configuration
class AsyncConfig : AsyncConfigurer {
    
    private val logger = LoggerFactory.getLogger(javaClass)
    
    /**
     * 配置异步方法的异常处理器
     * 
     * 处理返回 void 的异步方法抛出的异常
     */
    override fun getAsyncUncaughtExceptionHandler(): AsyncUncaughtExceptionHandler {
        return AsyncUncaughtExceptionHandler { ex, method, params ->
            logger.error(
                "异步方法执行异常: method=${method.name}, params=${params.contentToString()}",
                ex
            )
            
            // 可以在这里发送告警、记录数据库等
        }
    }
    
    override fun getAsyncExecutor(): Executor {
        // ... 线程池配置
        return super.getAsyncExecutor()
    }
}
```

### 12.3.2 监控定时任务执行

```kotlin
package com.example.demo.aspect

import org.aspectj.lang.ProceedingJoinPoint
import org.aspectj.lang.annotation.Around
import org.aspectj.lang.annotation.Aspect
import org.slf4j.LoggerFactory
import org.springframework.stereotype.Component

/**
 * 定时任务监控切面
 */
@Aspect
@Component
class ScheduledTaskAspect {
    
    private val logger = LoggerFactory.getLogger(javaClass)
    
    /**
     * 监控定时任务执行时间和异常
     */
    @Around("@annotation(org.springframework.scheduling.annotation.Scheduled)")
    fun around(joinPoint: ProceedingJoinPoint): Any? {
        val methodName = joinPoint.signature.name
        val startTime = System.currentTimeMillis()
        
        return try {
            logger.info("定时任务开始: method=$methodName")
            
            val result = joinPoint.proceed()
            
            val duration = System.currentTimeMillis() - startTime
            logger.info("定时任务完成: method=$methodName, duration=${duration}ms")
            
            result
        } catch (e: Exception) {
            val duration = System.currentTimeMillis() - startTime
            logger.error("定时任务失败: method=$methodName, duration=${duration}ms", e)
            throw e
        }
    }
}
```

### 12.3.3 防止定时任务并发执行

如果定时任务执行时间很长，可能会导致多个任务并发执行，可以使用分布式锁：

```kotlin
package com.example.demo.task

import org.slf4j.LoggerFactory
import org.springframework.data.redis.core.RedisTemplate
import org.springframework.scheduling.annotation.Scheduled
import org.springframework.stereotype.Component
import java.util.concurrent.TimeUnit

/**
 * 使用分布式锁防止并发执行
 */
@Component
class SafeScheduledTask(
    private val redisTemplate: RedisTemplate<String, Any>
) {
    
    private val logger = LoggerFactory.getLogger(javaClass)
    
    /**
     * 定时任务（使用分布式锁）
     */
    @Scheduled(fixedRate = 60000)  // 每分钟执行
    fun syncDataTask() {
        val lockKey = "task:sync:lock"
        val lockValue = System.currentTimeMillis().toString()
        
        // 尝试获取锁（30秒过期）
        val acquired = redisTemplate.opsForValue()
            .setIfAbsent(lockKey, lockValue, 30, TimeUnit.SECONDS) ?: false
        
        if (!acquired) {
            logger.warn("任务正在执行中，跳过本次执行")
            return
        }
        
        try {
            logger.info("开始执行同步任务")
            
            // 执行任务逻辑
            Thread.sleep(5000)
            
            logger.info("同步任务执行完成")
        } catch (e: Exception) {
            logger.error("同步任务执行失败", e)
        } finally {
            // 释放锁
            redisTemplate.delete(lockKey)
        }
    }
}
```

## 12.4 本章小结

本章介绍了 Spring Boot 的异步处理和定时任务：

✅ **@Async 异步方法**：提升性能、非阻塞执行
✅ **线程池配置**：控制线程数量、队列、拒绝策略
✅ **@Scheduled 定时任务**：固定延迟、固定速率、Cron 表达式
✅ **异常处理**：异步异常处理器、定时任务监控
✅ **最佳实践**：分布式锁防止并发、任务执行监控

**关键要点：**

- 异步方法不能在同一个类中调用，需要通过 Spring 代理
- 自定义线程池比默认的 SimpleAsyncTaskExecutor 性能好
- fixedDelay 是执行完成后延迟，fixedRate 是固定间隔
- Cron 表达式中日和星期只能用一个 `?`
- 长时间运行的定时任务要使用分布式锁防止并发

**最佳实践：**

1. 异步方法要有明确的异常处理
2. 线程池参数根据业务场景调整
3. 定时任务要有执行日志和监控
4. 敏感操作（如数据备份）要加分布式锁
5. 定时任务执行时间不宜过长，避免阻塞

**下一章预告：**
在下一章中，我们将学习 Docker 打包与部署上线，包括 Dockerfile 编写、镜像构建、Docker Compose 多容器编排、云服务器部署等内容。

---

# 第13章：Docker 打包与部署上线

本章将介绍如何将 Spring Boot 项目打包为 Docker 镜像，并部署到生产环境。

## 13.1 Maven 打包可执行 Jar

### 13.1.1 Spring Boot 打包原理

Spring Boot 使用 `spring-boot-maven-plugin` 插件将项目打包成可执行的 fat jar（包含所有依赖）：

```xml
<!-- pom.xml -->
<build>
    <plugins>
        <plugin>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-maven-plugin</artifactId>
        </plugin>
    </plugins>
</build>
```

**Fat Jar 结构：**
```
myapp.jar
├── BOOT-INF/
│   ├── classes/          # 项目编译后的 .class 文件
│   └── lib/              # 所有依赖的 jar 包
├── META-INF/
│   └── MANIFEST.MF       # 清单文件（指定 Main-Class）
└── org/
    └── springframework/
        └── boot/
            └── loader/   # Spring Boot 启动加载器
```

### 13.1.2 打包命令

```bash
# 清理并打包（跳过测试）
mvn clean package -DskipTests

# 或者使用 Maven Wrapper
./mvnw clean package -DskipTests

# Windows
mvnw.cmd clean package -DskipTests
```

**打包后的 jar 文件位置：**
```
target/
└── myapp-0.0.1-SNAPSHOT.jar  # 可执行 jar
```

### 13.1.3 运行 Jar 文件

```bash
# 运行 jar（使用默认配置）
java -jar target/myapp-0.0.1-SNAPSHOT.jar

# 指定环境（激活 prod 配置）
java -jar target/myapp-0.0.1-SNAPSHOT.jar --spring.profiles.active=prod

# 指定端口
java -jar target/myapp-0.0.1-SNAPSHOT.jar --server.port=8888

# 指定 JVM 参数
java -Xms512m -Xmx1024m -jar target/myapp-0.0.1-SNAPSHOT.jar

# 后台运行（Linux）
nohup java -jar target/myapp-0.0.1-SNAPSHOT.jar > app.log 2>&1 &
```

## 13.2 编写生产级 Dockerfile

### 13.2.1 单阶段 Dockerfile（不推荐）

```dockerfile
# 简单但不推荐的方式
FROM openjdk:17-jdk-slim

WORKDIR /app

# 复制 jar 文件
COPY target/*.jar app.jar

# 暴露端口
EXPOSE 8080

# 启动命令
ENTRYPOINT ["java", "-jar", "app.jar"]
```

**缺点：**
- 需要在本地先打包
- 镜像体积大（包含完整 JDK）
- 安全性较低

### 13.2.2 多阶段 Dockerfile（推荐）

```dockerfile
# 第一阶段：构建阶段
FROM maven:3.9-eclipse-temurin-17 AS builder

# 设置工作目录
WORKDIR /build

# 复制 pom.xml 和源代码
COPY pom.xml .
COPY src ./src

# 打包项目（跳过测试）
RUN mvn clean package -DskipTests

# 第二阶段：运行阶段
FROM eclipse-temurin:17-jre-alpine

# 安装时区数据（可选）
RUN apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    apk del tzdata

# 创建非 root 用户（安全最佳实践）
RUN addgroup -g 1000 appgroup && \
    adduser -D -u 1000 -G appgroup appuser

# 设置工作目录
WORKDIR /app

# 从构建阶段复制 jar 文件
COPY --from=builder /build/target/*.jar app.jar

# 修改文件所有者
RUN chown -R appuser:appgroup /app

# 切换到非 root 用户
USER appuser

# 暴露端口
EXPOSE 8080

# 健康检查
HEALTHCHECK --interval=30s --timeout=3s --start-period=40s --retries=3 \
    CMD wget --quiet --tries=1 --spider http://localhost:8080/actuator/health || exit 1

# 启动命令
ENTRYPOINT ["java", \
    "-Djava.security.egd=file:/dev/./urandom", \
    "-XX:+UseContainerSupport", \
    "-XX:MaxRAMPercentage=75.0", \
    "-jar", \
    "app.jar"]
```

**Dockerfile 详解：**

| 指令 | 说明 |
|-----|------|
| `FROM` | 指定基础镜像 |
| `WORKDIR` | 设置工作目录 |
| `COPY` | 复制文件到镜像 |
| `RUN` | 执行命令 |
| `EXPOSE` | 声明端口（仅文档作用） |
| `USER` | 切换用户 |
| `ENTRYPOINT` | 容器启动命令 |
| `HEALTHCHECK` | 健康检查 |

**JVM 参数说明：**
- `-Djava.security.egd=file:/dev/./urandom`：加快启动速度
- `-XX:+UseContainerSupport`：识别容器内存限制
- `-XX:MaxRAMPercentage=75.0`：JVM 最多使用容器 75% 的内存

### 13.2.3 优化的 Dockerfile（分层缓存）

利用 Docker 缓存机制，先复制 pom.xml 下载依赖，再复制源码：

```dockerfile
# 构建阶段
FROM maven:3.9-eclipse-temurin-17 AS builder

WORKDIR /build

# 先复制 pom.xml，利用 Docker 缓存（依赖不变时不重新下载）
COPY pom.xml .
RUN mvn dependency:go-offline -B

# 再复制源码并打包
COPY src ./src
RUN mvn clean package -DskipTests -B

# 运行阶段（同上）
FROM eclipse-temurin:17-jre-alpine

RUN apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    apk del tzdata

RUN addgroup -g 1000 appgroup && \
    adduser -D -u 1000 -G appgroup appuser

WORKDIR /app

COPY --from=builder /build/target/*.jar app.jar

RUN chown -R appuser:appgroup /app

USER appuser

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-period=40s --retries=3 \
    CMD wget --quiet --tries=1 --spider http://localhost:8080/actuator/health || exit 1

ENTRYPOINT ["java", \
    "-Djava.security.egd=file:/dev/./urandom", \
    "-XX:+UseContainerSupport", \
    "-XX:MaxRAMPercentage=75.0", \
    "-jar", \
    "app.jar"]
```

### 13.2.4 创建 .dockerignore 文件

排除不需要复制到镜像的文件：

```
# .dockerignore
target/
.mvn/
*.iml
.idea/
.vscode/
*.log
.git/
.gitignore
README.md
```

## 13.3 构建镜像与运行容器

### 13.3.1 构建 Docker 镜像

```bash
# 构建镜像（指定标签）
docker build -t myapp:1.0.0 .

# 构建镜像（指定 Dockerfile）
docker build -f Dockerfile -t myapp:1.0.0 .

# 构建镜像（不使用缓存）
docker build --no-cache -t myapp:1.0.0 .

# 查看镜像
docker images | grep myapp
```

**输出示例：**
```
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
myapp        1.0.0     abc123def456   10 seconds ago   250MB
```

### 13.3.2 运行 Docker 容器

```bash
# 运行容器（前台）
docker run --rm -p 8080:8080 myapp:1.0.0

# 运行容器（后台）
docker run -d \
  --name myapp \
  -p 8080:8080 \
  myapp:1.0.0

# 运行容器（指定环境变量）
docker run -d \
  --name myapp \
  -p 8080:8080 \
  -e SPRING_PROFILES_ACTIVE=prod \
  -e SPRING_DATASOURCE_URL=jdbc:mysql://mysql:3306/mydb \
  -e SPRING_DATASOURCE_USERNAME=root \
  -e SPRING_DATASOURCE_PASSWORD=123456 \
  myapp:1.0.0

# 运行容器（挂载配置文件）
docker run -d \
  --name myapp \
  -p 8080:8080 \
  -v /path/to/application.yml:/app/config/application.yml \
  myapp:1.0.0

# 运行容器（限制资源）
docker run -d \
  --name myapp \
  -p 8080:8080 \
  --memory="512m" \
  --cpus="1.0" \
  myapp:1.0.0
```

### 13.3.3 常用 Docker 命令

```bash
# 查看运行中的容器
docker ps

# 查看所有容器（包括停止的）
docker ps -a

# 查看容器日志
docker logs myapp

# 实时查看日志
docker logs -f myapp

# 查看最近100行日志
docker logs --tail 100 myapp

# 进入容器
docker exec -it myapp sh

# 停止容器
docker stop myapp

# 启动容器
docker start myapp

# 重启容器
docker restart myapp

# 删除容器
docker rm myapp

# 强制删除运行中的容器
docker rm -f myapp

# 查看容器详细信息
docker inspect myapp

# 查看容器资源使用情况
docker stats myapp
```

## 13.4 Docker Compose 多容器编排

### 13.4.1 为什么使用 Docker Compose？

**不使用 Compose 的问题：**
```bash
# 需要手动启动多个容器
docker run -d --name mysql ...
docker run -d --name redis ...
docker run -d --name myapp ...

# 需要手动配置网络和依赖关系
docker network create mynetwork
docker run --network mynetwork ...
```

**使用 Compose 的优势：**
- 一次性启动所有服务
- 自动创建网络，服务间可通过名称互相访问
- 管理服务依赖关系
- 统一配置环境变量、端口、卷等

### 13.4.2 完整的 docker-compose.yml

```yaml
version: '3.8'

services:
  # MySQL 数据库
  mysql:
    image: mysql:8.0
    container_name: myapp-mysql
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: root123
      MYSQL_DATABASE: mydb
      MYSQL_USER: myuser
      MYSQL_PASSWORD: mypass
      TZ: Asia/Shanghai
    ports:
      - "3306:3306"
    volumes:
      # 数据持久化
      - mysql-data:/var/lib/mysql
      # 初始化脚本
      - ./sql:/docker-entrypoint-initdb.d
    command:
      - --character-set-server=utf8mb4
      - --collation-server=utf8mb4_unicode_ci
      - --default-authentication-plugin=mysql_native_password
    networks:
      - myapp-network
    healthcheck:
      test: ["CMD", "mysqladmin", "ping", "-h", "localhost", "-u", "root", "-p$$MYSQL_ROOT_PASSWORD"]
      interval: 10s
      timeout: 5s
      retries: 5

  # Redis 缓存
  redis:
    image: redis:7-alpine
    container_name: myapp-redis
    restart: always
    command: redis-server --appendonly yes --requirepass redis123
    ports:
      - "6379:6379"
    volumes:
      - redis-data:/data
    networks:
      - myapp-network
    healthcheck:
      test: ["CMD", "redis-cli", "--raw", "incr", "ping"]
      interval: 10s
      timeout: 3s
      retries: 5

  # Spring Boot 应用
  app:
    build:
      context: .
      dockerfile: Dockerfile
    image: myapp:1.0.0
    container_name: myapp
    restart: always
    depends_on:
      mysql:
        condition: service_healthy
      redis:
        condition: service_healthy
    environment:
      SPRING_PROFILES_ACTIVE: prod
      SPRING_DATASOURCE_URL: jdbc:mysql://mysql:3306/mydb?useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Shanghai
      SPRING_DATASOURCE_USERNAME: myuser
      SPRING_DATASOURCE_PASSWORD: mypass
      SPRING_REDIS_HOST: redis
      SPRING_REDIS_PORT: 6379
      SPRING_REDIS_PASSWORD: redis123
      TZ: Asia/Shanghai
    ports:
      - "8080:8080"
    volumes:
      # 日志持久化
      - ./logs:/app/logs
    networks:
      - myapp-network
    healthcheck:
      test: ["CMD", "wget", "--quiet", "--tries=1", "--spider", "http://localhost:8080/actuator/health"]
      interval: 30s
      timeout: 10s
      retries: 3
      start_period: 40s

# 网络配置
networks:
  myapp-network:
    driver: bridge

# 卷配置（数据持久化）
volumes:
  mysql-data:
  redis-data:
```

**docker-compose.yml 详解：**

| 字段 | 说明 |
|-----|------|
| `version` | Compose 文件格式版本 |
| `services` | 定义服务列表 |
| `image` | 使用的镜像 |
| `build` | 构建镜像配置 |
| `container_name` | 容器名称 |
| `restart` | 重启策略（always/on-failure/unless-stopped） |
| `depends_on` | 服务依赖关系 |
| `environment` | 环境变量 |
| `ports` | 端口映射（宿主机:容器） |
| `volumes` | 卷挂载 |
| `networks` | 网络配置 |
| `healthcheck` | 健康检查 |
| `command` | 容器启动命令 |

### 13.4.3 Docker Compose 命令

```bash
# 启动所有服务（前台）
docker-compose up

# 启动所有服务（后台）
docker-compose up -d

# 启动并重新构建镜像
docker-compose up -d --build

# 查看运行中的服务
docker-compose ps

# 查看服务日志
docker-compose logs

# 实时查看日志
docker-compose logs -f

# 查看指定服务日志
docker-compose logs -f app

# 停止所有服务
docker-compose stop

# 停止并删除所有容器
docker-compose down

# 停止并删除容器、网络、卷
docker-compose down -v

# 重启服务
docker-compose restart

# 重启指定服务
docker-compose restart app

# 进入服务容器
docker-compose exec app sh

# 查看服务状态
docker-compose ps
```

### 13.4.4 初始化 SQL 脚本

创建 `sql/init.sql` 文件，MySQL 容器启动时会自动执行：

```sql
-- sql/init.sql

-- 创建数据库（如果不存在）
CREATE DATABASE IF NOT EXISTS mydb CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE mydb;

-- 创建用户表
CREATE TABLE IF NOT EXISTS users (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE COMMENT '用户名',
    password VARCHAR(255) NOT NULL COMMENT '密码',
    email VARCHAR(100) COMMENT '邮箱',
    phone VARCHAR(20) COMMENT '手机号',
    status INT DEFAULT 1 COMMENT '状态：1-正常，0-禁用',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- 插入测试数据
INSERT INTO users (username, password, email, phone) VALUES
('admin', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iY3g9b6i', 'admin@example.com', '13800138000'),
('user1', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iY3g9b6i', 'user1@example.com', '13800138001');
```

## 13.5 Windows 环境注意事项

### 13.5.1 路径问题

**Windows 路径格式：**
```yaml
# ❌ 错误：Windows 路径
volumes:
  - C:\Users\myuser\project:/app

# ✅ 正确：使用正斜杠
volumes:
  - C:/Users/myuser/project:/app

# ✅ 或使用相对路径
volumes:
  - ./logs:/app/logs
```

### 13.5.2 行尾符问题

Windows 和 Linux 的行尾符不同：
- Windows：`CRLF` (\r\n)
- Linux：`LF` (\n)

**解决方法：**

```bash
# 配置 Git 自动转换
git config --global core.autocrlf true

# 或在项目中添加 .gitattributes
*.sh text eol=lf
```

### 13.5.3 WSL2 内存限制

Docker Desktop 使用 WSL2，默认会占用大量内存。创建 `.wslconfig` 文件限制：

```ini
# C:\Users\你的用户名\.wslconfig
[wsl2]
memory=4GB
processors=2
swap=2GB
```

### 13.5.4 Docker Desktop 配置

**资源限制：**
- 打开 Docker Desktop
- Settings → Resources → Advanced
- 设置 CPU、内存、磁盘大小

**镜像加速（中国大陆）：**
- Settings → Docker Engine
- 添加镜像源：

```json
{
  "registry-mirrors": [
    "https://docker.mirrors.ustc.edu.cn",
    "https://mirror.ccs.tencentyun.com"
  ]
}
```

## 13.6 云服务器部署实战

### 13.6.1 服务器准备

**购买服务器（阿里云/腾讯云）：**
- 系统：Ubuntu 20.04 / CentOS 7
- 配置：2核4G（最低配置）
- 网络：开放 22（SSH）、80（HTTP）、8080 端口

**连接服务器：**
```bash
# Windows 使用 PowerShell 或 PuTTY
ssh root@your_server_ip

# 输入密码
```

### 13.6.2 安装 Docker 和 Docker Compose

**Ubuntu/Debian:**
```bash
# 更新包列表
sudo apt update

# 安装依赖
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# 添加 Docker 官方 GPG 密钥
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# 添加 Docker 仓库
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 安装 Docker
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# 启动 Docker
sudo systemctl start docker
sudo systemctl enable docker

# 验证安装
docker --version
docker compose version
```

**CentOS:**
```bash
# 安装依赖
sudo yum install -y yum-utils

# 添加 Docker 仓库
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# 安装 Docker
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# 启动 Docker
sudo systemctl start docker
sudo systemctl enable docker

# 验证安装
docker --version
docker compose version
```

### 13.6.3 上传项目到服务器

**方式1：使用 Git（推荐）**
```bash
# 在服务器上克隆项目
cd /opt
git clone https://github.com/your-username/your-project.git
cd your-project
```

**方式2：使用 SCP 上传**
```bash
# 在本地执行（Windows PowerShell）
scp -r C:\path\to\project root@your_server_ip:/opt/
```

**方式3：使用 FTP 工具**
- 使用 FileZilla、WinSCP 等工具上传

### 13.6.4 部署应用

```bash
# 进入项目目录
cd /opt/your-project

# 创建必要的目录
mkdir -p logs sql

# 编辑 docker-compose.yml（如果需要）
vi docker-compose.yml

# 启动服务（后台运行）
docker compose up -d

# 查看服务状态
docker compose ps

# 查看日志
docker compose logs -f

# 等待服务启动（约 30-60 秒）
```

### 13.6.5 验证部署

```bash
# 在服务器上测试
curl http://localhost:8080/actuator/health

# 在本地浏览器访问
http://your_server_ip:8080
```

### 13.6.6 配置 Nginx 反向代理（可选）

**安装 Nginx：**
```bash
sudo apt install -y nginx
```

**配置反向代理：**
```nginx
# /etc/nginx/sites-available/myapp
server {
    listen 80;
    server_name your_domain.com;  # 替换为你的域名

    location / {
        proxy_pass http://localhost:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

**启用配置：**
```bash
# 创建软链接
sudo ln -s /etc/nginx/sites-available/myapp /etc/nginx/sites-enabled/

# 测试配置
sudo nginx -t

# 重启 Nginx
sudo systemctl restart nginx
```

**配置 HTTPS（使用 Let's Encrypt）：**
```bash
# 安装 Certbot
sudo apt install -y certbot python3-certbot-nginx

# 获取证书
sudo certbot --nginx -d your_domain.com

# 自动续期
sudo systemctl enable certbot.timer
```

### 13.6.7 服务器维护命令

```bash
# 查看 Docker 容器
docker ps

# 查看应用日志
docker compose logs -f app

# 重启应用
docker compose restart app

# 更新应用（拉取最新代码并重新构建）
git pull
docker compose up -d --build

# 备份数据库
docker exec myapp-mysql mysqldump -u root -proot123 mydb > backup.sql

# 恢复数据库
docker exec -i myapp-mysql mysql -u root -proot123 mydb < backup.sql

# 清理 Docker 资源
docker system prune -a --volumes
```

## 13.7 本章小结

本章介绍了 Spring Boot 项目的 Docker 化和部署：

✅ **Maven 打包**：生成可执行 fat jar
✅ **Dockerfile 编写**：多阶段构建、安全优化、健康检查
✅ **Docker 镜像构建**：docker build 命令、.dockerignore
✅ **Docker 容器运行**：docker run 命令、环境变量、资源限制
✅ **Docker Compose**：多容器编排、MySQL + Redis + App
✅ **云服务器部署**：安装 Docker、上传项目、启动服务、Nginx 反向代理

**关键要点：**

- 使用多阶段构建减小镜像体积
- 使用非 root 用户运行容器提高安全性
- 使用健康检查确保服务可用
- 使用 Docker Compose 简化多容器管理
- 数据库和 Redis 数据要持久化（volumes）
- 生产环境使用 Nginx 反向代理和 HTTPS

**最佳实践：**

1. 镜像标签使用版本号，不要只用 latest
2. 敏感信息（密码）使用环境变量或 Docker secrets
3. 日志和数据要持久化到宿主机
4. 定期备份数据库
5. 使用 docker system prune 清理无用资源

**下一章预告：**
在下一章中，我们将学习测试与调试，包括单元测试、集成测试、MockK 框架、Cursor 调试技巧等内容。

---

# 第14章：测试与调试（Kotlin 实战）

本章将介绍如何在 Kotlin + Spring Boot 项目中编写测试和使用 Cursor 进行调试。

## 14.1 测试框架概述

### 14.1.1 Spring Boot 测试依赖

```xml
<!-- pom.xml -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-test</artifactId>
    <scope>test</scope>
</dependency>

<!-- MockK（Kotlin Mock 框架） -->
<dependency>
    <groupId>io.mockk</groupId>
    <artifactId>mockk-jvm</artifactId>
    <version>1.13.8</version>
    <scope>test</scope>
</dependency>

<!-- Spring MockK（Spring 集成） -->
<dependency>
    <groupId>com.ninja-squad</groupId>
    <artifactId>springmockk</artifactId>
    <version>4.0.2</version>
    <scope>test</scope>
</dependency>
```

**spring-boot-starter-test 包含：**
- JUnit 5（Jupiter）：测试框架
- AssertJ：断言库
- Mockito：Mock 框架（Java）
- Spring Test：Spring 测试支持
- JSONassert：JSON 断言
- JsonPath：JSON 路径表达式

### 14.1.2 测试类型

| 测试类型 | 说明 | 注解 | 特点 |
|---------|------|------|------|
| **单元测试** | 测试单个类或方法 | 无需 Spring 注解 | 快速、隔离 |
| **集成测试** | 测试多个组件协作 | `@SpringBootTest` | 完整 Spring 上下文 |
| **切片测试** | 测试特定层 | `@WebMvcTest`、`@DataJpaTest` | 只加载部分组件 |
| **Repository 测试** | 测试数据访问层 | `@MybatisTest` | 内存数据库 |

## 14.2 单元测试（Unit Test）

### 14.2.1 基础单元测试

```kotlin
package com.example.demo.service

import io.mockk.every
import io.mockk.mockk
import io.mockk.verify
import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.assertThrows

/**
 * 用户服务单元测试
 * 
 * JUnit 5 常用注解：
 * - @Test：测试方法
 * - @BeforeEach：每个测试前执行
 * - @AfterEach：每个测试后执行
 * - @BeforeAll：所有测试前执行一次（需要 companion object）
 * - @AfterAll：所有测试后执行一次（需要 companion object）
 * - @DisplayName：测试方法显示名称
 * - @Disabled：禁用测试
 */
@DisplayName("用户服务单元测试")
class UserServiceTest {
    
    // 被测试的对象
    private lateinit var userService: UserService
    
    // Mock 对象
    private lateinit var userMapper: UserMapper
    private lateinit var passwordEncoder: PasswordEncoder
    
    /**
     * 每个测试前初始化
     */
    @BeforeEach
    fun setUp() {
        // 创建 Mock 对象
        userMapper = mockk()
        passwordEncoder = mockk()
        
        // 创建被测试对象（注入 Mock）
        userService = UserService(userMapper, passwordEncoder)
    }
    
    /**
     * 测试创建用户成功
     */
    @Test
    @DisplayName("创建用户 - 成功")
    fun `should create user successfully`() {
        // 1. 准备测试数据
        val username = "testuser"
        val password = "password123"
        val email = "test@example.com"
        
        // 2. 配置 Mock 行为
        every { userMapper.existsByUsername(username) } returns false
        every { passwordEncoder.encode(password) } returns "encrypted_password"
        every { userMapper.insert(any()) } returns 1
        
        // 3. 执行测试
        val user = userService.createUser(username, password, email)
        
        // 4. 验证结果
        assertNotNull(user)
        assertEquals(username, user.username)
        assertEquals("encrypted_password", user.password)
        assertEquals(email, user.email)
        
        // 5. 验证 Mock 调用
        verify(exactly = 1) { userMapper.existsByUsername(username) }
        verify(exactly = 1) { passwordEncoder.encode(password) }
        verify(exactly = 1) { userMapper.insert(any()) }
    }
    
    /**
     * 测试创建用户失败（用户名已存在）
     */
    @Test
    @DisplayName("创建用户 - 用户名已存在")
    fun `should throw exception when username exists`() {
        // 准备测试数据
        val username = "existinguser"
        
        // 配置 Mock 行为
        every { userMapper.existsByUsername(username) } returns true
        
        // 验证抛出异常
        val exception = assertThrows<ConflictException> {
            userService.createUser(username, "password", "email@example.com")
        }
        
        assertEquals("用户名已存在", exception.message)
        
        // 验证 Mock 调用
        verify(exactly = 1) { userMapper.existsByUsername(username) }
        verify(exactly = 0) { passwordEncoder.encode(any()) }
        verify(exactly = 0) { userMapper.insert(any()) }
    }
    
    /**
     * 测试查询用户
     */
    @Test
    @DisplayName("查询用户 - 成功")
    fun `should get user by id`() {
        // 准备测试数据
        val userId = 1L
        val mockUser = User(
            id = userId,
            username = "testuser",
            password = "encrypted_password",
            email = "test@example.com"
        )
        
        // 配置 Mock 行为
        every { userMapper.findById(userId) } returns mockUser
        
        // 执行测试
        val user = userService.getUserById(userId)
        
        // 验证结果
        assertNotNull(user)
        assertEquals(userId, user?.id)
        assertEquals("testuser", user?.username)
        
        // 验证 Mock 调用
        verify { userMapper.findById(userId) }
    }
    
    /**
     * 测试查询用户（不存在）
     */
    @Test
    @DisplayName("查询用户 - 用户不存在")
    fun `should return null when user not found`() {
        // 准备测试数据
        val userId = 999L
        
        // 配置 Mock 行为
        every { userMapper.findById(userId) } returns null
        
        // 执行测试
        val user = userService.getUserById(userId)
        
        // 验证结果
        assertNull(user)
    }
}
```

### 14.2.2 MockK 常用语法

```kotlin
import io.mockk.*

/**
 * MockK 使用指南
 */
class MockKExamples {
    
    /**
     * 1. 创建 Mock 对象
     */
    @Test
    fun mockExample() {
        // 创建 Mock
        val userMapper = mockk<UserMapper>()
        
        // 创建 relaxed mock（所有方法返回默认值）
        val relaxedMock = mockk<UserMapper>(relaxed = true)
        
        // 创建 Spy（部分 Mock，其他方法调用真实实现）
        val realService = UserService(userMapper, passwordEncoder)
        val spyService = spyk(realService)
    }
    
    /**
     * 2. 配置 Mock 行为
     */
    @Test
    fun mockBehavior() {
        val userMapper = mockk<UserMapper>()
        
        // 返回固定值
        every { userMapper.findById(1) } returns User(id = 1, username = "test")
        
        // 返回不同值（多次调用）
        every { userMapper.findById(1) } returnsMany listOf(
            User(id = 1, username = "test1"),
            User(id = 1, username = "test2")
        )
        
        // 抛出异常
        every { userMapper.findById(-1) } throws IllegalArgumentException("Invalid ID")
        
        // 根据参数返回不同值
        every { userMapper.findById(any()) } answers {
            val id = firstArg<Long>()
            if (id > 0) User(id = id, username = "user$id") else null
        }
        
        // 匹配任意参数
        every { userMapper.findById(any()) } returns mockUser
        
        // 匹配特定类型参数
        every { userMapper.insert(ofType<User>()) } returns 1
        
        // 捕获参数
        val slot = slot<User>()
        every { userMapper.insert(capture(slot)) } returns 1
        
        userMapper.insert(User(username = "test"))
        assertEquals("test", slot.captured.username)
    }
    
    /**
     * 3. 验证 Mock 调用
     */
    @Test
    fun verifyExample() {
        val userMapper = mockk<UserMapper>(relaxed = true)
        
        // 调用方法
        userMapper.findById(1)
        userMapper.findById(2)
        
        // 验证调用次数
        verify(exactly = 1) { userMapper.findById(1) }
        verify(exactly = 2) { userMapper.findById(any()) }
        verify(atLeast = 1) { userMapper.findById(any()) }
        verify(atMost = 3) { userMapper.findById(any()) }
        
        // 验证调用顺序
        verifyOrder {
            userMapper.findById(1)
            userMapper.findById(2)
        }
        
        // 验证未调用
        verify(exactly = 0) { userMapper.deleteById(any()) }
        
        // 验证所有方法都已验证
        confirmVerified(userMapper)
    }
    
    /**
     * 4. Mock 静态方法和扩展函数
     */
    @Test
    fun mockStatic() {
        // Mock 对象方法
        mockkObject(MyObject)
        every { MyObject.staticMethod() } returns "mocked"
        
        // 清除 Mock
        unmockkObject(MyObject)
    }
}
```

## 14.3 集成测试（Integration Test）

### 14.3.1 完整集成测试

```kotlin
package com.example.demo.controller

import com.example.demo.dto.CreateUserRequest
import com.example.demo.dto.ApiResponse
import com.fasterxml.jackson.databind.ObjectMapper
import com.ninjasquad.springmockk.MockkBean
import io.mockk.every
import io.mockk.verify
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.DisplayName
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.http.MediaType
import org.springframework.test.web.servlet.MockMvc
import org.springframework.test.web.servlet.get
import org.springframework.test.web.servlet.post
import org.springframework.test.web.servlet.result.MockMvcResultMatchers.*

/**
 * 用户控制器集成测试
 * 
 * @SpringBootTest：启动完整的 Spring 应用上下文
 * @AutoConfigureMockMvc：自动配置 MockMvc
 * @MockkBean：在 Spring 上下文中创建 MockK Mock Bean
 */
@SpringBootTest
@AutoConfigureMockMvc
@DisplayName("用户控制器集成测试")
class UserControllerIntegrationTest {
    
    @Autowired
    private lateinit var mockMvc: MockMvc
    
    @Autowired
    private lateinit var objectMapper: ObjectMapper
    
    @MockkBean
    private lateinit var userService: UserService
    
    /**
     * 测试创建用户接口
     */
    @Test
    @DisplayName("POST /users - 创建用户成功")
    fun `should create user successfully`() {
        // 准备测试数据
        val request = CreateUserRequest(
            username = "testuser",
            password = "password123",
            email = "test@example.com"
        )
        
        val mockUser = User(
            id = 1,
            username = "testuser",
            email = "test@example.com"
        )
        
        // 配置 Mock
        every { userService.createUser(any()) } returns mockUser
        
        // 执行测试
        mockMvc.post("/users") {
            contentType = MediaType.APPLICATION_JSON
            content = objectMapper.writeValueAsString(request)
        }.andExpect {
            status { isOk() }
            jsonPath("$.code") { value(200) }
            jsonPath("$.data.id") { value(1) }
            jsonPath("$.data.username") { value("testuser") }
            jsonPath("$.data.email") { value("test@example.com") }
        }
        
        // 验证 Mock 调用
        verify(exactly = 1) { userService.createUser(any()) }
    }
    
    /**
     * 测试创建用户失败（参数验证）
     */
    @Test
    @DisplayName("POST /users - 参数验证失败")
    fun `should return 400 when validation fails`() {
        // 准备无效数据
        val request = CreateUserRequest(
            username = "",  // 用户名为空
            password = "123",  // 密码太短
            email = "invalid-email"  // 邮箱格式错误
        )
        
        // 执行测试
        mockMvc.post("/users") {
            contentType = MediaType.APPLICATION_JSON
            content = objectMapper.writeValueAsString(request)
        }.andExpect {
            status { isBadRequest() }
            jsonPath("$.code") { value(400) }
            jsonPath("$.message") { exists() }
        }
    }
    
    /**
     * 测试查询用户接口
     */
    @Test
    @DisplayName("GET /users/{id} - 查询用户成功")
    fun `should get user by id`() {
        // 准备测试数据
        val userId = 1L
        val mockUser = User(
            id = userId,
            username = "testuser",
            email = "test@example.com"
        )
        
        // 配置 Mock
        every { userService.getUserById(userId) } returns mockUser
        
        // 执行测试
        mockMvc.get("/users/$userId")
            .andExpect {
                status { isOk() }
                jsonPath("$.code") { value(200) }
                jsonPath("$.data.id") { value(userId) }
                jsonPath("$.data.username") { value("testuser") }
            }
    }
    
    /**
     * 测试查询用户（不存在）
     */
    @Test
    @DisplayName("GET /users/{id} - 用户不存在")
    fun `should return 404 when user not found`() {
        // 准备测试数据
        val userId = 999L
        
        // 配置 Mock
        every { userService.getUserById(userId) } throws NotFoundException("用户不存在")
        
        // 执行测试
        mockMvc.get("/users/$userId")
            .andExpect {
                status { isNotFound() }
                jsonPath("$.code") { value(404) }
                jsonPath("$.message") { value("用户不存在") }
            }
    }
}
```

### 14.3.2 WebMvcTest（控制器切片测试）

```kotlin
package com.example.demo.controller

import com.ninjasquad.springmockk.MockkBean
import io.mockk.every
import org.junit.jupiter.api.Test
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest
import org.springframework.test.web.servlet.MockMvc
import org.springframework.test.web.servlet.get

/**
 * 用户控制器切片测试
 * 
 * @WebMvcTest：只加载 Web 层组件
 * - 加载：Controller、ControllerAdvice、Filter、WebMvcConfigurer
 * - 不加载：Service、Repository、Component
 * - 更快，适合单纯测试 Controller
 */
@WebMvcTest(UserController::class)
class UserControllerTest {
    
    @Autowired
    private lateinit var mockMvc: MockMvc
    
    @MockkBean
    private lateinit var userService: UserService
    
    @Test
    fun `should get user by id`() {
        // 准备测试数据
        val mockUser = User(id = 1, username = "test")
        
        // 配置 Mock
        every { userService.getUserById(1) } returns mockUser
        
        // 执行测试
        mockMvc.get("/users/1")
            .andExpect {
                status { isOk() }
                jsonPath("$.data.username") { value("test") }
            }
    }
}
```

### 14.3.3 Repository 测试（MyBatis）

```kotlin
package com.example.demo.mapper

import org.junit.jupiter.api.Test
import org.junit.jupiter.api.Assertions.*
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase
import org.springframework.test.context.jdbc.Sql

/**
 * UserMapper 测试
 * 
 * @MybatisTest：MyBatis 切片测试
 * - 自动配置 MyBatis 和内存数据库（H2）
 * - 只加载 Mapper 组件
 * 
 * @AutoConfigureTestDatabase：使用真实数据库（而非内存数据库）
 * @Sql：执行 SQL 脚本初始化数据
 */
@MybatisTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
@Sql("/test-data.sql")  // 初始化测试数据
class UserMapperTest {
    
    @Autowired
    private lateinit var userMapper: UserMapper
    
    @Test
    fun `should find user by id`() {
        // 执行查询
        val user = userMapper.findById(1)
        
        // 验证结果
        assertNotNull(user)
        assertEquals(1, user?.id)
        assertEquals("testuser", user?.username)
    }
    
    @Test
    fun `should insert user`() {
        // 准备数据
        val user = User(
            username = "newuser",
            password = "password",
            email = "new@example.com"
        )
        
        // 插入数据
        val result = userMapper.insert(user)
        
        // 验证结果
        assertEquals(1, result)
        assertNotNull(user.id)
        
        // 验证插入成功
        val savedUser = userMapper.findById(user.id!!)
        assertNotNull(savedUser)
        assertEquals("newuser", savedUser?.username)
    }
    
    @Test
    fun `should update user`() {
        // 查询现有用户
        val user = userMapper.findById(1)
        assertNotNull(user)
        
        // 更新用户
        user!!.email = "updated@example.com"
        val result = userMapper.update(user)
        
        // 验证更新成功
        assertEquals(1, result)
        
        val updatedUser = userMapper.findById(1)
        assertEquals("updated@example.com", updatedUser?.email)
    }
    
    @Test
    fun `should delete user`() {
        // 删除用户
        val result = userMapper.deleteById(1)
        
        // 验证删除成功
        assertEquals(1, result)
        
        val deletedUser = userMapper.findById(1)
        assertNull(deletedUser)
    }
}
```

**测试数据脚本（src/test/resources/test-data.sql）：**
```sql
-- test-data.sql
INSERT INTO users (id, username, password, email, status, created_at, updated_at) VALUES
(1, 'testuser', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iY3g9b6i', 'test@example.com', 1, NOW(), NOW()),
(2, 'testuser2', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iY3g9b6i', 'test2@example.com', 1, NOW(), NOW());
```

## 14.4 测试最佳实践

### 14.4.1 使用测试配置

```kotlin
package com.example.demo.config

import org.springframework.boot.test.context.TestConfiguration
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Primary

/**
 * 测试配置类
 * 
 * @TestConfiguration：测试专用配置
 * @Primary：优先使用测试配置
 */
@TestConfiguration
class TestConfig {
    
    /**
     * 测试环境的 Redis 配置（使用内存实现）
     */
    @Bean
    @Primary
    fun testRedisTemplate(): RedisTemplate<String, Any> {
        // 返回内存实现，避免依赖真实 Redis
        return InMemoryRedisTemplate()
    }
}
```

### 14.4.2 使用测试工厂

```kotlin
package com.example.demo.factory

/**
 * 测试数据工厂
 * 
 * 统一管理测试数据的创建
 */
object TestDataFactory {
    
    fun createUser(
        id: Long? = null,
        username: String = "testuser",
        password: String = "password123",
        email: String = "test@example.com",
        status: Int = 1
    ): User {
        return User(
            id = id,
            username = username,
            password = password,
            email = email,
            status = status
        )
    }
    
    fun createUserRequest(
        username: String = "testuser",
        password: String = "password123",
        email: String = "test@example.com"
    ): CreateUserRequest {
        return CreateUserRequest(
            username = username,
            password = password,
            email = email
        )
    }
}
```

### 14.4.3 参数化测试

```kotlin
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.CsvSource
import org.junit.jupiter.params.provider.ValueSource
import org.junit.jupiter.params.provider.MethodSource

class ParameterizedTests {
    
    /**
     * 使用 @ValueSource 提供参数
     */
    @ParameterizedTest
    @ValueSource(strings = ["user1", "user2", "user3"])
    fun `should validate username`(username: String) {
        assertTrue(username.length >= 3)
    }
    
    /**
     * 使用 @CsvSource 提供多个参数
     */
    @ParameterizedTest
    @CsvSource(
        "user1, password1, true",
        "user2, password2, true",
        "invalid, 123, false"
    )
    fun `should validate user credentials`(
        username: String,
        password: String,
        expected: Boolean
    ) {
        val result = validateCredentials(username, password)
        assertEquals(expected, result)
    }
    
    /**
     * 使用 @MethodSource 提供复杂参数
     */
    @ParameterizedTest
    @MethodSource("userProvider")
    fun `should create user`(user: User) {
        assertNotNull(user.username)
        assertTrue(user.username.length >= 3)
    }
    
    companion object {
        @JvmStatic
        fun userProvider() = listOf(
            User(username = "user1", password = "pass1"),
            User(username = "user2", password = "pass2"),
            User(username = "user3", password = "pass3")
        )
    }
}
```

## 14.5 Cursor 调试技巧

### 14.5.1 基本调试操作

**1. 设置断点：**
- 在代码行号左侧点击，设置断点（红色圆点）
- 条件断点：右键断点 → Edit Breakpoint → 设置条件

**2. 启动调试：**
- 点击 Run → Debug（或按 F5）
- 选择 Spring Boot Application

**3. 调试控制：**
- **F5 / Continue**：继续执行到下一个断点
- **F10 / Step Over**：单步执行（不进入方法内部）
- **F11 / Step Into**：单步进入（进入方法内部）
- **Shift + F11 / Step Out**：跳出当前方法
- **Shift + F5 / Stop**：停止调试

### 14.5.2 调试面板功能

**Variables（变量）：**
- 查看当前作用域的所有变量
- 修改变量值（右键 → Set Value）

**Watch（监视）：**
- 添加表达式监视
- 实时查看表达式值

**Call Stack（调用栈）：**
- 查看方法调用链
- 点击跳转到对应代码

**Breakpoints（断点管理）：**
- 查看所有断点
- 启用/禁用断点
- 设置条件断点

### 14.5.3 条件断点示例

```kotlin
@GetMapping("/users/{id}")
fun getUser(@PathVariable id: Long): User {
    // 设置条件断点：只在 id > 100 时暂停
    // 右键断点 → Edit Breakpoint
    // Condition: id > 100
    
    val user = userService.getUserById(id)
    return user ?: throw NotFoundException("用户不存在")
}
```

### 14.5.4 日志点（Logpoint）

不中断执行，只输出日志：
- 右键代码行号 → Add Logpoint
- 输入日志消息：`User ID: {id}, Username: {user.username}`

### 14.5.5 远程调试

**1. 配置应用启动参数：**
```bash
java -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005 -jar app.jar
```

**2. Cursor 配置远程调试：**
- Run → Add Configuration
- 选择 Remote JVM Debug
- 配置 Host 和 Port（5005）

**3. 启动调试：**
- 点击 Debug 按钮连接远程应用

## 14.6 测试覆盖率

### 14.6.1 JaCoCo 配置

```xml
<!-- pom.xml -->
<build>
    <plugins>
        <plugin>
            <groupId>org.jacoco</groupId>
            <artifactId>jacoco-maven-plugin</artifactId>
            <version>0.8.11</version>
            <executions>
                <execution>
                    <goals>
                        <goal>prepare-agent</goal>
                    </goals>
                </execution>
                <execution>
                    <id>report</id>
                    <phase>test</phase>
                    <goals>
                        <goal>report</goal>
                    </goals>
                </execution>
            </executions>
        </plugin>
    </plugins>
</build>
```

**生成覆盖率报告：**
```bash
mvn clean test
mvn jacoco:report

# 报告位置：target/site/jacoco/index.html
```

### 14.6.2 覆盖率最佳实践

**覆盖率目标：**
- 单元测试：80% 以上
- 集成测试：60% 以上
- 总体覆盖率：70% 以上

**不追求 100% 覆盖率：**
- 配置类、常量类可以不测试
- Getter/Setter 可以不测试
- 简单的工具方法可以不测试

## 14.7 本章小结

本章介绍了 Kotlin + Spring Boot 的测试与调试：

✅ **单元测试**：MockK 框架、Mock 对象、验证调用
✅ **集成测试**：@SpringBootTest、MockMvc、切片测试
✅ **Repository 测试**：@MybatisTest、H2 内存数据库
✅ **测试最佳实践**：测试配置、测试工厂、参数化测试
✅ **Cursor 调试**：断点、单步执行、条件断点、远程调试
✅ **测试覆盖率**：JaCoCo 配置、覆盖率报告

**关键要点：**

- 使用 MockK 代替 Mockito（Kotlin 友好）
- 单元测试使用 Mock，集成测试使用真实环境
- 切片测试（@WebMvcTest、@MybatisTest）比完整测试快
- 使用测试工厂统一管理测试数据
- 条件断点可以减少调试时间
- 覆盖率不是唯一指标，测试质量更重要

**最佳实践：**

1. 遵循 AAA 模式：Arrange（准备）、Act（执行）、Assert（断言）
2. 测试名称使用有意义的描述
3. 每个测试只测试一个功能点
4. 使用 `@DisplayName` 提高可读性
5. 避免测试间相互依赖

**下一章预告：**
在下一章中，我们将学习项目打磨与面试准备，包括如何将学习项目转为展示项目、常见面试题、项目经验表述技巧等内容。

---

# 第15章：项目打磨与面试准备

本章将帮助你将学习项目转化为可展示的企业级项目，并为技术面试做好准备。

## 15.1 如何将学习项目转为展示项目

### 15.1.1 项目选择建议

**✅ 推荐的项目类型：**
- **在线商城**：用户、商品、订单、购物车、支付（模拟）
- **内容管理系统**：文章、分类、标签、评论、点赞
- **任务管理系统**：任务、项目、团队、权限管理
- **在线教育平台**：课程、章节、视频、作业、评分
- **社交平台**：用户、动态、关注、点赞、评论

**❌ 避免的项目：**
- 过于简单（只有增删改查）
- 过于复杂（涉及太多业务领域）
- 抄袭现有开源项目

### 15.1.2 项目完整性检查

**必备功能模块：**
- [ ] 用户注册/登录（JWT认证）
- [ ] 权限控制（角色、权限）
- [ ] 核心业务（至少3个相关模块）
- [ ] 数据分页/搜索/排序
- [ ] 文件上传下载
- [ ] 数据导出（Excel/CSV）
- [ ] 定时任务（至少1个）
- [ ] 异步处理（邮件/消息）

**技术栈完整性：**
- [ ] Spring Boot 3.x
- [ ] MyBatis / MyBatis-Plus
- [ ] MySQL 数据库
- [ ] Redis 缓存
- [ ] Docker 部署
- [ ] Swagger/Knife4j 接口文档
- [ ] 日志系统（Logback）
- [ ] 单元测试和集成测试

### 15.1.3 代码质量提升

**1. 代码规范：**
```kotlin
// ❌ 不好的命名
fun doSth(d: String): String {
    val x = getData()
    return process(x)
}

// ✅ 清晰的命名
fun generateUserReport(userId: String): UserReportDto {
    val userData = userRepository.findById(userId)
    return reportService.buildReport(userData)
}
```

**2. 添加完整的注释：**
```kotlin
/**
 * 用户服务
 * 
 * 提供用户管理的核心业务逻辑，包括：
 * - 用户注册和登录
 * - 用户信息查询和更新
 * - 用户权限管理
 * 
 * @author Your Name
 * @since 1.0.0
 */
@Service
class UserService(
    private val userMapper: UserMapper,
    private val passwordEncoder: PasswordEncoder
) {
    
    /**
     * 用户注册
     * 
     * @param request 注册请求，包含用户名、密码、邮箱等信息
     * @return 新创建的用户信息（不包含密码）
     * @throws ConflictException 当用户名或邮箱已存在时
     */
    @Transactional
    fun register(request: RegisterRequest): UserInfo {
        // 实现逻辑...
    }
}
```

**3. 异常处理完善：**
```kotlin
// ✅ 使用自定义异常
throw NotFoundException("用户不存在: userId=$userId")
throw ValidationException("密码长度必须在6-20个字符之间")
throw ConflictException("用户名已被占用: username=$username")

// ✅ 全局异常处理器
@RestControllerAdvice
class GlobalExceptionHandler {
    
    @ExceptionHandler(BusinessException::class)
    fun handleBusinessException(ex: BusinessException): ResponseEntity<ApiResponse<Nothing>> {
        logger.error("业务异常", ex)
        return ResponseEntity
            .status(ex.statusCode)
            .body(ApiResponse.error(ex.message))
    }
}
```

**4. 日志完善：**
```kotlin
@Service
class OrderService {
    
    private val logger = LoggerFactory.getLogger(javaClass)
    
    fun createOrder(request: CreateOrderRequest): Order {
        logger.info("开始创建订单: userId=${request.userId}, items=${request.items.size}")
        
        try {
            val order = processOrder(request)
            logger.info("订单创建成功: orderId=${order.id}")
            return order
        } catch (e: Exception) {
            logger.error("订单创建失败: userId=${request.userId}", e)
            throw OrderCreationException("订单创建失败", e)
        }
    }
}
```

### 15.1.4 README 编写

**完整的 README.md 模板：**

````markdown
# 项目名称

> 一句话描述你的项目

## 项目简介

这是一个基于 Spring Boot + Kotlin + MyBatis 开发的XXX系统，实现了XXX、XXX、XXX等功能。

### 技术栈

**后端：**
- Spring Boot 3.2
- Kotlin 1.9
- MyBatis 3.5
- MySQL 8.0
- Redis 7.0
- JWT Token 认证

**部署：**
- Docker
- Docker Compose

**开发工具：**
- Cursor IDE
- Maven 3.9
- Git

### 主要功能

- ✅ 用户注册/登录（JWT认证）
- ✅ 权限管理（RBAC）
- ✅ XXX模块（核心业务1）
- ✅ XXX模块（核心业务2）
- ✅ 文件上传下载
- ✅ 数据导出（Excel）
- ✅ 定时任务（数据统计）
- ✅ 异步通知（邮件/短信）
- ✅ Redis 缓存
- ✅ 接口文档（Knife4j）

## 快速开始

### 前置条件

- JDK 17+
- Maven 3.6+
- MySQL 8.0+
- Redis 5.0+
- Docker（可选）

### 本地运行

1. 克隆项目
```bash
git clone https://github.com/your-username/your-project.git
cd your-project
```

2. 创建数据库
```sql
CREATE DATABASE your_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

3. 修改配置
```yaml
# src/main/resources/application-dev.yml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/your_db
    username: root
    password: your_password
```

4. 运行项目
```bash
mvn spring-boot:run
```

5. 访问接口文档
```
http://localhost:8080/doc.html
```

### Docker 部署

```bash
# 启动所有服务
docker-compose up -d

# 查看日志
docker-compose logs -f

# 停止服务
docker-compose down
```

## 项目结构

```
src/
├── main/
│   ├── kotlin/
│   │   └── com/example/demo/
│   │       ├── config/          # 配置类
│   │       ├── controller/      # 控制器
│   │       ├── service/         # 业务逻辑
│   │       ├── mapper/          # 数据访问层
│   │       ├── entity/          # 实体类
│   │       ├── dto/             # DTO
│   │       ├── exception/       # 异常类
│   │       └── util/            # 工具类
│   └── resources/
│       ├── application.yml      # 主配置
│       ├── application-dev.yml  # 开发环境
│       ├── application-prod.yml # 生产环境
│       └── mapper/              # MyBatis XML
└── test/                        # 测试代码
```

## API 文档

项目集成了 Knife4j，启动后访问：http://localhost:8080/doc.html

### 主要接口

- `POST /auth/register` - 用户注册
- `POST /auth/login` - 用户登录
- `GET /users/{id}` - 查询用户
- `POST /xxx` - XXX功能

## 数据库设计

### 主要表结构

**用户表（users）**
- id - 用户ID
- username - 用户名
- password - 密码（加密）
- email - 邮箱
- status - 状态

**XXX表**（根据实际情况补充）

## 技术亮点

1. **JWT 无状态认证**：使用 Redis 存储 Token，支持登录状态管理
2. **分布式锁**：使用 Redis 实现分布式锁，防止并发问题
3. **异步处理**：使用 @Async 处理耗时操作，提升响应速度
4. **定时任务**：使用 @Scheduled 实现数据统计、清理等功能
5. **全局异常处理**：统一的异常处理机制，规范错误响应
6. **接口文档**：Swagger3 自动生成接口文档，方便前后端对接
7. **Docker 部署**：多阶段构建，减小镜像体积

## 测试

```bash
# 运行所有测试
mvn test

# 查看测试覆盖率
mvn jacoco:report
```

## 待优化

- [ ] 引入消息队列（RabbitMQ/Kafka）
- [ ] 引入 Elasticsearch 全文搜索
- [ ] 前端页面开发
- [ ] 完善单元测试
- [ ] 性能优化

## 许可证

MIT License

## 联系方式

- Email: your.email@example.com
- GitHub: [@your-username](https://github.com/your-username)
````

### 15.1.5 代码托管

**GitHub/Gitee 准备：**

1. **创建仓库**
2. **完善项目描述**
3. **添加 .gitignore**
```gitignore
# Maven
target/
pom.xml.tag
pom.xml.releaseBackup
pom.xml.versionsBackup

# IDE
.idea/
*.iml
.vscode/

# Logs
logs/
*.log

# 配置文件（包含敏感信息）
application-prod.yml
```

4. **提交代码**
```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/your-username/your-project.git
git push -u origin main
```

## 15.2 Spring Boot 常见面试题

### 15.2.1 基础篇

**1. Spring Boot 的优势是什么？**

答：
- **自动配置**：根据依赖自动配置 Bean，减少手动配置
- **starter 依赖**：统一管理相关依赖，避免版本冲突
- **内嵌服务器**：无需部署 WAR 包，直接运行 jar
- **Actuator 监控**：提供健康检查、指标监控等功能
- **开箱即用**：快速搭建项目，专注业务开发

**2. Spring Boot 启动流程？**

答：
1. 运行 `SpringApplication.run()` 方法
2. 创建 `SpringApplication` 对象
3. 加载 `SpringBootConfiguration`（主配置类）
4. 创建 `ApplicationContext`（Spring 容器）
5. 扫描 `@Component` 及相关注解的类
6. 执行自动配置类（`@EnableAutoConfiguration`）
7. 刷新容器，初始化所有 Bean
8. 执行 `CommandLineRunner` 和 `ApplicationRunner`
9. 启动内嵌服务器（Tomcat/Jetty）
10. 应用启动完成

**3. @SpringBootApplication 注解的作用？**

答：这是一个组合注解，包含：
- `@SpringBootConfiguration`：标识为配置类
- `@EnableAutoConfiguration`：启用自动配置
- `@ComponentScan`：扫描当前包及子包的组件

**4. 如何自定义自动配置？**

答：
1. 创建配置类，添加 `@Configuration` 和 `@ConditionalOnXxx`
2. 创建 `META-INF/spring.factories` 文件
3. 配置 `org.springframework.boot.autoconfigure.EnableAutoConfiguration=配置类全限定名`
4. 打包为 jar，在其他项目中引入

### 15.2.2 核心篇

**5. Bean 的生命周期？**

答：
1. **实例化**：调用构造方法创建对象
2. **属性赋值**：注入依赖（@Autowired）
3. **初始化前**：调用 `BeanPostProcessor.postProcessBeforeInitialization()`
4. **初始化**：调用 `@PostConstruct` 方法或 `InitializingBean.afterPropertiesSet()`
5. **初始化后**：调用 `BeanPostProcessor.postProcessAfterInitialization()`
6. **使用**：Bean 可以被使用
7. **销毁**：容器关闭时调用 `@PreDestroy` 方法或 `DisposableBean.destroy()`

**6. @Autowired 和 @Resource 的区别？**

答：
| 特性 | @Autowired | @Resource |
|-----|-----------|----------|
| 来源 | Spring | Java EE (JSR-250) |
| 匹配方式 | 先按类型，再按名称 | 先按名称，再按类型 |
| 必填 | 默认必填（required=true） | 默认必填 |
| 指定名称 | `@Qualifier("beanName")` | `name="beanName"` |

**推荐**：在 Spring 项目中使用 `@Autowired`（类型安全，支持构造器注入）

**7. 依赖注入的方式有哪些？**

答：
1. **构造器注入**（推荐）：
```kotlin
@Service
class UserService(
    private val userMapper: UserMapper
)
```

2. **Setter 注入**：
```kotlin
@Service
class UserService {
    @Autowired
    lateinit var userMapper: UserMapper
}
```

3. **字段注入**（不推荐）：
```kotlin
@Service
class UserService {
    @Autowired
    private lateinit var userMapper: UserMapper
}
```

**推荐构造器注入的原因**：
- 强制依赖，避免 NullPointerException
- 支持 final 字段，线程安全
- 便于单元测试（可以直接 new）
- 循环依赖会在启动时报错（早发现问题）

**8. 如何解决循环依赖？**

答：
- **构造器注入**：无法解决，Spring 启动时会报错
- **Setter/字段注入**：Spring 可以通过三级缓存解决
- **最佳方案**：重构代码，避免循环依赖

**三级缓存机制**：
1. `singletonObjects`：完整的单例 Bean
2. `earlySingletonObjects`：提前暴露的 Bean（未完全初始化）
3. `singletonFactories`：Bean 工厂

### 15.2.3 数据访问篇

**9. MyBatis 的 # 和 $ 的区别？**

答：
| 特性 | #{} | ${} |
|-----|-----|-----|
| 处理方式 | 预编译（PreparedStatement） | 字符串拼接 |
| SQL 注入 | 防止 | 不防止 |
| 使用场景 | 参数值 | 表名、列名、ORDER BY |

```kotlin
// ✅ 推荐（防止 SQL 注入）
@Select("SELECT * FROM users WHERE id = #{id}")
fun findById(id: Long): User?

// ❌ 危险（SQL 注入风险）
@Select("SELECT * FROM users WHERE id = ${id}")
fun findById(id: Long): User?

// ✅ 动态表名/列名（使用 $）
@Select("SELECT * FROM ${tableName} WHERE id = #{id}")
fun findFromTable(tableName: String, id: Long): Any?
```

**10. MyBatis 的一级缓存和二级缓存？**

答：
- **一级缓存**：SqlSession 级别，默认开启，同一个 SqlSession 内有效
- **二级缓存**：Mapper 级别，需要手动开启，跨 SqlSession 共享

**不推荐使用二级缓存**，原因：
- 更新操作会清空整个 Mapper 的缓存
- 多表查询时缓存不一致
- 分布式环境下缓存不同步
- **推荐使用 Redis 作为缓存**

**11. 如何防止 SQL 注入？**

答：
1. 使用 `#{}` 而不是 `${}`
2. 使用参数验证（@Valid）
3. 使用白名单验证（表名、列名）
4. 限制数据库用户权限

### 15.2.4 Redis 篇

**12. Redis 的数据类型有哪些？**

答：
- **String**：字符串，最基础的类型
- **Hash**：哈希表，存储对象
- **List**：列表，有序，可重复
- **Set**：集合，无序，不可重复
- **Sorted Set**：有序集合，带分数
- **Bitmap**：位图
- **HyperLogLog**：基数统计
- **Geospatial**：地理位置
- **Stream**：消息队列

**13. 缓存穿透、击穿、雪崩的解决方案？**

答：

**缓存穿透**（查询不存在的数据）：
- 解决方案1：缓存空值（设置短过期时间）
- 解决方案2：布隆过滤器

**缓存击穿**（热点数据过期）：
- 解决方案：使用分布式锁（双重检查）

**缓存雪崩**（大量缓存同时过期）：
- 解决方案1：随机过期时间
- 解决方案2：缓存预热
- 解决方案3：多级缓存

**14. 如何保证缓存和数据库一致性？**

答：
**推荐方案**：先更新数据库，再删除缓存
```kotlin
@Transactional
fun updateUser(userId: Long, request: UpdateUserRequest): User {
    // 1. 更新数据库
    userMapper.update(userId, request)
    
    // 2. 删除缓存
    redisTemplate.delete("user:$userId")
    
    return userMapper.findById(userId)!!
}
```

**为什么不是"先删除缓存，再更新数据库"？**
- 并发时可能出现旧数据被缓存

**为什么不是"先更新数据库，再更新缓存"？**
- 浪费资源（可能没人查询）
- 并发时可能缓存旧数据

### 15.2.5 性能优化篇

**15. 如何优化接口性能？**

答：
1. **数据库优化**：
   - 添加索引
   - 避免全表扫描
   - 使用分页
   - 减少 JOIN 查询

2. **缓存优化**：
   - Redis 缓存热点数据
   - 本地缓存（Caffeine）
   - 缓存预热

3. **异步处理**：
   - 使用 @Async 处理耗时操作
   - 消息队列解耦

4. **代码优化**：
   - 减少循环查询（N+1 问题）
   - 批量操作
   - 使用连接池

5. **架构优化**：
   - 读写分离
   - 分库分表
   - CDN 加速

## 15.3 项目经验表述技巧（STAR 法则）

### 15.3.1 STAR 法则

- **S（Situation）**：项目背景、场景
- **T（Task）**：你的任务、目标
- **A（Action）**：你采取的行动、使用的技术
- **R（Result）**：取得的成果、数据

### 15.3.2 示例1：性能优化

**问：你做过哪些性能优化？**

答：
**S（背景）**：在XXX项目中，商品列表接口响应时间超过2秒，用户体验很差。

**T（任务）**：我负责优化商品列表接口，目标是将响应时间降到500ms以内。

**A（行动）**：
1. 分析慢查询日志，发现缺少索引，给 category_id 和 status 字段添加了联合索引
2. 使用 Redis 缓存热门商品列表，设置5分钟过期
3. 图片URL使用CDN加速
4. 使用分页查询，每页限制20条

**R（结果）**：优化后，接口响应时间降到了200ms，用户体验显著提升，转化率提高了15%。

### 15.3.3 示例2：技术选型

**问：为什么选择 MyBatis 而不是 JPA？**

答：
**S（背景）**：项目中有大量复杂的SQL查询，包括多表JOIN、分组统计等。

**T（任务）**：需要选择一个合适的 ORM 框架。

**A（行动）**：
1. **评估 MyBatis**：SQL 可控性强，性能优化方便，学习曲线平缓
2. **评估 JPA**：自动生成SQL，但复杂查询不够灵活
3. 考虑团队技术栈，大部分成员熟悉MyBatis

**R（结果）**：最终选择 MyBatis，项目开发顺利，复杂查询性能良好。

### 15.3.4 示例3：并发问题

**问：如何处理高并发场景？**

答：
**S（背景）**：秒杀活动中，库存扣减存在超卖问题。

**T（任务）**：保证高并发下库存扣减的准确性。

**A（行动）**：
1. 使用 Redis 分布式锁，保证同一时间只有一个请求扣减库存
2. 使用 Lua 脚本保证原子性
3. 异步记录订单，提升响应速度
4. 使用 Redis 预减库存，减少数据库压力

```kotlin
fun reduceStock(productId: Long, quantity: Int): Boolean {
    val lockKey = "lock:stock:$productId"
    val acquired = redisTemplate.opsForValue()
        .setIfAbsent(lockKey, "1", 10, TimeUnit.SECONDS)
    
    if (acquired != true) return false
    
    try {
        // 扣减库存
        val stock = productMapper.getStock(productId)
        if (stock < quantity) return false
        
        productMapper.reduceStock(productId, quantity)
        return true
    } finally {
        redisTemplate.delete(lockKey)
    }
}
```

**R（结果）**：解决了超卖问题，秒杀活动顺利进行，并发支持1000 QPS。

## 15.4 本章小结

本章介绍了项目打磨与面试准备：

✅ **项目转化**：完整性检查、代码质量提升、README 编写
✅ **代码规范**：命名规范、注释完善、异常处理、日志记录
✅ **面试题**：Spring Boot、MyBatis、Redis 常见问题
✅ **项目经验**：STAR 法则、性能优化、技术选型、并发处理

**关键要点：**

- 项目要有完整的功能和技术栈
- 代码要规范，注释要完整
- README 要详细，便于他人理解
- 面试回答要有条理，使用 STAR 法则
- 技术问题要深入理解原理

**最佳实践：**

1. 项目开发完成后，花时间打磨代码
2. 重要功能要有完整的单元测试
3. 提交前使用 Git 规范提交信息
4. README 要清晰、完整、有亮点
5. 面试前梳理项目经验和技术难点

---

**恭喜你完成了《Spring Boot 零基础入门教程》的学习！**

通过本教程，你已经掌握了：
- ✅ Spring Boot 核心概念和工作原理
- ✅ RESTful API 开发
- ✅ MyBatis 数据访问
- ✅ Redis 缓存应用
- ✅ JWT 认证授权
- ✅ Docker 部署
- ✅ 测试与调试
- ✅ 项目实战

**下一步建议：**
1. 动手实践，完成一个完整项目
2. 深入学习源码（Spring、MyBatis）
3. 学习微服务（Spring Cloud）
4. 关注技术社区，持续学习

**祝你在技术道路上越走越远！**

---

# 第16章：附录

## 16.1 pom.xml 常用依赖合集

以下是 Spring Boot + Kotlin 项目中常用的依赖配置汇总：

### 16.1.1 基础依赖

```xml
<!-- Spring Boot 核心依赖 -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-web</artifactId>
</dependency>

<!-- Kotlin 依赖 -->
<dependency>
    <groupId>org.jetbrains.kotlin</groupId>
    <artifactId>kotlin-reflect</artifactId>
</dependency>

<dependency>
    <groupId>org.jetbrains.kotlin</groupId>
    <artifactId>kotlin-stdlib</artifactId>
</dependency>

<!-- 开发工具 -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-devtools</artifactId>
    <scope>runtime</scope>
    <optional>true</optional>
</dependency>

<!-- 配置处理器 -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-configuration-processor</artifactId>
    <optional>true</optional>
</dependency>
```

### 16.1.2 数据库相关

```xml
<!-- MyBatis -->
<dependency>
    <groupId>org.mybatis.spring.boot</groupId>
    <artifactId>mybatis-spring-boot-starter</artifactId>
    <version>3.0.3</version>
</dependency>

<!-- MySQL 驱动 -->
<dependency>
    <groupId>com.mysql</groupId>
    <artifactId>mysql-connector-j</artifactId>
    <scope>runtime</scope>
</dependency>

<!-- 数据库连接池 -->
<dependency>
    <groupId>com.zaxxer</groupId>
    <artifactId>HikariCP</artifactId>
</dependency>

<!-- H2 数据库（测试用） -->
<dependency>
    <groupId>com.h2database</groupId>
    <artifactId>h2</artifactId>
    <scope>test</scope>
</dependency>
```

### 16.1.3 Redis 缓存

```xml
<!-- Redis -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-data-redis</artifactId>
</dependency>

<!-- Lettuce 连接池 -->
<dependency>
    <groupId>org.apache.commons</groupId>
    <artifactId>commons-pool2</artifactId>
</dependency>
```

### 16.1.4 API 文档

```xml
<!-- Swagger 3 (SpringDoc) -->
<dependency>
    <groupId>org.springdoc</groupId>
    <artifactId>springdoc-openapi-starter-webmvc-ui</artifactId>
    <version>2.3.0</version>
</dependency>

<!-- Knife4j（增强版 Swagger UI） -->
<dependency>
    <groupId>com.github.xiaoymin</groupId>
    <artifactId>knife4j-openapi3-jakarta-spring-boot-starter</artifactId>
    <version>4.4.0</version>
</dependency>
```

### 16.1.5 安全认证

```xml
<!-- Spring Security -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-security</artifactId>
</dependency>

<!-- JWT -->
<dependency>
    <groupId>io.jsonwebtoken</groupId>
    <artifactId>jjwt-api</artifactId>
    <version>0.12.3</version>
</dependency>

<dependency>
    <groupId>io.jsonwebtoken</groupId>
    <artifactId>jjwt-impl</artifactId>
    <version>0.12.3</version>
    <scope>runtime</scope>
</dependency>

<dependency>
    <groupId>io.jsonwebtoken</groupId>
    <artifactId>jjwt-jackson</artifactId>
    <version>0.12.3</version>
    <scope>runtime</scope>
</dependency>
```

### 16.1.6 工具库

```xml
<!-- Jackson Kotlin 模块 -->
<dependency>
    <groupId>com.fasterxml.jackson.module</groupId>
    <artifactId>jackson-module-kotlin</artifactId>
</dependency>

<!-- 时间处理 -->
<dependency>
    <groupId>com.fasterxml.jackson.datatype</groupId>
    <artifactId>jackson-datatype-jsr310</artifactId>
</dependency>

<!-- Lombok（可选，Kotlin 已有类似功能） -->
<dependency>
    <groupId>org.projectlombok</groupId>
    <artifactId>lombok</artifactId>
    <optional>true</optional>
</dependency>

<!-- Apache Commons -->
<dependency>
    <groupId>org.apache.commons</groupId>
    <artifactId>commons-lang3</artifactId>
</dependency>

<!-- Hutool 工具库 -->
<dependency>
    <groupId>cn.hutool</groupId>
    <artifactId>hutool-all</artifactId>
    <version>5.8.24</version>
</dependency>
```

### 16.1.7 测试依赖

```xml
<!-- Spring Boot 测试 -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-test</artifactId>
    <scope>test</scope>
</dependency>

<!-- Mockk (Kotlin mock 框架) -->
<dependency>
    <groupId>io.mockk</groupId>
    <artifactId>mockk-jvm</artifactId>
    <version>1.13.9</version>
    <scope>test</scope>
</dependency>
```

### 16.1.8 监控运维

```xml
<!-- Actuator -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-actuator</artifactId>
</dependency>

<!-- Prometheus -->
<dependency>
    <groupId>io.micrometer</groupId>
    <artifactId>micrometer-registry-prometheus</artifactId>
</dependency>
```

## 16.2 常用 Maven 命令速查表

```bash
# ========== 基本命令 ==========

# 清理项目（删除 target 目录）
mvn clean

# 编译项目
mvn compile

# 编译测试代码
mvn test-compile

# 运行测试
mvn test

# 打包项目
mvn package

# 安装到本地仓库
mvn install

# 部署到远程仓库
mvn deploy

# ========== 组合命令 ==========

# 清理并编译
mvn clean compile

# 清理并打包
mvn clean package

# 清理、打包并安装
mvn clean install

# 跳过测试打包
mvn clean package -DskipTests

# 跳过测试编译和执行
mvn clean package -Dmaven.test.skip=true

# ========== Spring Boot 命令 ==========

# 运行 Spring Boot 应用
mvn spring-boot:run

# 指定 Profile 运行
mvn spring-boot:run -Dspring-boot.run.profiles=dev

# 指定参数运行
mvn spring-boot:run -Dspring-boot.run.arguments="--server.port=9090"

# 打包为可执行 jar
mvn spring-boot:repackage

# ========== 依赖管理 ==========

# 查看依赖树
mvn dependency:tree

# 下载依赖源码
mvn dependency:sources

# 下载依赖的 JavaDoc
mvn dependency:resolve -Dclassifier=javadoc

# 分析依赖
mvn dependency:analyze

# 解决依赖
mvn dependency:resolve

# 离线模式下载依赖
mvn dependency:go-offline

# ========== 插件相关 ==========

# 查看插件帮助
mvn help:describe -Dplugin=spring-boot

# 查看有效 POM
mvn help:effective-pom

# 查看有效 settings
mvn help:effective-settings

# ========== 其他实用命令 ==========

# 生成项目站点
mvn site

# 查看项目信息
mvn project-info-reports:dependencies

# 更新快照版本
mvn clean install -U

# 指定 settings.xml
mvn clean install -s /path/to/settings.xml

# 多线程构建（4个线程）
mvn clean install -T 4

# 仅构建特定模块
mvn clean install -pl module-name

# 同时构建依赖模块
mvn clean install -pl module-name -am

# ========== 版本管理 ==========

# 查看可更新的依赖
mvn versions:display-dependency-updates

# 查看可更新的插件
mvn versions:display-plugin-updates

# 设置新版本
mvn versions:set -DnewVersion=2.0.0

# ========== 调试相关 ==========

# 显示详细日志
mvn clean install -X

# 显示调试信息
mvn clean install -e

# 离线模式
mvn clean install -o
```

## 16.3 常用 Docker 命令速查表

```bash
# ========== 镜像管理 ==========

# 查看所有镜像
docker images

# 搜索镜像
docker search mysql

# 拉取镜像
docker pull mysql:8.0

# 构建镜像
docker build -t myapp:1.0 .

# 给镜像打标签
docker tag myapp:1.0 myapp:latest

# 删除镜像
docker rmi myapp:1.0

# 删除所有未使用的镜像
docker image prune -a

# 查看镜像详情
docker inspect mysql:8.0

# 查看镜像历史
docker history myapp:1.0

# 保存镜像为文件
docker save -o myapp.tar myapp:1.0

# 从文件加载镜像
docker load -i myapp.tar

# ========== 容器管理 ==========

# 运行容器
docker run -d --name mycontainer -p 8080:8080 myapp:1.0

# 查看运行中的容器
docker ps

# 查看所有容器（包括停止的）
docker ps -a

# 停止容器
docker stop mycontainer

# 启动容器
docker start mycontainer

# 重启容器
docker restart mycontainer

# 删除容器
docker rm mycontainer

# 强制删除运行中的容器
docker rm -f mycontainer

# 删除所有停止的容器
docker container prune

# 进入容器
docker exec -it mycontainer bash
# 或 Alpine 系统
docker exec -it mycontainer sh

# 查看容器日志
docker logs mycontainer

# 实时查看日志
docker logs -f mycontainer

# 查看最后100行日志
docker logs --tail 100 mycontainer

# 查看容器详情
docker inspect mycontainer

# 查看容器资源使用
docker stats mycontainer

# 查看容器进程
docker top mycontainer

# 复制文件到容器
docker cp local-file.txt mycontainer:/path/in/container

# 从容器复制文件
docker cp mycontainer:/path/in/container/file.txt ./local-file.txt

# ========== Docker Compose ==========

# 启动服务（后台运行）
docker-compose up -d

# 启动服务（前台运行）
docker-compose up

# 重新构建并启动
docker-compose up -d --build

# 停止服务
docker-compose stop

# 停止并删除容器
docker-compose down

# 停止并删除容器、网络、卷
docker-compose down -v

# 查看服务状态
docker-compose ps

# 查看日志
docker-compose logs

# 查看特定服务日志
docker-compose logs app

# 实时查看日志
docker-compose logs -f

# 重启服务
docker-compose restart

# 重启特定服务
docker-compose restart app

# 进入服务容器
docker-compose exec app sh

# 查看资源使用
docker-compose stats

# 扩展服务实例
docker-compose up -d --scale app=3

# ========== 网络管理 ==========

# 查看网络
docker network ls

# 创建网络
docker network create mynetwork

# 删除网络
docker network rm mynetwork

# 查看网络详情
docker network inspect mynetwork

# 连接容器到网络
docker network connect mynetwork mycontainer

# 断开容器与网络
docker network disconnect mynetwork mycontainer

# ========== 数据卷管理 ==========

# 查看数据卷
docker volume ls

# 创建数据卷
docker volume create myvolume

# 删除数据卷
docker volume rm myvolume

# 查看数据卷详情
docker volume inspect myvolume

# 删除未使用的数据卷
docker volume prune

# ========== 系统管理 ==========

# 查看 Docker 信息
docker info

# 查看 Docker 版本
docker version

# 清理系统（删除未使用的容器、网络、镜像）
docker system prune

# 清理所有未使用的资源（包括数据卷）
docker system prune -a --volumes

# 查看磁盘使用
docker system df

# ========== 实用组合 ==========

# 停止所有容器
docker stop $(docker ps -aq)

# 删除所有容器
docker rm $(docker ps -aq)

# 删除所有镜像
docker rmi $(docker images -q)

# 查看容器IP
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' mycontainer
```

## 16.4 常用 Redis 命令速查表

```bash
# ========== 连接 ==========

# 连接 Redis
redis-cli

# 连接指定主机和端口
redis-cli -h 127.0.0.1 -p 6379

# 使用密码连接
redis-cli -a password

# 认证（连接后）
AUTH password

# 切换数据库（0-15）
SELECT 0

# 测试连接
PING

# ========== 键操作 ==========

# 查看所有键
KEYS *

# 查看匹配的键
KEYS user:*

# 检查键是否存在
EXISTS key

# 删除键
DEL key

# 删除多个键
DEL key1 key2 key3

# 设置过期时间（秒）
EXPIRE key 3600

# 设置过期时间（毫秒）
PEXPIRE key 3600000

# 设置过期时间点
EXPIREAT key 1672531200

# 查看剩余过期时间（秒）
TTL key

# 查看剩余过期时间（毫秒）
PTTL key

# 移除过期时间
PERSIST key

# 重命名键
RENAME oldkey newkey

# 查看键的类型
TYPE key

# 随机返回一个键
RANDOMKEY

# ========== 字符串操作 ==========

# 设置值
SET key value

# 设置值并设置过期时间
SET key value EX 3600

# 只在键不存在时设置
SET key value NX

# 只在键存在时设置
SET key value XX

# 获取值
GET key

# 设置并返回旧值
GETSET key newvalue

# 批量设置
MSET key1 value1 key2 value2

# 批量获取
MGET key1 key2 key3

# 递增
INCR key

# 增加指定值
INCRBY key 10

# 递减
DECR key

# 减少指定值
DECRBY key 10

# 追加值
APPEND key value

# 获取字符串长度
STRLEN key

# ========== 哈希操作 ==========

# 设置哈希字段
HSET hash field value

# 获取哈希字段
HGET hash field

# 批量设置哈希字段
HMSET hash field1 value1 field2 value2

# 批量获取哈希字段
HMGET hash field1 field2

# 获取所有字段和值
HGETALL hash

# 获取所有字段
HKEYS hash

# 获取所有值
HVALS hash

# 删除哈希字段
HDEL hash field

# 检查字段是否存在
HEXISTS hash field

# 获取字段数量
HLEN hash

# 字段值递增
HINCRBY hash field 1

# ========== 列表操作 ==========

# 左侧推入
LPUSH list value

# 右侧推入
RPUSH list value

# 左侧弹出
LPOP list

# 右侧弹出
RPOP list

# 获取列表长度
LLEN list

# 获取范围元素
LRANGE list 0 -1

# 获取指定索引元素
LINDEX list 0

# 设置指定索引元素
LSET list 0 newvalue

# 修剪列表
LTRIM list 0 99

# ========== 集合操作 ==========

# 添加成员
SADD set member

# 移除成员
SREM set member

# 检查成员是否存在
SISMEMBER set member

# 获取所有成员
SMEMBERS set

# 获取成员数量
SCARD set

# 随机获取成员
SRANDMEMBER set

# 弹出随机成员
SPOP set

# 集合交集
SINTER set1 set2

# 集合并集
SUNION set1 set2

# 集合差集
SDIFF set1 set2

# ========== 有序集合操作 ==========

# 添加成员
ZADD zset 1 member

# 获取成员分数
ZSCORE zset member

# 获取排名（从小到大）
ZRANK zset member

# 获取排名（从大到小）
ZREVRANK zset member

# 按排名获取成员
ZRANGE zset 0 -1

# 按排名获取成员（带分数）
ZRANGE zset 0 -1 WITHSCORES

# 按排名获取成员（从大到小）
ZREVRANGE zset 0 -1

# 按分数范围获取
ZRANGEBYSCORE zset 0 100

# 获取成员数量
ZCARD zset

# 获取分数范围内的数量
ZCOUNT zset 0 100

# 增加成员分数
ZINCRBY zset 10 member

# 移除成员
ZREM zset member

# ========== 发布订阅 ==========

# 订阅频道
SUBSCRIBE channel

# 发布消息
PUBLISH channel message

# 取消订阅
UNSUBSCRIBE channel

# 模式订阅
PSUBSCRIBE pattern

# ========== 事务 ==========

# 开启事务
MULTI

# 执行事务
EXEC

# 取消事务
DISCARD

# 监视键
WATCH key

# 取消监视
UNWATCH

# ========== 服务器管理 ==========

# 查看服务器信息
INFO

# 查看特定信息
INFO memory

# 保存数据到磁盘
SAVE

# 后台保存
BGSAVE

# 获取配置
CONFIG GET *

# 设置配置
CONFIG SET parameter value

# 重写AOF文件
BGREWRITEAOF

# 获取客户端列表
CLIENT LIST

# 清空当前数据库
FLUSHDB

# 清空所有数据库
FLUSHALL

# 关闭服务器
SHUTDOWN
```

## 16.5 项目结构示例

### 16.5.1 标准 Spring Boot + Kotlin 项目结构

```
project-root/
├── src/
│   ├── main/
│   │   ├── kotlin/
│   │   │   └── com/
│   │   │       └── example/
│   │   │           └── demo/
│   │   │               ├── DemoApplication.kt          # 启动类
│   │   │               ├── config/                     # 配置类
│   │   │               │   ├── CorsConfig.kt
│   │   │               │   ├── RedisConfig.kt
│   │   │               │   ├── SecurityConfig.kt
│   │   │               │   └── SwaggerConfig.kt
│   │   │               ├── controller/                 # 控制器
│   │   │               │   ├── UserController.kt
│   │   │               │   └── ProductController.kt
│   │   │               ├── service/                    # 业务逻辑
│   │   │               │   ├── UserService.kt
│   │   │               │   └── ProductService.kt
│   │   │               ├── repository/                 # 数据访问层
│   │   │               │   ├── UserRepository.kt
│   │   │               │   └── ProductRepository.kt
│   │   │               ├── mapper/                     # MyBatis Mapper
│   │   │               │   ├── UserMapper.kt
│   │   │               │   └── ProductMapper.kt
│   │   │               ├── entity/                     # 实体类
│   │   │               │   ├── User.kt
│   │   │               │   └── Product.kt
│   │   │               ├── dto/                        # DTO
│   │   │               │   ├── request/
│   │   │               │   │   ├── CreateUserRequest.kt
│   │   │               │   │   └── UpdateUserRequest.kt
│   │   │               │   └── response/
│   │   │               │       ├── UserResponse.kt
│   │   │               │       └── ApiResponse.kt
│   │   │               ├── exception/                  # 异常类
│   │   │               │   ├── BusinessException.kt
│   │   │               │   ├── NotFoundException.kt
│   │   │               │   └── GlobalExceptionHandler.kt
│   │   │               ├── interceptor/                # 拦截器
│   │   │               │   └── AuthInterceptor.kt
│   │   │               ├── filter/                     # 过滤器
│   │   │               │   └── JwtAuthenticationFilter.kt
│   │   │               ├── util/                       # 工具类
│   │   │               │   ├── JwtUtil.kt
│   │   │               │   ├── RedisUtil.kt
│   │   │               │   └── DateUtil.kt
│   │   │               └── constant/                   # 常量类
│   │   │                   └── Constants.kt
│   │   └── resources/
│   │       ├── application.yml                         # 主配置
│   │       ├── application-dev.yml                     # 开发环境配置
│   │       ├── application-test.yml                    # 测试环境配置
│   │       ├── application-prod.yml                    # 生产环境配置
│   │       ├── mapper/                                 # MyBatis XML
│   │       │   ├── UserMapper.xml
│   │       │   └── ProductMapper.xml
│   │       ├── sql/                                    # SQL 脚本
│   │       │   ├── schema.sql
│   │       │   └── data.sql
│   │       ├── static/                                 # 静态资源
│   │       │   ├── css/
│   │       │   ├── js/
│   │       │   └── images/
│   │       └── templates/                              # 模板文件
│   └── test/
│       └── kotlin/
│           └── com/
│               └── example/
│                   └── demo/
│                       ├── DemoApplicationTests.kt
│                       ├── controller/
│                       │   └── UserControllerTest.kt
│                       └── service/
│                           └── UserServiceTest.kt
├── target/                                             # 编译输出
├── .gitignore                                          # Git 忽略文件
├── .dockerignore                                       # Docker 忽略文件
├── Dockerfile                                          # Docker 镜像构建文件
├── docker-compose.yml                                  # Docker Compose 配置
├── pom.xml                                             # Maven 配置
└── README.md                                           # 项目说明
```

## 16.6 完整配置文件示例

### 16.6.1 application.yml

```yaml
# 应用配置
spring:
  application:
    name: demo-application
  
  # Profile 配置
  profiles:
    active: dev
  
  # 数据源配置
  datasource:
    driver-class-name: com.mysql.cj.jdbc.Driver
    url: jdbc:mysql://localhost:3306/demo?useSSL=false&serverTimezone=Asia/Shanghai&characterEncoding=utf8
    username: root
    password: password
    # 连接池配置
    hikari:
      minimum-idle: 5
      maximum-pool-size: 20
      connection-timeout: 30000
      idle-timeout: 600000
      max-lifetime: 1800000
  
  # Redis 配置
  redis:
    host: localhost
    port: 6379
    password:
    database: 0
    timeout: 5000ms
    lettuce:
      pool:
        max-active: 8
        max-idle: 8
        min-idle: 0
        max-wait: -1ms
  
  # Jackson 配置
  jackson:
    time-zone: GMT+8
    date-format: yyyy-MM-dd HH:mm:ss
    serialization:
      write-dates-as-timestamps: false
    deserialization:
      fail-on-unknown-properties: false
  
  # 文件上传配置
  servlet:
    multipart:
      max-file-size: 10MB
      max-request-size: 100MB

# 服务器配置
server:
  port: 8080
  servlet:
    context-path: /api
    encoding:
      charset: UTF-8
      enabled: true
      force: true

# MyBatis 配置
mybatis:
  mapper-locations: classpath:mapper/*.xml
  type-aliases-package: com.example.demo.entity
  configuration:
    map-underscore-to-camel-case: true
    log-impl: org.apache.ibatis.logging.slf4j.Slf4jImpl

# 日志配置
logging:
  level:
    root: INFO
    com.example.demo: DEBUG
    com.example.demo.mapper: DEBUG
  pattern:
    console: "%d{yyyy-MM-dd HH:mm:ss} [%thread] %-5level %logger{36} - %msg%n"
    file: "%d{yyyy-MM-dd HH:mm:ss} [%thread] %-5level %logger{36} - %msg%n"
  file:
    name: logs/application.log
    max-size: 10MB
    max-history: 30

# Actuator 配置
management:
  endpoints:
    web:
      exposure:
        include: "*"
  endpoint:
    health:
      show-details: always

# SpringDoc 配置
springdoc:
  api-docs:
    path: /v3/api-docs
  swagger-ui:
    path: /swagger-ui.html
```

## 16.7 学习资源推荐

### 16.7.1 官方文档

- **Spring Boot 官方文档**：https://spring.io/projects/spring-boot
- **Kotlin 官方文档**：https://kotlinlang.org/docs/home.html
- **MyBatis 官方文档**：https://mybatis.org/mybatis-3/zh/index.html
- **Redis 官方文档**：https://redis.io/documentation
- **Docker 官方文档**：https://docs.docker.com/

### 16.7.2 在线教程

- **Spring Boot 中文网**：https://springboot.io/
- **菜鸟教程**：https://www.runoob.com/
- **W3Cschool**：https://www.w3cschool.cn/

### 16.7.3 技术社区

- **CSDN**：https://www.csdn.net/
- **掘金**：https://juejin.cn/
- **思否**：https://segmentfault.com/
- **Stack Overflow**：https://stackoverflow.com/

### 16.7.4 开源项目

- **Awesome Kotlin**：https://github.com/KotlinBy/awesome-kotlin
- **Spring Boot Examples**：https://github.com/spring-projects/spring-boot/tree/main/spring-boot-samples
- **RuoYi-Vue-Plus**：https://gitee.com/dromara/RuoYi-Vue-Plus

### 16.7.5 视频课程

- **B站（哔哩哔哩）**：搜索 "Spring Boot Kotlin"
- **慕课网**：https://www.imooc.com/
- **极客时间**：https://time.geekbang.org/

### 16.7.6 书籍推荐

- 《Spring Boot实战》
- 《Kotlin核心编程》
- 《MySQL必知必会》
- 《Redis实战》
- 《Docker技术入门与实战》

## 16.8 总结

恭喜你完成了整个教程的学习！通过这16章的系统学习，你已经掌握了：

### 核心技能
✅ Kotlin + Spring Boot 企业级开发
✅ Maven 项目管理和构建
✅ MyBatis 数据访问
✅ Redis 缓存应用
✅ RESTful API 设计与实现
✅ Docker 容器化部署
✅ 多环境配置管理
✅ 全局异常处理
✅ 用户认证与授权
✅ 异步任务处理
✅ 单元测试与集成测试

### 下一步建议

1. **实践项目**
   - 从零开始构建一个完整的项目
   - 参考本教程的示例代码
   - 逐步添加功能模块

2. **深入学习**
   - 研究 Spring Boot 源码
   - 学习设计模式
   - 了解微服务架构

3. **关注技术动态**
   - 关注 Spring Boot 新版本
   - 学习云原生技术
   - 了解 Kubernetes

4. **参与开源**
   - 为开源项目贡献代码
   - 分享学习心得
   - 帮助其他学习者

### 最后的话

技术学习是一个持续的过程，本教程只是一个起点。保持学习热情，不断实践，相信你一定能成为一名优秀的后端工程师！

祝你在技术道路上越走越远，前程似锦！🎉

---

**教程结束**

感谢阅读！如果本教程对你有帮助，请分享给更多的朋友。


