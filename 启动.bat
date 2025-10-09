@echo off
chcp 65001 >nul
echo ========================================
echo 文件管理系统 - 一键启动脚本
echo ========================================
echo.

echo [1/4] 检查Docker是否启动...
docker version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Docker未启动，请先启动Docker Desktop
    echo.
    echo 解决方法：
    echo 1. 双击桌面的"Docker Desktop"图标
    echo 2. 等待Docker图标不再闪烁
    echo 3. 重新运行本脚本
    echo.
    pause
    exit /b 1
)
echo ✅ Docker已启动

echo.
echo [2/4] 启动数据库和存储服务...
docker-compose up -d
if %errorlevel% neq 0 (
    echo ❌ Docker服务启动失败
    pause
    exit /b 1
)
echo ✅ Docker服务启动成功

echo.
echo [3/4] 等待服务就绪...
echo 请稍候10秒...
timeout /t 10 /nobreak >nul

echo.
echo [4/4] 查看服务状态...
docker-compose ps

echo.
echo ========================================
echo 准备启动Spring Boot应用...
echo ========================================
echo.
echo ⚠️  首次启动会下载依赖包（5-15分钟），请耐心等待
echo ⚠️  启动成功后访问：http://localhost:8080/doc.html
echo.
echo 按任意键开始启动应用...
pause >nul

echo.
echo 正在启动应用...
mvn spring-boot:run

pause

