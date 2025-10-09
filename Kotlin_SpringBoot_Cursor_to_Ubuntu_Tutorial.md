# Kotlin + Spring Boot 从零到部署（Cursor / VS Code + Ubuntu）超详细教程

本教程专为 **使用 Cursor 或 VS Code 的开发者** 设计，目标是：

*   在 Windows 本地用 **Kotlin + Spring Boot** 编写后端网站；
*   部署到 **Ubuntu 云服务器**；
*   支持公网访问。

***

## 🧩 第一章：准备环境

### 1️⃣ 安装 JDK 17

Spring Boot 3.x 及 Kotlin 运行在 JDK 17+。\
下载地址：<https://adoptium.net/>

安装后验证：

```bash
java -version
```

输出：

    openjdk version "17.0.x" 2024-xx-xx LTS

说明安装成功。

***

### 2️⃣ 安装 VS Code / Cursor

下载地址：

*   VS Code：<https://code.visualstudio.com/>
*   Cursor：<https://cursor.sh/>

***

### 3️⃣ 安装必要插件

打开扩展（Ctrl + Shift + X），搜索并安装：

| 插件名                                      | 作用                                 |
| :--------------------------------------- | :--------------------------------- |
| Kotlin Language                          | Kotlin 语法高亮、类型检查、代码提示              |
| Spring Boot Extension Pack               | Spring Boot 项目创建、运行支持              |
| Extension Pack for Java                  | Java / Maven 支持（Kotlin 项目仍用 Maven） |
| Maven for Java                           | Maven 项目构建支持                       |
| Language Support for Java(TM) by Red Hat | 提供语言服务支持                           |

安装完成后 **重启 Cursor**。

***

## 🚀 第二章：创建 Kotlin + Spring Boot 项目

Cursor 里暂时无法通过命令行生成 Kotlin 项目，我们用 **Spring Initializr** 在线生成。

### 1️⃣ 打开官网

👉 <https://start.spring.io>

### 2️⃣ 参数设置

*   **Project**：Maven Project
*   **Language**：Kotlin
*   **Spring Boot**：3.x 最新版
*   **Group**：`com.example`
*   **Artifact**：`demo`
*   **Packaging**：Jar
*   **Java Version**：17
*   **Dependencies**：Spring Web, Spring Boot DevTools

点击 **GENERATE** → 下载 zip 文件。

### 3️⃣ 导入项目

解压 zip → 打开 Cursor → **Open Folder** → 选择解压后的目录。\
Cursor 会自动识别 Maven 项目并索引。

***

## 📁 第三章：项目结构

    demo/
     ├── src/
     │   ├── main/
     │   │   ├── kotlin/com/example/demo/
     │   │   │   ├── DemoApplication.kt
     │   │   │   └── HelloController.kt
     │   │   └── resources/application.properties
     │   └── test/
     ├── pom.xml

***

## ✏️ 第四章：编写后端代码

### 1️⃣ DemoApplication.kt

```kotlin
package com.example.demo

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class DemoApplication

fun main(args: Array<String>) {
    runApplication<DemoApplication>(*args)
}
```

### 2️⃣ HelloController.kt

```kotlin
package com.example.demo

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class HelloController {
    @GetMapping("/")
    fun hello(): String {
        return "Hello！这是我用 Kotlin + Spring Boot 写的第一个网站！"
    }
}
```

***

## ▶️ 第五章：运行项目（本地）

在 Cursor 终端中执行：

```bash
mvn spring-boot:run
```

当出现类似日志：

    Started DemoApplication in 2.345 seconds

打开浏览器访问：\
👉 <http://localhost:8080>

页面显示：

> Hello！这是我用 Kotlin + Spring Boot 写的第一个网站！

***

## 📦 第六章：打包项目

打包命令：

```bash
mvn clean package
```

生成可运行的 jar：

    target/demo-0.0.1-SNAPSHOT.jar

测试运行：

```bash
java -jar target/demo-0.0.1-SNAPSHOT.jar
```

***

## 🌐 第七章：部署到 Ubuntu 云服务器

### 1️⃣ 登录服务器

```bash
ssh root@<你的云服务器IP>
```

### 2️⃣ 安装 JDK

```bash
apt update
apt install -y openjdk-17-jdk
java -version
```

### 3️⃣ 上传项目

在本地 PowerShell 执行：

```bash
scp target/demo-0.0.1-SNAPSHOT.jar root@<服务器IP>:/root/
```

### 4️⃣ 启动项目

```bash
java -jar /root/demo-0.0.1-SNAPSHOT.jar
```

访问：\
👉 http\://<服务器公网IP>:8080

***

## 🧱 第八章：配置 Nginx 反向代理

### 1️⃣ 安装 Nginx

```bash
apt install -y nginx
```

### 2️⃣ 配置代理

```bash
nano /etc/nginx/sites-available/springboot
```

写入：

    server {
        listen 80;
        server_name yourdomain.com;

        location / {
            proxy_pass http://127.0.0.1:8080;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
        }
    }

启用并重启：

```bash
ln -s /etc/nginx/sites-available/springboot /etc/nginx/sites-enabled/
nginx -t
systemctl restart nginx
```

访问 `http://yourdomain.com` 即可。

***

## 🔒 第九章：配置 HTTPS（Let's Encrypt）

```bash
apt install -y certbot python3-certbot-nginx
certbot --nginx -d yourdomain.com
```

访问：\
👉 <https://yourdomain.com>

***

## ⚙️ 第十章：设置 systemd 后台运行

```bash
nano /etc/systemd/system/kotlinboot.service
```

写入：

    [Unit]
    Description=Kotlin Spring Boot Service
    After=network.target

    [Service]
    User=root
    ExecStart=/usr/bin/java -jar /root/demo-0.0.1-SNAPSHOT.jar
    Restart=always

    [Install]
    WantedBy=multi-user.target

执行：

```bash
systemctl daemon-reload
systemctl enable kotlinboot
systemctl start kotlinboot
systemctl status kotlinboot
```

项目现在会在服务器重启后自动启动。

***

## 🧠 第十一章：可选功能

### ✅ 连接 MySQL

1.  安装数据库：

```bash
apt install -y mysql-server
```

1.  在 `application.properties` 配置：

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/demo
spring.datasource.username=root
spring.datasource.password=你的密码
spring.jpa.hibernate.ddl-auto=update
```

### ✅ 使用热重载

VS Code 安装 `Spring Boot DevTools` 后，修改代码会自动重启项目。

***

## ✅ 第十二章：总结

| 阶段      | 目标                                   |
| ------- | ------------------------------------ |
| 本地开发    | 用 Kotlin + Spring Boot 在 Cursor 创建网站 |
| 打包测试    | 生成 jar 包验证本地运行                       |
| 云端部署    | 上传到 Ubuntu 并运行                       |
| Nginx   | 提供域名访问                               |
| HTTPS   | 免费证书自动续期                             |
| systemd | 后台常驻服务                               |

🎉 恭喜你！你已掌握用 **Kotlin + Spring Boot** 从本地开发到线上部署的完整流程。
