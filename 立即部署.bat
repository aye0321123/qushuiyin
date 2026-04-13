@echo off
chcp 65001 >nul
title 立即部署到 GitHub
color 0A

echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║          🚀 立即部署到 GitHub                         ║
echo ╚════════════════════════════════════════════════════════╝
echo.

REM 添加 Git 到 PATH
set PATH=%PATH%;C:\Program Files\Git\bin;C:\Program Files\Git\cmd

echo ✅ Git 已就绪
git --version
echo.

REM 配置 Git
echo 🔧 配置 Git...
git config --global user.name "aye0321123"
git config --global user.email "aye0321123@users.noreply.github.com"
echo ✅ 配置完成
echo.

REM 检查是否在 Git 仓库中
if not exist ".git" (
    echo 🔧 初始化 Git 仓库...
    git init
    git branch -M main
    echo ✅ 初始化完成
    echo.
)

echo 📤 添加文件...
git add index.html

echo 📝 提交更改...
git commit -m "优化移动端显示效果 - 改进触摸体验、按钮大小、文字间距"

if errorlevel 1 (
    echo.
    echo ℹ️ 没有检测到文件更改
    echo.
    pause
    exit /b
)

echo.
echo ⚠️ 重要提示：
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo   请先撤销之前泄露的 Token！
echo   访问：https://github.com/settings/tokens
echo   删除旧 Token，生成新的 Token
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
set /p TOKEN="请粘贴您的新 GitHub Token: "

echo.
echo 🚀 正在推送到 GitHub...
echo.

REM 移除旧的远程仓库配置
git remote remove origin 2>nul

REM 添加新的远程仓库（使用 Token）
git remote add origin https://%TOKEN%@github.com/aye0321123/qushuiyin.git

REM 推送到 GitHub
git push -u origin main --force

if errorlevel 1 (
    echo.
    echo ❌ 推送失败
    echo.
    echo 💡 可能的原因：
    echo 1. Token 无效或已过期
    echo 2. Token 权限不足（需要勾选 repo）
    echo 3. 网络问题
    echo.
    echo 🔑 重新生成 Token：
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
echo 💡 查看部署状态：
echo https://github.com/aye0321123/qushuiyin/actions
echo.

set /p OPEN_SITE="是否打开网站？(Y/N): "
if /i "%OPEN_SITE%"=="Y" (
    start https://aye0321123.github.io/qushuiyin/qushuiyin/
)

echo.
pause
