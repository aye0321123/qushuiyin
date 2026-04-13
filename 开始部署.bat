@echo off
chcp 65001 >nul
title Git 部署工具
color 0A
mode con cols=80 lines=30

:START
cls
echo.
echo ════════════════════════════════════════════════════════════════════════
echo                    🚀 Git 自动部署工具
echo                    GitHub: aye0321123
echo ════════════════════════════════════════════════════════════════════════
echo.
echo.

REM 检查 Git
git --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Git 未安装
    echo.
    echo 请选择操作：
    echo.
    echo    [1] 下载并安装 Git
    echo    [2] 我已安装 Git（重新检测）
    echo    [0] 退出
    echo.
    set /p choice="请输入选项 (0-2): "
    
    if "%choice%"=="1" (
        echo.
        echo 正在打开 Git 下载页面...
        start https://git-scm.com/download/win
        echo.
        echo ════════════════════════════════════════════════════════════════════════
        echo  📝 安装步骤：
        echo  1. 下载完成后，双击安装程序
        echo  2. 安装时全部选择默认选项（一直点 Next）
        echo  3. 安装完成后，关闭所有命令行窗口
        echo  4. 重新运行本脚本
        echo ════════════════════════════════════════════════════════════════════════
        echo.
        pause
        exit
    )
    
    if "%choice%"=="2" goto START
    if "%choice%"=="0" exit
    goto START
)

echo ✅ Git 已安装
git --version
echo.
echo.

REM 检查仓库
if not exist ".git" (
    echo 📦 需要初始化 Git 仓库
    echo.
    echo 仓库名称：qushuiyin
    echo 仓库地址：https://github.com/aye0321123/qushuiyin.git
    echo.
    echo ⚠️ 请确认您已在 GitHub 创建了仓库
    echo.
    set /p created="仓库已创建？(Y/N): "
    
    if /i not "%created%"=="Y" (
        echo.
        echo 正在打开 GitHub 创建仓库页面...
        start https://github.com/new
        echo.
        echo 创建仓库后，重新运行本脚本
        echo.
        pause
        exit
    )
    
    echo.
    echo 正在初始化仓库...
    git init
    git branch -M main
    git remote add origin https://github.com/aye0321123/qushuiyin.git
    echo.
    echo ✅ 仓库初始化完成
    echo.
)

echo 📤 准备推送文件...
echo.

git add -A
git commit -m "部署视频解析工具"

echo.
echo ════════════════════════════════════════════════════════════════════════
echo  🔑 GitHub 认证
echo ════════════════════════════════════════════════════════════════════════
echo.
echo  用户名：aye0321123
echo  密码：使用 Personal Access Token（不是 GitHub 密码）
echo.
echo  Token 获取地址：https://github.com/settings/tokens
echo.
echo ════════════════════════════════════════════════════════════════════════
echo.

set /p need_token="需要打开 Token 设置页面吗？(Y/N): "
if /i "%need_token%"=="Y" start https://github.com/settings/tokens

echo.
echo 🚀 开始推送...
echo.

git push -u origin main

if errorlevel 1 (
    echo.
    echo ⚠️ 推送失败，尝试先拉取...
    git pull origin main --rebase --allow-unrelated-histories
    git push -u origin main
)

if errorlevel 1 (
    echo.
    echo ════════════════════════════════════════════════════════════════════════
    echo  ❌ 推送失败
    echo ════════════════════════════════════════════════════════════════════════
    echo.
    echo  可能原因：
    echo  1. Token 错误或过期
    echo  2. Token 权限不足（需要 repo 权限）
    echo  3. 网络问题
    echo.
    pause
    exit
)

cls
echo.
echo ════════════════════════════════════════════════════════════════════════
echo                    ✅ 推送成功！
echo ════════════════════════════════════════════════════════════════════════
echo.
echo  🎉 文件已成功推送到 GitHub
echo.
echo  📍 下一步：启用 GitHub Pages
echo.
echo  1. 访问：https://github.com/aye0321123/qushuiyin/settings/pages
echo  2. Branch 选择：main
echo  3. Folder 选择：/ (root)
echo  4. 点击 Save
echo.
echo  您的网站地址：
echo  https://aye0321123.github.io/qushuiyin/
echo.
echo ════════════════════════════════════════════════════════════════════════
echo.

set /p open_pages="是否打开 Pages 设置页面？(Y/N): "
if /i "%open_pages%"=="Y" start https://github.com/aye0321123/qushuiyin/settings/pages

echo.
pause
