@echo off
chcp 65001 >nul
title 快速更新到 GitHub
color 0A

echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║          🚀 快速更新到 GitHub                         ║
echo ╚════════════════════════════════════════════════════════╝
echo.

REM 添加 Git 到 PATH
set PATH=%PATH%;C:\Program Files\Git\bin;C:\Program Files\Git\cmd

echo ✅ Git 已就绪
echo.

echo 📤 添加文件...
git add index.html

echo 📝 提交更改...
git commit -m "添加次数用完弹窗和充值跳转功能"

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

git push -u origin main

if errorlevel 1 (
    echo.
    echo ❌ 推送失败
    echo.
    pause
    exit /b
)

echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║          ✅ 更新成功！                                ║
echo ╚════════════════════════════════════════════════════════╝
echo.
echo 🎉 文件已成功推送到 GitHub
echo.
echo 📍 等待 1-2 分钟后访问：
echo https://aye0321123.github.io/qushuiyin/
echo.

pause
