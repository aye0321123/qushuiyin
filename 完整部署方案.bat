@echo off
chcp 65001 >nul
title Git 自动部署工具 - aye0321123
color 0A

:MAIN_MENU
cls
echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║          🚀 Git 自动部署工具                          ║
echo ║          GitHub: aye0321123                           ║
echo ╚════════════════════════════════════════════════════════╝
echo.

REM 检查 Git 是否安装
git --version >nul 2>&1
if errorlevel 1 (
    goto INSTALL_GIT
) else (
    goto GIT_INSTALLED
)

:INSTALL_GIT
echo ┌────────────────────────────────────────────────────────┐
echo │  ❌ Git 未安装                                         │
echo └────────────────────────────────────────────────────────┘
echo.
echo 请选择操作：
echo.
echo [1] 自动下载并安装 Git（推荐）
echo [2] 手动安装 Git
echo [3] 使用网页上传方式（无需 Git）
echo [0] 退出
echo.
set /p CHOICE="请输入选项 (0-3): "

if "%CHOICE%"=="1" goto AUTO_INSTALL_GIT
if "%CHOICE%"=="2" goto MANUAL_INSTALL_GIT
if "%CHOICE%"=="3" goto WEB_UPLOAD
if "%CHOICE%"=="0" exit
goto INSTALL_GIT

:AUTO_INSTALL_GIT
cls
echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║          📥 自动安装 Git                              ║
echo ╚════════════════════════════════════════════════════════╝
echo.
echo 正在打开 Git 下载页面...
echo.
start https://git-scm.com/download/win
echo.
echo 📝 安装步骤：
echo.
echo 1. 下载完成后，双击安装程序
echo 2. 安装过程中全部选择默认选项
echo 3. 一直点击 "Next" 直到完成
echo 4. 安装完成后，关闭所有命令行窗口
echo 5. 重新运行本脚本
echo.
echo ⚠️ 重要：安装完成后必须重启命令行窗口！
echo.
pause
exit

:MANUAL_INSTALL_GIT
cls
echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║          📥 手动安装 Git                              ║
echo ╚════════════════════════════════════════════════════════╝
echo.
echo 下载地址：
echo https://git-scm.com/download/win
echo.
echo 直接下载链接（64位）：
echo https://github.com/git-for-windows/git/releases/download/v2.43.0.windows.1/Git-2.43.0-64-bit.exe
echo.
echo 安装完成后，重新运行本脚本
echo.
pause
exit

:WEB_UPLOAD
cls
echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║          🌐 网页上传方式                              ║
echo ╚════════════════════════════════════════════════════════╝
echo.
echo 正在打开相关页面...
echo.
start https://github.com/aye0321123
start https://github.com/new
echo.
echo 📝 操作步骤：
echo.
echo 1. 在打开的页面创建新仓库
echo    - 仓库名：qushuiyin
echo    - 选择 Public
echo    - 点击 Create repository
echo.
echo 2. 创建后点击 "uploading an existing file"
echo.
echo 3. 拖拽以下文件到浏览器：
echo    - index.html
echo    - admin.html
echo    - bg.jpg
echo    - 所有 .md 文件
echo.
echo 4. 点击 Commit changes
echo.
echo 5. 进入 Settings → Pages
echo    - Branch: main
echo    - Folder: / (root)
echo    - 点击 Save
echo.
echo 详细步骤请查看：网页上传指南.md
echo.
pause
exit

:GIT_INSTALLED
cls
echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║          ✅ Git 已安装                                ║
echo ╚════════════════════════════════════════════════════════╝
echo.
git --version
echo.

REM 检查 Git 配置
git config --global user.name >nul 2>&1
if errorlevel 1 (
    goto CONFIG_GIT
)

echo Git 用户：
git config --global user.name
echo.

REM 检查是否已初始化仓库
if not exist ".git" (
    goto INIT_REPO
) else (
    goto PUSH_CHANGES
)

:CONFIG_GIT
echo ┌────────────────────────────────────────────────────────┐
echo │  ⚙️ 配置 Git 用户信息                                  │
echo └────────────────────────────────────────────────────────┘
echo.
set /p GIT_NAME="GitHub 用户名 (默认: aye0321123): "
if "%GIT_NAME%"=="" set GIT_NAME=aye0321123

set /p GIT_EMAIL="邮箱地址: "

git config --global user.name "%GIT_NAME%"
git config --global user.email "%GIT_EMAIL%"

echo.
echo ✅ Git 配置完成
echo.
pause
goto GIT_INSTALLED

:INIT_REPO
cls
echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║          📦 初始化 Git 仓库                           ║
echo ╚════════════════════════════════════════════════════════╝
echo.

set /p REPO_NAME="仓库名称 (默认: qushuiyin): "
if "%REPO_NAME%"=="" set REPO_NAME=qushuiyin

set REPO_URL=https://github.com/aye0321123/%REPO_NAME%.git

echo.
echo 仓库地址：%REPO_URL%
echo.
echo ⚠️ 请确认：
echo.
echo 1. 您已在 GitHub 创建了仓库：%REPO_NAME%
echo 2. 仓库设置为 Public（公开）
echo.
echo 如果还没有创建，现在为您打开创建页面...
echo.

set /p REPO_EXISTS="仓库已存在？(Y/N): "
if /i not "%REPO_EXISTS%"=="Y" (
    start https://github.com/new
    echo.
    echo 请在浏览器中创建仓库，然后重新运行本脚本
    echo.
    pause
    exit
)

echo.
echo 🔧 正在初始化本地仓库...
git init
git branch -M main
git remote add origin %REPO_URL%

echo.
echo ✅ 仓库初始化完成
echo.
pause
goto PUSH_CHANGES

:PUSH_CHANGES
cls
echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║          🚀 推送到 GitHub                             ║
echo ╚════════════════════════════════════════════════════════╝
echo.

echo 📤 正在准备文件...
echo.

REM 添加所有文件
git add -A

REM 检查是否有更改
git diff --cached --quiet
if errorlevel 1 (
    echo 📝 提交更改...
    git commit -m "部署视频解析工具 - %date% %time%"
    
    echo.
    echo ┌────────────────────────────────────────────────────────┐
    echo │  🔑 GitHub 认证                                        │
    echo └────────────────────────────────────────────────────────┘
    echo.
    echo ⚠️ 重要提示：
    echo.
    echo 用户名：aye0321123
    echo 密码：使用 Personal Access Token（不是 GitHub 密码！）
    echo.
    echo 如果还没有 Token，请按以下步骤获取：
    echo.
    echo 1. 访问：https://github.com/settings/tokens
    echo 2. 点击 "Generate new token (classic)"
    echo 3. Note 填写：qushuiyin-deploy
    echo 4. Expiration 选择：No expiration
    echo 5. 勾选权限：repo（所有子选项）
    echo 6. 点击 "Generate token"
    echo 7. 复制生成的 Token（ghp_xxxxx...）
    echo.
    
    set /p NEED_TOKEN="需要打开 Token 设置页面吗？(Y/N): "
    if /i "%NEED_TOKEN%"=="Y" (
        start https://github.com/settings/tokens
        echo.
        echo 请获取 Token 后按任意键继续...
        pause >nul
    )
    
    echo.
    echo 🚀 开始推送...
    echo.
    
    git push -u origin main
    
    if errorlevel 1 (
        echo.
        echo ⚠️ 推送失败，尝试先拉取远程更改...
        git pull origin main --rebase --allow-unrelated-histories
        
        echo.
        echo 🔄 重新推送...
        git push -u origin main
        
        if errorlevel 1 (
            goto PUSH_FAILED
        )
    )
    
    goto PUSH_SUCCESS
    
) else (
    echo.
    echo ℹ️ 没有检测到文件更改
    echo.
    echo 所有文件都已是最新状态
    echo.
    pause
    goto MAIN_MENU
)

:PUSH_SUCCESS
cls
echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║          ✅ 推送成功！                                ║
echo ╚════════════════════════════════════════════════════════╝
echo.
echo 🎉 文件已成功推送到 GitHub
echo.
echo ┌────────────────────────────────────────────────────────┐
echo │  📍 下一步：启用 GitHub Pages                          │
echo └────────────────────────────────────────────────────────┘
echo.
echo 1. 访问仓库设置页面
echo 2. 配置 GitHub Pages：
echo    - Branch: main
echo    - Folder: / (root)
echo 3. 点击 Save
echo 4. 等待 1-2 分钟
echo.
echo 您的网站地址：
echo https://aye0321123.github.io/%REPO_NAME%/
echo.

set /p OPEN_PAGES="是否打开 Pages 设置页面？(Y/N): "
if /i "%OPEN_PAGES%"=="Y" (
    start https://github.com/aye0321123/%REPO_NAME%/settings/pages
)

echo.
pause
exit

:PUSH_FAILED
cls
echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║          ❌ 推送失败                                  ║
echo ╚════════════════════════════════════════════════════════╝
echo.
echo 可能的原因：
echo.
echo 1. Personal Access Token 错误或过期
echo    → 重新生成 Token：https://github.com/settings/tokens
echo.
echo 2. Token 权限不足
echo    → 确保勾选了 "repo" 权限
echo.
echo 3. 网络连接问题
echo    → 检查网络连接
echo.
echo 4. 仓库不存在或无权限
echo    → 确认仓库已创建且为 Public
echo.
echo 💡 解决方案：
echo.
echo 1. 获取新的 Token（推荐）
echo 2. 使用网页上传方式
echo 3. 检查网络后重试
echo.

set /p RETRY="是否重试？(Y/N): "
if /i "%RETRY%"=="Y" goto PUSH_CHANGES

echo.
pause
exit
