@echo off
chcp 65001 >nul
echo ========================================
echo    自动上传到 GitHub
echo ========================================
echo.

REM 检查是否安装了 Git
git --version >nul 2>&1
if errorlevel 1 (
    echo ❌ 未检测到 Git，请先安装 Git
    echo.
    echo 下载地址: https://git-scm.com/download/win
    echo.
    pause
    exit /b
)

echo ✅ Git 已安装
echo.

REM 检查是否已经初始化仓库
if not exist ".git" (
    echo 📦 首次使用，正在初始化...
    echo.
    set /p REPO_URL="请输入您的 GitHub 仓库地址 (例如: https://github.com/aye0321123/仓库名.git): "
    
    git init
    git branch -M main
    git remote add origin %REPO_URL%
    
    echo.
    echo ✅ 初始化完成！
    echo.
)

echo 📤 正在准备上传文件...
echo.

REM 添加所有重要文件
git add index.html admin.html bg.jpg *.md *.svg *.bat *.ps1 *.html

REM 检查是否有更改
git diff --cached --quiet
if errorlevel 1 (
    REM 有更改，提交
    set COMMIT_MSG=更新视频解析工具 - %date% %time%
    git commit -m "%COMMIT_MSG%"
    
    echo.
    echo 🚀 正在上传到 GitHub...
    echo.
    
    REM 推送到 GitHub
    git push -u origin main
    
    if errorlevel 1 (
        echo.
        echo ❌ 上传失败！
        echo.
        echo 可能的原因：
        echo 1. 需要输入 GitHub 用户名和密码/Token
        echo 2. 网络连接问题
        echo 3. 仓库地址错误
        echo 4. 需要先拉取远程更改
        echo.
        echo 💡 尝试先拉取远程更改...
        git pull origin main --rebase
        echo.
        echo 🔄 重新尝试推送...
        git push -u origin main
        
        if errorlevel 1 (
            echo.
            echo ❌ 仍然失败！请检查：
            echo 1. GitHub 用户名: aye0321123
            echo 2. 使用 Personal Access Token 作为密码
            echo 3. Token 权限包含 repo
            echo.
            echo 📖 获取 Token: https://github.com/settings/tokens
            echo.
        ) else (
            echo.
            echo ========================================
            echo    ✅ 上传成功！
            echo ========================================
            echo.
            echo 您的网站将在 1-2 分钟后更新
            echo 网址: https://aye0321123.github.io/您的仓库名/
            echo.
        )
    ) else (
        echo.
        echo ========================================
        echo    ✅ 上传成功！
        echo ========================================
        echo.
        echo 您的网站将在 1-2 分钟后更新
        echo 网址: https://aye0321123.github.io/您的仓库名/
        echo.
    )
) else (
    echo.
    echo ℹ️ 没有检测到文件更改
    echo.
    echo 如果您确实修改了文件，请检查：
    echo 1. 文件是否已保存
    echo 2. 文件是否在当前目录
    echo.
)

pause
