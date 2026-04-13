@echo off
chcp 65001 >nul
title 自动安装 Git 并部署到 GitHub
color 0A

echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║          🚀 自动安装 Git 并部署                       ║
echo ╚════════════════════════════════════════════════════════╝
echo.

REM 检查 Git 是否已安装
git --version >nul 2>&1
if not errorlevel 1 (
    echo ✅ Git 已安装
    git --version
    echo.
    goto :deploy
)

echo ❌ 未检测到 Git
echo.
echo 📥 正在下载 Git 安装程序...
echo.

REM 创建临时目录
if not exist "%TEMP%\git-installer" mkdir "%TEMP%\git-installer"

REM 下载 Git 安装程序
powershell -Command "& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://github.com/git-for-windows/git/releases/download/v2.43.0.windows.1/Git-2.43.0-64-bit.exe' -OutFile '%TEMP%\git-installer\Git-Setup.exe'}"

if not exist "%TEMP%\git-installer\Git-Setup.exe" (
    echo.
    echo ❌ 下载失败
    echo.
    echo 💡 请手动安装 Git：
    echo 1. 访问：https://git-scm.com/download/win
    echo 2. 下载并安装
    echo 3. 重新运行本脚本
    echo.
    pause
    exit /b
)

echo.
echo ✅ 下载完成
echo.
echo 🔧 正在安装 Git（请稍候，可能需要 2-3 分钟）...
echo.
echo ⚠️ 安装过程中会弹出安装向导，请：
echo    - 全部选择默认选项
echo    - 一直点击 "Next"
echo    - 最后点击 "Install"
echo.

REM 静默安装 Git
"%TEMP%\git-installer\Git-Setup.exe" /VERYSILENT /NORESTART /NOCANCEL /SP- /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS /COMPONENTS="icons,ext\reg\shellhere,assoc,assoc_sh"

echo.
echo ⏳ 等待安装完成...
timeout /t 60 /nobreak >nul

REM 刷新环境变量
call refreshenv >nul 2>&1

REM 验证安装
git --version >nul 2>&1
if errorlevel 1 (
    echo.
    echo ❌ Git 安装可能未完成
    echo.
    echo 💡 请：
    echo 1. 关闭此窗口
    echo 2. 重新打开命令行
    echo 3. 再次运行本脚本
    echo.
    pause
    exit /b
)

echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║          ✅ Git 安装成功！                            ║
echo ╚════════════════════════════════════════════════════════╝
echo.
git --version
echo.

REM 配置 Git
echo 🔧 正在配置 Git...
git config --global user.name "aye0321123"
git config --global user.email "aye0321123@users.noreply.github.com"
git config --global credential.helper store
echo ✅ Git 配置完成
echo.

:deploy
echo ╔════════════════════════════════════════════════════════╗
echo ║          📤 开始部署到 GitHub                         ║
echo ╚════════════════════════════════════════════════════════╝
echo.

REM 检查是否在 Git 仓库中
if not exist ".git" (
    echo 🔧 正在初始化 Git 仓库...
    git init
    git branch -M main
    git remote add origin https://github.com/aye0321123/qushuiyin.git
    echo ✅ 初始化完成
    echo.
)

echo 📤 正在添加文件...
git add index.html

echo 📝 正在提交更改...
git commit -m "优化移动端显示效果 - 改进触摸体验、按钮大小、文字间距"

if errorlevel 1 (
    echo.
    echo ℹ️ 没有检测到文件更改
    echo.
    pause
    exit /b
)

echo.
echo 🚀 正在推送到 GitHub...
echo.
echo ⚠️ 重要提示：
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo   用户名：aye0321123
echo   密码：请使用 Personal Access Token
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
echo 💡 如果没有 Token，请：
echo 1. 访问：https://github.com/settings/tokens
echo 2. 点击 "Generate new token (classic)"
echo 3. 勾选 "repo" 权限
echo 4. 复制生成的 Token
echo 5. 在下方密码处粘贴 Token
echo.

git push -u origin main

if errorlevel 1 (
    echo.
    echo ❌ 推送失败
    echo.
    echo 💡 可能的原因：
    echo 1. 需要 Personal Access Token（不是 GitHub 密码）
    echo 2. Token 权限不足
    echo 3. 网络问题
    echo.
    echo 🔑 获取 Token：
    start https://github.com/settings/tokens
    echo.
    echo 获取 Token 后，请重新运行本脚本
    echo.
    pause
    exit /b
)

echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║          ✅ 部署成功！                                ║
echo ╚════════════════════════════════════════════════════════╝
echo.
echo 🎉 文件已成功推送到 GitHub
echo.
echo 📍 接下来：
echo 1. 等待 1-2 分钟让 GitHub Pages 自动部署
echo 2. 访问：https://aye0321123.github.io/qushuiyin/qushuiyin/
echo 3. 在手机上测试移动端效果
echo.
echo 💡 查看部署状态：
echo https://github.com/aye0321123/qushuiyin/actions
echo.

set /p OPEN_SITE="是否打开网站？(Y/N): "
if /i "%OPEN_SITE%"=="Y" (
    start https://aye0321123.github.io/qushuiyin/qushuiyin/
)

echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo   以后更新只需双击本脚本即可！
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
pause
