@echo off
chcp 65001 >nul
echo ========================================
echo    Git 自动安装和部署工具
echo ========================================
echo.

REM 检查是否已安装 Git
git --version >nul 2>&1
if errorlevel 1 (
    echo ❌ 未检测到 Git
    echo.
    echo 正在为您准备 Git 安装...
    echo.
    echo 📥 请按照以下步骤操作：
    echo.
    echo 1. 访问 Git 官网下载页面
    echo    https://git-scm.com/download/win
    echo.
    echo 2. 下载完成后，双击安装
    echo    - 安装时全部选择默认选项
    echo    - 点击 Next 直到完成
    echo.
    echo 3. 安装完成后，关闭所有命令行窗口
    echo.
    echo 4. 重新运行本脚本
    echo.
    
    set /p OPEN_DOWNLOAD="是否现在打开下载页面？(Y/N): "
    if /i "%OPEN_DOWNLOAD%"=="Y" (
        start https://git-scm.com/download/win
    )
    
    echo.
    echo 💡 提示：安装 Git 后，重新运行此脚本即可自动部署
    echo.
    pause
    exit /b
)

echo ✅ Git 已安装
git --version
echo.

REM 检查是否已配置用户信息
git config --global user.name >nul 2>&1
if errorlevel 1 (
    echo 📝 首次使用，需要配置 Git 用户信息
    echo.
    set /p GIT_NAME="请输入您的 GitHub 用户名 (默认: aye0321123): "
    if "%GIT_NAME%"=="" set GIT_NAME=aye0321123
    
    set /p GIT_EMAIL="请输入您的邮箱: "
    
    git config --global user.name "%GIT_NAME%"
    git config --global user.email "%GIT_EMAIL%"
    
    echo.
    echo ✅ Git 配置完成
    echo.
)

echo 当前 Git 用户：
git config --global user.name
echo.

REM 检查是否已初始化仓库
if not exist ".git" (
    echo 📦 首次部署，正在初始化 Git 仓库...
    echo.
    
    set /p REPO_NAME="请输入仓库名称 (默认: qushuiyin): "
    if "%REPO_NAME%"=="" set REPO_NAME=qushuiyin
    
    set REPO_URL=https://github.com/aye0321123/%REPO_NAME%.git
    
    echo.
    echo 仓库地址：%REPO_URL%
    echo.
    echo ⚠️ 重要提示：
    echo 1. 请先在 GitHub 创建仓库：%REPO_NAME%
    echo 2. 访问：https://github.com/new
    echo 3. 仓库名输入：%REPO_NAME%
    echo 4. 选择 Public（公开）
    echo 5. 不要勾选 "Add a README file"
    echo 6. 点击 Create repository
    echo.
    
    set /p REPO_CREATED="仓库已创建？(Y/N): "
    if /i not "%REPO_CREATED%"=="Y" (
        echo.
        echo 请先创建仓库，然后重新运行此脚本
        start https://github.com/new
        pause
        exit /b
    )
    
    echo.
    echo 🔧 正在初始化本地仓库...
    git init
    git branch -M main
    git remote add origin %REPO_URL%
    
    echo.
    echo ✅ 仓库初始化完成
    echo.
)

echo 📤 正在准备上传文件...
echo.

REM 添加所有文件
git add -A

REM 检查是否有更改
git diff --cached --quiet
if errorlevel 1 (
    echo 📝 检测到文件更改，正在提交...
    echo.
    
    set COMMIT_MSG=部署视频解析工具 - %date% %time%
    git commit -m "%COMMIT_MSG%"
    
    echo.
    echo 🚀 正在推送到 GitHub...
    echo.
    echo ⚠️ 重要：
    echo - 用户名：aye0321123
    echo - 密码：使用 Personal Access Token（不是 GitHub 密码）
    echo - Token 获取：https://github.com/settings/tokens
    echo.
    
    git push -u origin main
    
    if errorlevel 1 (
        echo.
        echo ❌ 推送失败，尝试先拉取远程更改...
        echo.
        git pull origin main --rebase --allow-unrelated-histories
        
        echo.
        echo 🔄 重新推送...
        git push -u origin main
        
        if errorlevel 1 (
            echo.
            echo ========================================
            echo    ❌ 推送失败
            echo ========================================
            echo.
            echo 可能的原因：
            echo 1. 需要 Personal Access Token
            echo 2. Token 权限不足（需要 repo 权限）
            echo 3. 网络连接问题
            echo.
            echo 💡 获取 Token：
            echo 1. 访问：https://github.com/settings/tokens
            echo 2. Generate new token (classic)
            echo 3. 勾选 repo 权限
            echo 4. 复制生成的 Token
            echo 5. 重新运行此脚本，密码处粘贴 Token
            echo.
            
            set /p OPEN_TOKEN="是否打开 Token 设置页面？(Y/N): "
            if /i "%OPEN_TOKEN%"=="Y" (
                start https://github.com/settings/tokens
            )
            
            pause
            exit /b
        )
    )
    
    echo.
    echo ========================================
    echo    ✅ 部署成功！
    echo ========================================
    echo.
    echo 🎉 您的网站将在 1-2 分钟后上线
    echo.
    echo 📍 下一步：启用 GitHub Pages
    echo.
    echo 1. 访问仓库设置：
    echo    https://github.com/aye0321123/%REPO_NAME%/settings/pages
    echo.
    echo 2. 配置 Pages：
    echo    - Branch: main
    echo    - Folder: / (root)
    echo    - 点击 Save
    echo.
    echo 3. 等待 1-2 分钟后访问：
    echo    https://aye0321123.github.io/%REPO_NAME%/
    echo.
    
    set /p OPEN_SETTINGS="是否打开 Pages 设置页面？(Y/N): "
    if /i "%OPEN_SETTINGS%"=="Y" (
        start https://github.com/aye0321123/%REPO_NAME%/settings/pages
    )
    
) else (
    echo.
    echo ℹ️ 没有检测到文件更改
    echo.
    echo 所有文件都已是最新状态
    echo.
)

echo.
pause
