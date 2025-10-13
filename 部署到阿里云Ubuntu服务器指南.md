# 部署到阿里云Ubuntu服务器指南

> 本指南专为Android开发者设计，手把手教你将Spring Boot项目部署到云服务器
>
> 包含完整的Linux命令速查和详细的参数解释

---

## 📋 目录

1. [Linux命令速查手册](#linux命令速查手册)
2. [为什么要部署到云服务器](#为什么要部署到云服务器)
3. [准备阿里云服务器](#准备阿里云服务器)
4. [连接到Ubuntu服务器](#连接到ubuntu服务器)
5. [配置Ubuntu服务器环境](#配置ubuntu服务器环境)
6. [部署项目到服务器](#部署项目到服务器)
7. [启动Docker服务](#启动docker服务)
8. [启动Spring Boot应用](#启动spring-boot应用)
9. [配置防火墙](#配置防火墙)
10. [测试接口访问](#测试接口访问)
11. [常见问题排查](#常见问题排查)
12. [性能优化建议](#性能优化建议)
13. [配置域名访问（可选）](#配置域名访问可选)
14. [监控和日志管理](#监控和日志管理)
15. [部署检查清单](#部署检查清单)

---

## 📘 Linux命令速查手册

作为Android开发者，你可能很少接触Linux命令。**好消息是：你不需要记忆这些命令！** 就像你不需要记住所有Android API一样，需要时查阅即可。

### 1.1 命令的基本结构
Linux命令的结构类似于Android的方法调用：
```
命令名称  参数选项  操作对象
   ↓        ↓       ↓
  apt    install   git
 (类似)  (方法名)  (参数)
```

### 1.2 常用符号含义
| 符号 | 含义 | 类比 |
| --- | --- | --- |
| `-` | 短选项（单字母） | 类似Android的 `-v` (verbose) |
| `--` | 长选项（完整单词） | 类似Android的 `--version` |
| `\|` (管道) | 将前一个命令的输出传给下一个命令 | 类似Kotlin的链式调用 |
| `>` | 重定向输出到文件（覆盖） | 类似写入文件 |
| `>>` | 重定向输出到文件（追加） | 类似追加到文件 |
| `&` | 后台运行 | 类似Android的异步任务 |
| `&&` | 前一个命令成功后才执行后一个 | 类似Java的短路与 |
| `sudo` | 以管理员权限执行 | 类似Android的root权限 |

### 1.3 最常用的参数含义
| 参数 | 英文全称 | 含义 | 记忆技巧 |
| --- | --- | --- | --- |
| `-y` | yes | 自动回答"是" | **重要！**避免手动确认，适合脚本自动化 |
| `-f` | force/follow | 强制执行/跟随 | Force(强制) |
| `-r` | recursive | 递归处理（包含子目录） | Recursive(递归) |
| `-v` | verbose/version | 详细输出/查看版本 | Verbose(详细) |
| `-a` | all | 显示所有 | All(全部) |
| `-l` | list | 列表形式显示 | List(列表) |
| `-h` | human-readable | 人类可读格式 | Human(人类) |
| `-p` | parent/port | 创建父目录/指定端口 | Parent(父级) |
| `-d` | directory/daemon | 仅目录/后台运行 | Directory/Daemon |
| `-i` | interactive | 交互式（每次询问） | Interactive(交互) |

### 1.4 文件与目录操作（类比Android的File操作）
| Linux命令 | 含义 | Android类比 |
| --- | --- | --- |
| `ls` | 列出文件 | `File.listFiles()` |
| `cd` | 切换目录 | `new File(path)` |
| `pwd` | 显示当前目录 | `getAbsolutePath()` |
| `mkdir` | 创建目录 | `File.mkdir()` |
| `mkdir -p` | 创建多级目录 | `File.mkdirs()` |
| `rm` | 删除文件 | `File.delete()` |
| `rm -rf` | 递归强制删除 | **危险！相当于删除整个目录** |
| `cp` | 复制 | `File.copy()` |
| `mv` | 移动/重命名 | `File.renameTo()` |
| `cat` | 查看文件内容 | `readText()` |
| `nano` | 编辑文件 | Android Studio编辑器 |
| `chmod` | 修改文件权限 | 类似设置可执行权限 |
| `chown` | 修改文件所有者 | 类似设置文件归属 |

### 1.5 包管理器命令（类比Gradle依赖管理）
| Linux命令 | 含义 | Android/Gradle类比 |
| --- | --- | --- |
| `apt update` | 更新软件包列表 | Gradle sync |
| `apt install` | 安装软件包 | 添加依赖到build.gradle |
| `apt remove` | 卸载软件包 | 移除依赖 |
| `apt upgrade` | 升级已安装的包 | 更新依赖版本 |
| `apt search` | 搜索软件包 | 搜索Maven仓库 |

### 1.6 系统服务管理（类比Android的Service）
| Linux命令 | 含义 | Android类比 |
| --- | --- | --- |
| `systemctl start` | 启动服务 | `startService()` |
| `systemctl stop` | 停止服务 | `stopService()` |
| `systemctl restart` | 重启服务 | stop + start |
| `systemctl enable` | 开机自启 | 设置为系统服务，开机启动 |
| `systemctl status` | 查看服务状态 | 查看Service是否运行 |

### 1.7 Docker命令（类比Android的容器）
| Docker命令 | 含义 | Android类比 |
| --- | --- | --- |
| `docker ps` | 查看运行中的容器 | 查看正在运行的应用 |
| `docker images` | 查看镜像列表 | 查看已安装的APK |
| `docker run` | 运行容器 | 启动应用 |
| `docker stop` | 停止容器 | 关闭应用 |
| `docker exec` | 进入容器执行命令 | 在应用内执行操作 |
| `docker-compose up` | 启动多个容器 | 启动多个服务 |
| `docker-compose down` | 停止并删除容器 | 停止并卸载应用 |

### 1.8 网络与查看命令
| Linux命令 | 含义 | Android类比 |
| --- | --- | --- |
| `curl` | 发送HTTP请求 | Retrofit/OkHttp |
| `ping` | 测试网络连通性 | 测试网络连接 |
| `netstat` | 查看网络连接 | 查看网络状态 |
| `ps` | 查看进程 | 查看正在运行的应用 |
| `top` | 实时查看进程 | Android Studio的Profiler |
| `free` | 查看内存使用 | 查看RAM使用情况 |
| `df` | 查看磁盘使用 | 查看存储空间 |

### 1.9 ⚠️ 危险命令警告
以下命令可能造成不可逆的损坏，请谨慎使用：
```bash
# ❌ 危险！删除整个目录（无法恢复）
rm -rf /path/to/directory

# ❌ 危险！修改系统关键文件
chmod 777 /etc/

# ❌ 危险！强制结束所有进程
killall -9 java

# ❌ 危险！删除整个磁盘数据
dd if=/dev/zero of=/dev/sda
```

### 1.10 💡 记忆技巧
**答案是：你不需要记住所有命令！**

1. **需要时查阅本文档** - 就像你查阅Android文档一样
2. **使用 `--help` 查看帮助** - 例如：`apt --help`、`docker --help`
3. **使用 `man` 命令查看手册** - 例如：`man ls`、`man apt`
4. **保存常用命令到笔记** - 建立自己的命令速查表
5. **理解命令逻辑，而非死记硬背** - 理解"安装"、"启动"、"查看"等操作的本质

**实际工作中，大多数开发者也是需要时查阅文档的！**

---

## 为什么要部署到云服务器？

在本地开发完成后，我们需要将项目部署到云服务器，让其他人可以通过互联网访问。这就像Android应用开发完成后要上架应用市场一样。

### 云服务器的优势：
+ ✅ 7×24小时在线，不受本地电脑影响
+ ✅ 拥有公网IP，任何人都可以访问
+ ✅ 专业的网络环境和安全防护
+ ✅ 可弹性扩展资源（CPU、内存、带宽）

---

## 准备阿里云服务器

### 2.1 购买阿里云ECS服务器
1. 访问阿里云官网：[https://www.aliyun.com](https://www.aliyun.com)
2. 选择"云服务器ECS"
3. 推荐配置：
   - **实例规格**：2核4GB（入门配置）
   - **操作系统**：Ubuntu 22.04 LTS 64位
   - **公网带宽**：5Mbps（按需选择）
   - **存储**：40GB系统盘 + 数据盘（可选）

### 2.2 获取服务器信息
购买完成后，在阿里云控制台获取：
+ **公网IP地址**：例如 `123.123.123.123`
+ **用户名**：默认是 `root`
+ **密码**：购买时设置的密码（或使用密钥对）

### 2.3 配置安全组规则
在阿里云控制台配置安全组，开放以下端口：

| 端口 | 协议 | 用途 | 说明 |
| --- | --- | --- | --- |
| 22 | TCP | SSH | 远程连接服务器 |
| 8080 | TCP | Spring Boot | 后端API接口 |
| 80 | TCP | HTTP | 网页访问（可选） |
| 443 | TCP | HTTPS | 加密网页访问（可选） |
| 3306 | TCP | MySQL | 数据库（建议仅内网开放） |

**配置步骤：**
1. 进入ECS控制台
2. 点击"网络与安全" → "安全组"
3. 点击"配置规则"
4. 添加入方向规则，开放上述端口

---

## 连接到Ubuntu服务器

### 3.1 Windows系统连接方式

#### 方法1：使用PowerShell或CMD
```bash
ssh root@123.123.123.123
# 输入密码后回车
```

#### 方法2：使用阿里云控制台的"远程连接"
+ 在ECS实例列表，点击"远程连接"
+ 选择"Workbench远程连接"

#### 方法3：使用第三方SSH工具
+ MobaXterm（推荐，功能强大）
+ PuTTY
+ Xshell

### 3.2 验证连接成功
```bash
# 查看系统版本
lsb_release -a

# 查看CPU和内存信息
free -h
lscpu
```

---

## 配置Ubuntu服务器环境

### 4.1 更新系统包
```bash
# 更新软件包列表（类似Gradle sync，获取最新的软件列表）
# sudo: 使用管理员权限执行
# apt: Ubuntu的包管理器（类似Gradle依赖管理）
# update: 更新软件包索引列表
sudo apt update

# 升级已安装的所有软件包到最新版本
# upgrade: 升级已安装的包
# -y: 自动回答"是"，不需要手动确认（重要！避免中途需要输入y/n）
sudo apt upgrade -y
```

**参数详解：**
- `sudo`: 获取root权限执行（类似Android开发中需要root权限才能修改系统文件）
- `apt`: Advanced Package Tool，Ubuntu的软件包管理器
- `update`: 从软件源更新可用软件包的列表（不安装，只是更新列表）
- `upgrade`: 将系统上已安装的软件包升级到最新版本
- `-y`: yes的缩写，表示自动回答所有"是否继续？"的提示

### 4.2 安装Docker
```bash
# 安装Docker所需的依赖包
# apt-transport-https: 允许apt通过HTTPS协议下载包
# ca-certificates: 用于验证HTTPS证书的安全性
# curl: 命令行下载工具（类似Android的网络请求库）
# software-properties-common: 用于管理软件源
# -y: 自动确认安装，不询问
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# 添加Docker官方的GPG密钥（用于验证软件包的真实性）
# curl: 下载工具
# -fsSL: -f(失败时不输出错误), -s(静默模式), -S(显示错误), -L(跟随重定向)
# |: 管道符，将curl的输出传递给下一个命令
# gpg --dearmor: 将密钥转换为二进制格式
# -o: 输出到指定文件
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# 添加Docker官方软件源到系统
# echo: 输出内容
# $(dpkg --print-architecture): 获取系统架构（如amd64, arm64）
# $(lsb_release -cs): 获取Ubuntu版本代号（如focal, jammy）
# |: 管道符
# tee: 将内容写入文件（同时显示在终端）
# > /dev/null: 不显示tee的输出（保持终端整洁）
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 再次更新软件包列表（因为刚添加了新的Docker源）
sudo apt update

# 安装Docker引擎和相关组件
# docker-ce: Docker社区版（Community Edition）
# docker-ce-cli: Docker命令行工具
# containerd.io: 容器运行时
# -y: 自动确认安装
sudo apt install -y docker-ce docker-ce-cli containerd.io

# 验证Docker是否安装成功，查看Docker版本
# --version: 显示版本号
docker --version

# 启动Docker服务（类似Android的startService()）
# systemctl: 系统服务管理工具
# start: 启动服务
sudo systemctl start docker

# 设置Docker开机自动启动（类似Android的系统服务）
# enable: 设置为开机自启动
sudo systemctl enable docker
```

**命令详解：**
| 命令 | 作用 | 类比 |
| --- | --- | --- |
| `curl -fsSL` | 下载文件 | 类似Retrofit发起GET请求 |
| `gpg --dearmor` | 转换密钥格式 | 类似密钥加密处理 |
| `echo \| tee` | 写入文件 | 类似Kotlin的`writeText()` |
| `systemctl start` | 启动服务 | 类似`startService()` |
| `systemctl enable` | 开机自启 | 类似设置系统启动项 |

**参数详解：**
- `-f`: fail silently (遇到错误静默失败)
- `-s`: silent mode (静默模式，不显示进度)
- `-S`: show error (显示错误信息)
- `-L`: follow redirect (跟随HTTP重定向)
- `-y`: yes (自动回答"是")

### 4.3 安装Docker Compose

#### 方法1：通过包管理器安装（最简单，强烈推荐！）
```bash
# 更新软件包列表
sudo apt update

# 通过apt安装Docker Compose插件
# docker-compose-plugin: Docker Compose的apt包版本
# -y: 自动确认安装
sudo apt install -y docker-compose-plugin

# 验证安装（注意：新版本使用 docker compose 命令，中间是空格，不是横杠）
docker compose version
```

**💡 推荐理由：**
- ✅ 无需手动下载，apt会自动处理依赖
- ✅ 自动更新，随系统升级
- ✅ 速度快，使用apt官方源
- ✅ 命令更简洁（`docker compose` 而非 `docker-compose`）

#### 方法2：从GitHub下载（备选方案）
```bash
# 从GitHub下载Docker Compose二进制文件
# curl: 下载工具
# -L: 跟随重定向（GitHub的下载链接会重定向）
# $(uname -s): 获取操作系统名称（如Linux, Darwin）
# $(uname -m): 获取系统架构（如x86_64, aarch64）
# -o: 输出到指定文件路径
# /usr/local/bin/: 存放用户自定义可执行文件的目录
sudo curl -L "https://github.com/docker/compose/releases/download/v2.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# 赋予Docker Compose可执行权限（类似Android中设置文件为可执行）
# chmod: 修改文件权限（change mode）
# +x: 添加执行权限（x表示execute）
sudo chmod +x /usr/local/bin/docker-compose

# 验证Docker Compose是否安装成功，查看版本号
docker-compose --version
```

**如果下载速度慢，可以使用国内镜像源：**
```bash
# 使用ghproxy镜像加速GitHub下载
sudo curl -L "https://mirror.ghproxy.com/https://github.com/docker/compose/releases/download/v2.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# 下载后别忘了赋予执行权限
sudo chmod +x /usr/local/bin/docker-compose
```

#### 方法3：手动下载后上传（适合网络环境特别差的情况）
```bash
# 在Windows本地电脑浏览器下载文件
# 下载地址：https://github.com/docker/compose/releases
# 选择对应版本，如：docker-compose-linux-x86_64

# 使用WinSCP或scp命令上传到服务器后执行：
# mv: 移动/重命名文件（move）
sudo mv docker-compose-linux-x86_64 /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

### 4.4 安装JDK 17（可选，用于直接运行JAR）
```bash
# 安装OpenJDK 17（Java开发工具包）
# openjdk-17-jdk: OpenJDK的JDK包，包含编译和运行Java程序的工具
# -y: 自动确认安装
# 💡 如果只需要运行JAR，可以只安装jre（Java Runtime Environment）
sudo apt install -y openjdk-17-jdk

# 验证Java是否安装成功，查看Java版本
# java: Java运行时命令
# -version: 显示Java版本信息
java -version
```

**说明：**
- `jdk`: Java Development Kit（开发工具包）- 包含编译器、调试器等
- `jre`: Java Runtime Environment（运行时环境）- 仅包含运行Java程序所需
- `-y`: 自动回答"yes"，避免安装过程中询问确认

**如果使用Docker运行Spring Boot，这一步可以跳过！**

### 4.5 安装Git
```bash
# 安装Git版本控制工具（类似Android Studio的VCS）
# git: 分布式版本控制系统
# -y: 自动确认安装
sudo apt install -y git

# 验证Git是否安装成功，查看Git版本
git --version
```

**说明：**
- Git是从GitHub/Gitee拉取代码的必备工具
- 类似Android Studio内置的Git功能，但这是命令行版本

---

## 部署项目到服务器

### 5.1 创建项目目录
```bash
# 创建项目目录（如果不存在则创建，包括父目录）
# mkdir: 创建目录（make directory），类似Android的File.mkdir()
# -p: parent的缩写，创建多级目录（类似Android的File.mkdirs()）
# /opt: Linux系统中存放可选软件包的标准目录
mkdir -p /opt/spring-projects

# 切换到项目目录
# cd: 改变当前目录（change directory），类似Android的进入某个文件夹
cd /opt/spring-projects
```

**命令详解：**
| 命令 | 作用 | Android类比 |
| --- | --- | --- |
| `mkdir /opt/spring-projects` | 创建单级目录 | `File("/opt/spring-projects").mkdir()` |
| `mkdir -p /opt/spring-projects` | 创建多级目录 | `File("/opt/spring-projects").mkdirs()` |
| `cd /opt/spring-projects` | 进入目录 | 打开文件管理器进入某个文件夹 |

**参数详解：**
- `-p`: 创建父目录（如果 `/opt` 不存在也会一并创建）
- `/opt`: Linux文件系统的标准目录之一，用于存放第三方软件

### 5.2 上传项目文件

#### 方法1：使用Git（推荐）
```bash
# 如果项目已上传到GitHub/Gitee，可以直接克隆
# cd: 切换到项目目录
cd /opt/spring-projects

# git clone: 从远程仓库克隆项目到本地
# 类似Android Studio的"Checkout from Version Control"
# 将your-username替换为你的GitHub用户名
git clone https://github.com/your-username/multifunctional-backend.git

# 进入克隆下来的项目目录
cd multifunctional-backend
```

**命令详解：**
- `git clone`: 克隆（下载）远程Git仓库到本地
- `cd`: 切换当前工作目录

#### 方法2：使用SCP上传（从本地Windows电脑）

在Windows PowerShell中执行：
```powershell
# 上传整个项目目录到服务器
# scp: Secure Copy（安全复制），通过SSH协议传输文件
# -r: recursive（递归），复制整个目录及其子目录
# E:\SpringProjects\...: 本地项目路径
# root@123.123.123.123: 服务器用户名和IP地址
# :/opt/spring-projects/: 服务器目标路径
scp -r E:\SpringProjects\multifunctional-backend root@123.123.123.123:/opt/spring-projects/

# 或者只上传编译好的JAR文件（更快）
scp E:\SpringProjects\multifunctional-backend\target\multifunctional-backend-0.0.1-SNAPSHOT.jar root@123.123.123.123:/opt/spring-projects/
```

**命令详解：**
- `scp`: 通过SSH安全地复制文件（Secure Copy Protocol）
- `-r`: 递归复制整个目录（类似复制文件夹及其所有内容）
- `root@123.123.123.123`: 服务器登录信息
- `:` 后面是服务器上的目标路径

#### 方法3：使用MobaXterm的拖拽上传（最简单！）
+ 打开MobaXterm连接服务器
+ 左侧会显示文件浏览器（类似Windows资源管理器）
+ 直接拖拽项目文件到服务器目录（就像复制粘贴文件一样）

### 5.3 修改配置文件
编辑 `application.properties`，修改数据库和Redis连接地址：

```bash
# 进入项目目录
cd /opt/spring-projects/multifunctional-backend

# 使用nano文本编辑器打开配置文件
# nano: Linux的轻量级文本编辑器（类似Windows的记事本）
nano src/main/resources/application.properties
```

**nano编辑器使用说明：**
- 使用方向键移动光标
- 直接输入文字进行编辑
- `Ctrl + X`: 退出编辑器
- 按 `Y`: 确认保存修改
- 按 `Enter`: 确认文件名

修改为服务器的localhost（因为使用Docker）：
```properties
# 数据库配置（保持localhost，因为Docker容器在同一主机）
spring.datasource.url=jdbc:mysql://localhost:3306/filedb?useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Shanghai&useSSL=false&allowPublicKeyRetrieval=true

# Redis配置（保持localhost）
spring.data.redis.host=localhost

# MinIO配置（保持localhost）
minio.endpoint=http://localhost:9000
```

按 `Ctrl + X`，然后按 `Y`，回车保存。

---

## 启动Docker服务

### 6.1 启动MySQL、Redis、MinIO
```bash
# 进入项目目录
cd /opt/spring-projects/multifunctional-backend

# 启动所有Docker服务（后台运行）
# docker-compose: Docker多容器编排工具
# up: 启动服务（类似Android的startService()）
# -d: detached模式，后台运行（类似Android的后台Service）
docker-compose up -d

# 查看所有容器的运行状态
# ps: process status，查看进程状态
docker-compose ps

# 查看所有容器的日志输出
# logs: 显示容器日志
# -f: follow，实时跟随日志输出（类似Android的Logcat）
docker-compose logs -f
```

**命令详解：**
| 命令 | 作用 | Android类比 |
| --- | --- | --- |
| `docker-compose up -d` | 后台启动所有容器 | `startService()` 启动后台服务 |
| `docker-compose ps` | 查看容器状态 | 查看正在运行的应用 |
| `docker-compose logs -f` | 实时查看日志 | Android Studio的Logcat |
| `-d` | detached（分离模式） | 后台运行，不占用终端 |

**预期输出：**
```plain
✔ Container filedb-mysql  Started
✔ Container filedb-redis  Started
✔ Container filedb-minio  Started
```

### 6.2 验证Docker服务
```bash
# 验证MySQL是否正常运行
# docker exec: 在运行中的容器内执行命令
# -it: -i(interactive 交互式) + -t(tty 分配终端)
# filedb-mysql: 容器名称
# mysql -uroot -proot123: MySQL客户端命令，用户名root，密码root123
# -e: execute，执行SQL语句
docker exec -it filedb-mysql mysql -uroot -proot123 -e "SHOW DATABASES;"

# 验证Redis是否正常运行
# redis-cli: Redis客户端
# ping: 测试Redis连接（正常会返回PONG）
docker exec -it filedb-redis redis-cli ping

# 测试MinIO Web界面是否可访问
# curl: 发送HTTP请求（类似Retrofit）
curl http://localhost:9001
```

**命令详解：**
- `docker exec`: 在运行中的容器内执行命令（类似进入应用内部操作）
- `-it`: 交互式终端模式
- `mysql -u -p`: 连接MySQL数据库（-u指定用户，-p指定密码）
- `redis-cli ping`: 测试Redis连接

---

## 启动Spring Boot应用

### 7.1 方法1：直接运行JAR（快速测试）
```bash
# 进入项目目录
cd /opt/spring-projects/multifunctional-backend

# 如果有源码，先打包项目
# mvn: Maven命令（类似Android的Gradle）
# clean: 清理之前的编译结果
# package: 打包项目为JAR文件
# -DskipTests: 跳过测试（D表示Define定义参数）
mvn clean package -DskipTests

# 前台运行JAR（会占用当前终端，适合测试）
# java: Java运行命令
# -jar: 指定运行JAR文件
java -jar target/multifunctional-backend-0.0.1-SNAPSHOT.jar

# 或者后台运行（推荐生产环境）
# nohup: no hang up，即使终端关闭也继续运行
# >: 重定向标准输出到文件
# app.log: 日志文件名
# 2>&1: 将标准错误（2）重定向到标准输出（1）
# &: 后台运行
nohup java -jar target/multifunctional-backend-0.0.1-SNAPSHOT.jar > app.log 2>&1 &

# 查看日志（实时）
# tail: 查看文件末尾内容
# -f: follow，实时跟随日志更新
tail -f app.log
```

**命令详解：**
| 命令部分 | 含义 | 说明 |
| --- | --- | --- |
| `mvn clean package` | Maven打包 | 类似Gradle的build |
| `-DskipTests` | 跳过测试 | 加快打包速度 |
| `nohup ... &` | 后台运行 | 终端关闭后程序继续运行 |
| `> app.log` | 输出重定向 | 将输出保存到日志文件 |
| `2>&1` | 错误重定向 | 将错误信息也写入日志文件 |
| `tail -f` | 实时查看日志 | 类似Android的Logcat |

### 7.2 方法2：使用systemd服务（推荐，开机自启）
创建systemd服务文件：

```bash
# 创建/编辑systemd服务配置文件
# /etc/systemd/system/: 系统服务配置目录
sudo nano /etc/systemd/system/spring-backend.service
```

添加以下内容：
```ini
[Unit]
# 服务描述
Description=Spring Boot Backend Service
# 在哪些服务之后启动（确保日志系统、网络、Docker都已就绪）
After=syslog.target network.target docker.service

[Service]
# 运行服务的用户
User=root
# 工作目录
WorkingDirectory=/opt/spring-projects/multifunctional-backend
# 启动命令
ExecStart=/usr/bin/java -jar /opt/spring-projects/multifunctional-backend/target/multifunctional-backend-0.0.1-SNAPSHOT.jar
# 成功退出的状态码（143是SIGTERM信号）
SuccessExitStatus=143
# 崩溃后自动重启
Restart=always
# 重启前等待时间（秒）
RestartSec=10

[Install]
# 在哪个目标下启用此服务（多用户模式）
WantedBy=multi-user.target
```

启动服务：
```bash
# 重新加载systemd配置（让系统识别新的服务文件）
# daemon-reload: 重新加载守护进程配置
sudo systemctl daemon-reload

# 启动Spring Boot服务（类似Android的startService()）
# start: 启动服务
sudo systemctl start spring-backend

# 设置开机自动启动（类似Android的系统服务）
# enable: 启用开机自启
sudo systemctl enable spring-backend

# 查看服务运行状态
# status: 查看状态（包含运行信息、日志等）
sudo systemctl status spring-backend

# 查看服务日志（实时）
# journalctl: 系统日志查看工具
# -u: unit，指定服务名称
# -f: follow，实时跟随
sudo journalctl -u spring-backend -f
```

**systemctl常用命令（重要！）：**
```bash
# 启动服务（类似Android的startService()）
sudo systemctl start spring-backend

# 停止服务（类似Android的stopService()）
sudo systemctl stop spring-backend

# 重启服务（先停止再启动）
sudo systemctl restart spring-backend

# 查看服务状态（是否运行、PID、内存使用等）
sudo systemctl status spring-backend

# 设置开机自启（类似Android的BOOT_COMPLETED）
sudo systemctl enable spring-backend

# 取消开机自启
sudo systemctl disable spring-backend

# 查看服务日志
sudo journalctl -u spring-backend -f
```

**命令详解：**
| 命令 | 作用 | Android类比 |
| --- | --- | --- |
| `systemctl start` | 启动服务 | `startService()` |
| `systemctl stop` | 停止服务 | `stopService()` |
| `systemctl restart` | 重启服务 | stop + start |
| `systemctl status` | 查看状态 | 查看Service是否运行 |
| `systemctl enable` | 开机自启 | 设置BOOT_COMPLETED接收器 |
| `systemctl daemon-reload` | 重载配置 | 让系统识别配置更改 |
| `journalctl -u` | 查看日志 | Logcat查看特定tag |

### 7.3 方法3：使用Docker运行Spring Boot（可选）
创建Spring Boot的Dockerfile：

```bash
cd /opt/spring-projects/multifunctional-backend
nano Dockerfile
```

添加内容：
```dockerfile
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY target/multifunctional-backend-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
```

修改 `docker-compose.yml`，添加Spring Boot服务：
```yaml
services:
  # ... 其他服务（mysql、redis、minio）

  # Spring Boot应用
  backend:
    build: .
    container_name: spring-backend
    ports:
      - "8080:8080"
    environment:
      SPRING_DATASOURCE_URL: jdbc:mysql://mysql:3306/filedb?useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Shanghai&useSSL=false&allowPublicKeyRetrieval=true
      SPRING_REDIS_HOST: redis
      MINIO_ENDPOINT: http://minio:9000
    depends_on:
      - mysql
      - redis
      - minio
    networks:
      - filedb-network
```

构建并启动：
```bash
# 构建镜像
docker-compose build

# 启动所有服务（包括Spring Boot）
docker-compose up -d

# 查看日志
docker-compose logs -f backend
```

---

## 配置防火墙

Ubuntu默认使用UFW防火墙，需要开放端口：

```bash
# 启用UFW防火墙（Uncomplicated Firewall，简单防火墙）
# ufw: Ubuntu的防火墙管理工具
# enable: 启用防火墙
# ⚠️ 警告：启用前确保先开放SSH端口22，否则会被锁在外面！
sudo ufw enable

# 开放SSH端口（最重要！防止无法远程连接服务器）
# allow: 允许
# 22/tcp: 22端口，TCP协议（SSH默认端口）
sudo ufw allow 22/tcp

# 开放Spring Boot应用端口
# 8080/tcp: 8080端口，Spring Boot默认端口
sudo ufw allow 8080/tcp

# 开放HTTP/HTTPS端口（如果需要部署Web前端）
# 80: HTTP默认端口
# 443: HTTPS默认端口
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp

# 查看防火墙状态和规则
# status: 查看状态
sudo ufw status

# 查看详细规则（带编号）
# numbered: 显示规则编号（便于删除特定规则）
sudo ufw status numbered

# 删除某条规则（可选）
# delete: 删除规则
# 例如：sudo ufw delete 3  # 删除编号为3的规则
```

**命令详解：**
| 命令 | 作用 | 说明 |
| --- | --- | --- |
| `ufw enable` | 启用防火墙 | 开启端口访问控制 |
| `ufw allow 端口/协议` | 开放端口 | 允许外部访问该端口 |
| `ufw status` | 查看状态 | 显示防火墙规则 |
| `ufw delete 编号` | 删除规则 | 删除指定规则 |

**⚠️ 重要提醒：**
1. **必须先开放SSH端口22**，否则会被锁在服务器外面
2. 阿里云的**安全组规则优先级更高**，确保安全组也已开放相应端口
3. 防火墙规则立即生效，无需重启

**注意：** 阿里云的安全组规则优先级更高，确保安全组也已开放相应端口！

---

## 测试接口访问

### 9.1 在服务器本地测试
```bash
# 健康检查接口测试
# curl: 发送HTTP请求（类似Retrofit）
# localhost: 本地回环地址（127.0.0.1）
curl http://localhost:8080/api/files/health

# 获取文件列表接口测试
# ?page=1&size=10: 查询参数（第1页，每页10条）
curl http://localhost:8080/api/files?page=1&size=10
```

**命令详解：**
- `curl`: 命令行HTTP客户端，用于测试API接口
- `localhost`: 本地回环地址，只能在服务器内部访问
- `http://...`: 完整的API接口地址

### 9.2 从外网测试（使用公网IP）
在你的Windows电脑或手机上访问：

**使用浏览器：**
```
http://123.123.123.123:8080/api/files/health
http://123.123.123.123:8080/doc.html
```

**使用curl：**
```powershell
# Windows PowerShell
curl http://123.123.123.123:8080/api/files/health
```

**使用Postman：**
1. 打开Postman
2. 创建新请求
3. 方法：GET
4. URL：`http://123.123.123.123:8080/api/files/health`
5. 点击"Send"

**预期响应：**
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

### 9.3 测试文件上传
使用Postman测试文件上传：

```
POST http://123.123.123.123:8080/api/files/upload
Body: form-data
  - key: file, type: File, value: 选择文件
```

### 9.4 使用手机测试
在手机浏览器中访问：
```
http://123.123.123.123:8080/doc.html
```

如果能看到API文档页面，说明部署成功！

---

## 常见问题排查

### 问题1：无法从外网访问
**检查清单：**
```bash
# 1. 检查Spring Boot是否启动
sudo systemctl status spring-backend
# 或
ps aux | grep java

# 2. 检查端口是否监听
sudo netstat -tulpn | grep 8080
# 或
sudo ss -tulpn | grep 8080

# 3. 检查防火墙
sudo ufw status

# 4. 检查阿里云安全组
# 登录阿里云控制台查看安全组规则
```

**解决方案：**
+ 确保Spring Boot正常启动（查看日志）
+ 确保UFW开放8080端口
+ 确保阿里云安全组开放8080端口
+ 确保使用正确的公网IP地址

### 问题2：Docker服务无法启动
```bash
# 查看Docker服务状态
sudo systemctl status docker

# 启动Docker
sudo systemctl start docker

# 查看Docker日志
sudo journalctl -u docker -f
```

### 问题3：数据库连接失败
```bash
# 检查MySQL容器是否运行
docker ps | grep mysql

# 查看MySQL日志
docker logs filedb-mysql

# 进入MySQL容器测试连接
docker exec -it filedb-mysql mysql -uroot -proot123
```

### 问题4：内存不足
```bash
# 查看内存使用情况
free -h

# 查看进程内存占用
top

# 如果内存不足，可以限制Spring Boot内存
java -Xmx512m -Xms256m -jar app.jar
```

---

## 性能优化建议

### 11.1 配置JVM参数
修改systemd服务文件，添加JVM参数：

```bash
sudo nano /etc/systemd/system/spring-backend.service
```

修改ExecStart行：
```ini
ExecStart=/usr/bin/java -Xmx1024m -Xms512m -XX:+UseG1GC -jar /opt/spring-projects/multifunctional-backend/target/multifunctional-backend-0.0.1-SNAPSHOT.jar
```

参数说明：
+ `-Xmx1024m`：最大堆内存1GB
+ `-Xms512m`：初始堆内存512MB
+ `-XX:+UseG1GC`：使用G1垃圾回收器

### 11.2 配置生产环境配置文件
创建生产环境配置：

```bash
nano src/main/resources/application-prod.properties
```

添加内容：
```properties
# 关闭SQL日志（提升性能）
mybatis-plus.configuration.log-impl=

# 日志级别调整为info
logging.level.com.zzy.multifunctional_backend=info

# 连接池配置优化
spring.datasource.hikari.maximum-pool-size=20
spring.datasource.hikari.minimum-idle=5
```

启动时指定配置：
```bash
java -jar app.jar --spring.profiles.active=prod
```

---

## 配置域名访问（可选）

### 12.1 购买域名
在阿里云或其他域名服务商购买域名，例如：`mybackend.com`

### 12.2 配置DNS解析
在域名管理控制台添加A记录：
```
记录类型：A
主机记录：@ 或 www
记录值：123.123.123.123（你的公网IP）
TTL：10分钟
```

### 12.3 安装Nginx反向代理
```bash
# 安装Nginx
sudo apt install -y nginx

# 创建配置文件
sudo nano /etc/nginx/sites-available/backend
```

添加配置：
```nginx
server {
    listen 80;
    server_name mybackend.com www.mybackend.com;

    location / {
        proxy_pass http://localhost:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

启用配置：
```bash
# 创建软链接
sudo ln -s /etc/nginx/sites-available/backend /etc/nginx/sites-enabled/

# 测试配置
sudo nginx -t

# 重启Nginx
sudo systemctl restart nginx

# 设置开机自启
sudo systemctl enable nginx
```

现在可以通过域名访问：`http://mybackend.com/api/files/health`

### 12.4 配置HTTPS（推荐）
使用Let's Encrypt免费SSL证书：

```bash
# 安装Certbot
sudo apt install -y certbot python3-certbot-nginx

# 自动配置HTTPS
sudo certbot --nginx -d mybackend.com -d www.mybackend.com

# 测试自动续期
sudo certbot renew --dry-run
```

现在可以通过HTTPS访问：`https://mybackend.com/api/files/health`

---

## 监控和日志管理

### 13.1 查看应用日志
```bash
# 如果使用systemd
sudo journalctl -u spring-backend -f

# 如果使用nohup
tail -f /opt/spring-projects/multifunctional-backend/app.log

# 如果使用Docker
docker logs -f spring-backend
```

### 13.2 配置日志轮转
创建日志轮转配置：

```bash
sudo nano /etc/logrotate.d/spring-backend
```

添加内容：
```
/opt/spring-projects/multifunctional-backend/app.log {
    daily
    rotate 7
    compress
    delaycompress
    missingok
    notifempty
    create 644 root root
}
```

### 13.3 监控服务器资源
```bash
# 实时监控
htop

# 如果没有htop，先安装
sudo apt install -y htop

# 查看磁盘使用
df -h

# 查看Docker资源占用
docker stats
```

---

## 部署检查清单

完成部署后，请确认以下项目：

- [ ] Docker服务正常运行（MySQL、Redis、MinIO）
- [ ] Spring Boot应用正常启动
- [ ] 本地可以访问 `localhost:8080`
- [ ] 外网可以访问 `公网IP:8080`
- [ ] 安全组规则配置正确
- [ ] UFW防火墙规则配置正确
- [ ] API接口测试通过
- [ ] 文件上传功能正常
- [ ] 文件下载功能正常
- [ ] 数据库数据持久化正常
- [ ] 配置开机自启动

---

## 总结

完成本指南后，你应该：

+ ✅ 掌握阿里云ECS服务器的购买和配置
+ ✅ 学会在Ubuntu上安装Docker和Docker Compose
+ ✅ 了解如何上传项目到服务器
+ ✅ 掌握使用systemd管理Spring Boot应用
+ ✅ 学会配置防火墙和安全组
+ ✅ 能够从外网访问和测试API接口
+ ✅ 了解基本的性能优化和监控方法
+ ✅ 掌握基本的Linux命令操作

**恭喜！你的Spring Boot项目已经成功部署到云服务器上了！** 🎉

现在，你可以：
1. 分享API地址给团队成员或前端开发者
2. 开发Android/Web前端对接这些API
3. 继续完善项目功能
4. 学习更多运维知识（日志监控、自动化部署等）

---

## 附录：常用命令速查

### 系统管理
```bash
# 更新系统
sudo apt update && sudo apt upgrade -y

# 查看系统信息
uname -a
lsb_release -a

# 查看资源使用
free -h
df -h
top
htop
```

### Docker管理
```bash
# 查看容器
docker ps
docker ps -a

# 查看日志
docker logs -f <container_name>

# 进入容器
docker exec -it <container_name> bash

# 清理
docker system prune -a
```

### 服务管理
```bash
# 查看服务状态
sudo systemctl status <service_name>

# 启动/停止/重启服务
sudo systemctl start/stop/restart <service_name>

# 查看服务日志
sudo journalctl -u <service_name> -f
```

### 网络诊断
```bash
# 测试端口
telnet localhost 8080
curl http://localhost:8080

# 查看端口监听
sudo netstat -tulpn
sudo ss -tulpn
```

---

**祝你部署顺利！如有问题，请查阅本文档的故障排查章节。**

