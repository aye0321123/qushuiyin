@echo off
echo ========================================
echo   无痕视频去水印工具 - 本地服务器
echo ========================================
echo.
echo 正在启动服务器...
echo.

REM 检查Python是否安装
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [错误] 未检测到Python，请先安装Python
    echo 下载地址: https://www.python.org/downloads/
    pause
    exit /b
)

REM 获取本机IP地址
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4"') do (
    set IP=%%a
    goto :found
)
:found
set IP=%IP:~1%

echo ========================================
echo 服务器已启动！
echo ========================================
echo.
echo 电脑访问地址:
echo   http://localhost:8000
echo   http://127.0.0.1:8000
echo.
echo 手机访问地址（确保手机和电脑在同一WiFi）:
echo   http://%IP%:8000
echo.
echo 用户端: http://%IP%:8000/index.html
echo 管理端: http://%IP%:8000/admin.html
echo.
echo ========================================
echo 按 Ctrl+C 停止服务器
echo ========================================
echo.

REM 启动Python HTTP服务器
python -m http.server 8000

pause
