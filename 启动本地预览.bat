@echo off
chcp 65001 >nul
title 本地预览服务器
color 0A

echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║          📱 本地预览服务器                            ║
echo ╚════════════════════════════════════════════════════════╝
echo.

REM 检查 Python 是否安装
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ 未检测到 Python
    echo.
    echo 正在尝试使用浏览器直接打开...
    echo.
    start index.html
    echo.
    echo ✅ 已在浏览器中打开
    echo.
    echo 💡 提示：
    echo 1. 如果需要在手机上测试，请安装 Python
    echo 2. 下载地址：https://www.python.org/downloads/
    echo.
    pause
    exit /b
)

echo ✅ Python 已安装
python --version
echo.

REM 获取本机 IP 地址
echo 📡 正在获取本机 IP 地址...
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4"') do (
    set IP=%%a
    goto :found
)
:found
set IP=%IP:~1%
echo.
echo ✅ 本机 IP 地址：%IP%
echo.

echo 🚀 正在启动本地服务器...
echo.
echo ┌────────────────────────────────────────────────────────┐
echo │  服务器已启动！                                        │
echo └────────────────────────────────────────────────────────┘
echo.
echo 📱 在电脑上访问：
echo    http://localhost:8000
echo    http://127.0.0.1:8000
echo.
echo 📱 在手机上访问（确保手机和电脑在同一 WiFi）：
echo    http://%IP%:8000
echo.
echo 💡 提示：
echo    - 按 Ctrl+C 停止服务器
echo    - 修改文件后刷新浏览器即可看到效果
echo    - 手机访问时输入上面的地址
echo.
echo ════════════════════════════════════════════════════════
echo.

REM 自动在浏览器中打开
start http://localhost:8000

REM 启动 Python HTTP 服务器
python -m http.server 8000
