# 📦 安装 Git 完整指南

## 🎯 为什么需要 Git？

Git 是自动上传到 GitHub 的必备工具。安装后，您就可以：
- ✅ 一键上传更新到 GitHub
- ✅ 自动同步网站内容
- ✅ 管理版本历史

---

## 📥 下载和安装

### 步骤 1：下载 Git

**官方下载地址**：https://git-scm.com/download/win

**直接下载链接**（推荐）：
- 64位系统：https://github.com/git-for-windows/git/releases/download/v2.43.0.windows.1/Git-2.43.0-64-bit.exe

### 步骤 2：安装 Git

1. **双击下载的安装程序**

2. **安装选项**（按顺序）：
   
   ✅ **Select Components**（选择组件）
   - 保持默认选项，直接点 Next
   
   ✅ **Choosing the default editor**（选择编辑器）
   - 选择 "Use Notepad as Git's default editor"
   - 点 Next
   
   ✅ **Adjusting your PATH environment**（配置环境变量）
   - 选择 "Git from the command line and also from 3rd-party software"
   - 点 Next
   
   ✅ **Choosing HTTPS transport backend**
   - 选择 "Use the OpenSSL library"
   - 点 Next
   
   ✅ **Configuring the line ending conversions**
   - 选择 "Checkout Windows-style, commit Unix-style line endings"
   - 点 Next
   
   ✅ **Configuring the terminal emulator**
   - 选择 "Use MinTTY"
   - 点 Next
   
   ✅ **其他选项**
   - 保持默认，一路 Next
   
   ✅ **点击 Install 开始安装**

3. **安装完成后**
   - 勾选 "Launch Git Bash"
   - 点击 Finish

---

## ⚙️ 配置 Git

安装完成后，需要配置用户信息：

### 方法一：使用 Git Bash（推荐）

1. 打开 **Git Bash**（开始菜单搜索 "Git Bash"）

2. 输入以下命令（替换为您的信息）：

```bash
git config --global user.name "aye0321123"
git config --global user.email "你的邮箱@example.com"
```

3. 验证配置：

```bash
git config --global user.name
git config --global user.email
```

### 方法二：使用命令提示符

1. 按 `Win + R`，输入 `cmd`，回车

2. 输入以下命令：

```bash
git config --global user.name "aye0321123"
git config --global user.email "你的邮箱@example.com"
```

---

## 🔑 创建 GitHub Personal Access Token

### 步骤 1：访问 Token 设置页面

访问：https://github.com/settings/tokens

### 步骤 2：生成新 Token

1. 点击 **Generate new token** → **Generate new token (classic)**

2. 填写信息：
   - **Note**（备注）：`视频解析工具自动上传`
   - **Expiration**（过期时间）：`No expiration`（永不过期）
   - **Select scopes**（权限）：
     - ✅ 勾选 **repo**（会自动勾选所有子选项）

3. 点击页面底部的 **Generate token**

### 步骤 3：保存 Token

⚠️ **重要**：Token 只显示一次！

1. 复制生成的 Token（格式：`ghp_xxxxxxxxxxxxxxxxxxxx`）
2. 保存到安全的地方（例如记事本）
3. 这个 Token 将作为 GitHub 密码使用

---

## ✅ 验证安装

### 1. 验证 Git 安装

打开命令提示符（Win + R → cmd），输入：

```bash
git --version
```

应该显示类似：`git version 2.43.0.windows.1`

### 2. 验证配置

```bash
git config --global user.name
git config --global user.email
```

应该显示您配置的用户名和邮箱

---

## 🚀 开始使用

安装和配置完成后，您就可以：

### 方法一：双击运行
双击 `自动上传到GitHub.bat` 文件

### 方法二：让 Kiro 帮你
对我说："上传到 GitHub" 或 "帮我同步到网站"

---

## 🔧 常见问题

### Q1: 安装后命令提示符仍然提示 "git 不是内部或外部命令"

**解决方法**：
1. 关闭所有命令提示符窗口
2. 重新打开命令提示符
3. 如果还不行，重启电脑

### Q2: 忘记保存 Token 怎么办？

**解决方法**：
1. 访问 https://github.com/settings/tokens
2. 删除旧的 Token
3. 重新生成新的 Token

### Q3: Token 过期了怎么办？

**解决方法**：
1. 访问 https://github.com/settings/tokens
2. 点击过期的 Token
3. 点击 "Regenerate token"
4. 保存新的 Token

### Q4: 不想安装 Git，有其他方法吗？

**解决方法**：
可以使用网页上传方式（见下一节）

---

## 🌐 不安装 Git 的替代方案

如果不想安装 Git，可以使用 GitHub 网页上传：

### 步骤：

1. 访问您的 GitHub 仓库：
   ```
   https://github.com/aye0321123/仓库名
   ```

2. 点击要更新的文件（例如 `index.html`）

3. 点击右上角的 **铅笔图标**（Edit this file）

4. 修改内容后，滚动到页面底部

5. 填写提交信息：
   - Commit message: `更新视频解析工具`
   
6. 点击 **Commit changes**

7. 等待 1-2 分钟，网站自动更新

**缺点**：
- ❌ 每次只能更新一个文件
- ❌ 需要手动复制粘贴代码
- ❌ 比较繁琐

**优点**：
- ✅ 不需要安装任何软件
- ✅ 任何设备都可以操作

---

## 📞 需要帮助？

如果遇到问题：
1. 查看本指南的常见问题部分
2. 直接问我（Kiro）："Git 安装失败了，怎么办？"
3. 提供具体的错误信息

---

## 🎉 安装成功标志

当您能在命令提示符中运行 `git --version` 并看到版本号时，说明安装成功！

接下来就可以使用 `自动上传到GitHub.bat` 一键上传了！
