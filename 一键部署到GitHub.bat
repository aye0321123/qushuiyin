@echo off
chcp 65001 >nul
title 一键部署到 GitHub
color 0A

echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║          🚀 一键部署到 GitHub                         ║
echo ╚════════════════════════════════════════════════════════╝
echo.

echo 📋 准备部署优化后的文件...
echo.

REM 检查 Git 是否安装
git --version >nul 2>&1
if errorlevel 1 (
    echo ❌ 未安装 Git，无法自动部署
    echo.
    echo 📝 请使用以下方式手动部署：
    echo.
    echo 方式一：网页编辑（最快）
    echo 1. 访问：https://github.com/aye0321123/qushuiyin/edit/main/qushuiyin/index.html
    echo 2. 删除所有内容
    echo 3. 打开本地 index.html，复制全部内容
    echo 4. 粘贴到 GitHub 编辑器
    echo 5. 提交更改
    echo.
    echo 方式二：安装 Git 后自动部署
    echo 1. 下载 Git：https://git-scm.com/download/win
    echo 2. 安装完成后重新运行本脚本
    echo.
    
    set /p OPEN_EDIT="是否打开 GitHub 编辑页面？(Y/N): "
    if /i "%OPEN_EDIT%"=="Y" (
        start https://github.com/aye0321123/qushuiyin/edit/main/qushuiyin/index.html
        echo.
        echo ✅ 已打开编辑页面
        echo.
        echo 📝 接下来请：
        echo 1. 在编辑器中按 Ctrl+A 全选，然后 Delete 删除
        echo 2. 打开本地 index.html（用记事本）
        echo 3. 按 Ctrl+A 全选，Ctrl+C 复制
        echo 4. 回到 GitHub，按 Ctrl+V 粘贴
        echo 5. 底部输入：优化移动端显示效果
        echo 6. 点击 Commit changes
        echo.
    )
    
    pause
    exit /b
)

echo ✅ Git 已安装
git --version
echo.

REM 检查是否在 Git 仓库中
if not exist ".git" (
    echo ❌ 当前目录不是 Git 仓库
    echo.
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
echo - 用户名：aye0321123
echo - 密码：使用 Personal Access Token（不是 GitHub 密码）
echo.

git push -u origin main

if errorlevel 1 (
    echo.
    echo ❌ 推送失败
    echo.
    echo 💡 可能的原因：
    echo 1. 需要 Personal Access Token
    echo 2. Token 权限不足
    echo 3. 网络问题
    echo.
    echo 🔑 获取 Token：
    echo 1. 访问：https://github.com/settings/tokens
    echo 2. Generate new token (classic)
    echo 3. 勾选 repo 权限
    echo 4. 复制生成的 Token
    echo 5. 重新运行本脚本，密码处粘贴 Token
    echo.
    
    set /p OPEN_TOKEN="是否打开 Token 设置页面？(Y/N): "
    if /i "%OPEN_TOKEN%"=="Y" (
        start https://github.com/settings/tokens
    )
    
    echo.
    echo 📝 或者使用网页编辑方式：
    echo 访问：https://github.com/aye0321123/qushuiyin/edit/main/qushuiyin/index.html
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
