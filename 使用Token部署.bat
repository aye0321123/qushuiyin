@echo off
chcp 65001 >nul
title 使用 Token 部署到 GitHub
color 0A

echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║          🚀 使用 Token 部署到 GitHub                  ║
echo ╚════════════════════════════════════════════════════════╝
echo.

REM 检查 Git 是否安装
git --version >nul 2>&1
if errorlevel 1 (
    echo ❌ 未安装 Git
    echo.
    echo 💡 请使用网页编辑方式：
    echo 1. 访问：https://github.com/aye0321123/qushuiyin/edit/main/qushuiyin/index.html
    echo 2. 复制本地 index.html 内容
    echo 3. 粘贴并提交
    echo.
    pause
    exit /b
)

echo ✅ Git 已安装
git --version
echo.

REM 检查是否在 Git 仓库中
if not exist ".git" (
    echo 🔧 正在初始化 Git 仓库...
    git init
    git branch -M main
    echo ✅ 初始化完成
    echo.
)

REM 配置 Git（如果还没配置）
git config user.name >nul 2>&1
if errorlevel 1 (
    echo 🔧 正在配置 Git...
    git config --global user.name "aye0321123"
    git config --global user.email "aye0321123@users.noreply.github.com"
    echo ✅ 配置完成
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

REM 设置远程仓库（使用 Token）
set /p TOKEN="请粘贴您的新 Token（已撤销旧的）: "

git remote remove origin >nul 2>&1
git remote add origin https://%TOKEN%@github.com/aye0321123/qushuiyin.git

git push -u origin main --force

if errorlevel 1 (
    echo.
    echo ❌ 推送失败
    echo.
    echo 💡 可能的原因：
    echo 1. Token 无效或已过期
    echo 2. Token 权限不足（需要 repo 权限）
    echo 3. 网络问题
    echo.
    echo 🔑 请重新生成 Token：
    echo https://github.com/settings/tokens
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

set /p OPEN_SITE="是否打开网站？(Y/N): "
if /i "%OPEN_SITE%"=="Y" (
    start https://aye0321123.github.io/qushuiyin/qushuiyin/
)

echo.
pause
