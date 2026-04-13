# 🎬 视频去水印解析工具

> 支持抖音、小红书、快手、B站、视频号等平台的无水印视频下载

---

## ✨ 功能特点

- 🎯 **多平台支持** - 抖音、小红书、快手、B站、视频号
- 🤖 **AI 智能改写** - 自动改写标题、文案、话题
- 📱 **响应式设计** - 完美支持手机、平板、电脑
- 🎨 **现代化界面** - 玻璃态设计，流畅动画
- 🔐 **卡密系统** - 支持激活码管理
- 📊 **管理后台** - 完整的用户和卡密管理
- 📜 **解析历史** - 自动保存 24 小时内的解析记录

---

## 🚀 快速开始

### 在线访问

如果已部署到 GitHub Pages：
```
https://aye0321123.github.io/仓库名/
```

### 本地使用

1. 下载所有文件到本地
2. 双击打开 `index.html`
3. 开始使用！

---

## 📦 部署到网上

### 方法一：GitHub Pages（推荐，免费）

1. **创建 GitHub 仓库**
   - 访问：https://github.com/new
   - 仓库名：任意（如 `video-parser`）
   - 设置为 Public

2. **上传文件**
   - 点击 **Add file** → **Upload files**
   - 上传 `index.html`、`admin.html`、`bg.jpg`

3. **启用 GitHub Pages**
   - Settings → Pages
   - Branch: `main`
   - Folder: `/ (root)`
   - 点击 Save

4. **访问网站**
   - 等待 1-2 分钟
   - 访问：`https://你的用户名.github.io/仓库名/`

📖 **详细指南**：查看 `部署到GitHub.md`

### 方法二：Vercel（快速部署）

1. 访问：https://vercel.com
2. 导入 GitHub 仓库
3. 一键部署

📖 **详细指南**：查看 `部署到Vercel.md`

### 方法三：Netlify（拖拽部署）

1. 访问：https://netlify.com
2. 拖拽文件夹到页面
3. 自动部署

📖 **详细指南**：查看 `部署到Netlify.md`

---

## 🔄 如何更新

### 方式一：网页上传（无需安装软件）

1. 修改本地文件
2. 访问 GitHub 仓库
3. 编辑对应文件
4. 粘贴新内容并提交

📖 **详细指南**：查看 `网页上传指南.md`

### 方式二：Git 自动上传（推荐）

1. **安装 Git**（一次性）
   - 下载：https://git-scm.com/download/win
   - 📖 详细步骤：`安装Git指南.md`

2. **配置 Token**（一次性）
   - 访问：https://github.com/settings/tokens
   - 生成新 Token，勾选 `repo` 权限
   - 保存 Token

3. **使用自动上传**
   - 双击 `自动上传到GitHub.bat`
   - 或对 Kiro 说："上传到 GitHub"

📖 **详细指南**：查看 `自动上传使用指南.md`

---

## 📚 文档目录

### 🚀 部署相关
- 📄 `部署和更新总指南.md` - **推荐先看这个**
- 📄 `部署到GitHub.md` - GitHub Pages 部署
- 📄 `部署到Vercel.md` - Vercel 部署
- 📄 `部署到Netlify.md` - Netlify 部署

### 🔄 更新相关
- 📄 `安装Git指南.md` - Git 安装教程
- 📄 `自动上传使用指南.md` - Git 自动上传
- 📄 `网页上传指南.md` - 网页手动上传
- 📄 `快速上传指令.txt` - 命令速查表

### 📖 使用说明
- 📄 `功能演示指南.md` - 功能介绍
- 📄 `移动端使用说明.md` - 手机使用
- 📄 `AI改写功能诊断指南.md` - AI 功能
- 📄 `AI服务器错误说明.md` - 错误排查

---

## 🎯 使用流程

### 普通用户

```
1. 访问网站
   ↓
2. 粘贴视频链接
   ↓
3. 点击解析
   ↓
4. 下载无水印视频
```

### 管理员

```
1. 访问管理后台
   网址/admin.html
   ↓
2. 登录账号
   用户名：aye
   密码：yy888888
   ↓
3. 管理用户和卡密
```

---

## ⚙️ 配置说明

### API 配置

在 `index.html` 中修改：

```javascript
// 视频解析 API Key
const GLOBAL_API_KEY = 'puM4bNPd7nBIFcRXBUgvfutGzE';

// AI 改写配置
const AI_API_URL = 'http://43.139.203.146:8050/v1/chat/completions';
const AI_API_KEY = 'sk-123456';
const AI_MODEL = 'deepseek-chat';
```

### 管理员配置

在 `admin.html` 中修改：

```javascript
// 管理员账号
username: 'aye'
password: 'yy888888'
```

### 隐藏入口

在卡密激活页面输入 `AYE` 可直接进入管理后台

---

## 🎨 界面预览

### 主页面
- 🌓 支持深色/浅色主题切换
- 🎯 平台标签：视频号、抖音、小红书、快手、B站
- 🤖 AI 智能改写功能
- 📜 解析历史记录（24小时自动清理）

### 管理后台
- 👥 用户管理
- 🎫 卡密生成和管理
- 📊 使用统计

---

## 🔧 技术栈

- **前端**：纯 HTML + CSS + JavaScript
- **图标**：Simple Icons CDN
- **API**：
  - 视频解析：wxshares.com API
  - AI 改写：DeepSeek API
- **部署**：GitHub Pages / Vercel / Netlify

---

## 📱 支持的平台

| 平台 | 支持状态 | 说明 |
|------|---------|------|
| 🎵 抖音 | ✅ 支持 | 需要分享链接 |
| 📕 小红书 | ✅ 支持 | 需要分享链接 |
| ⚡ 快手 | ✅ 支持 | 需要分享链接 |
| 📺 B站 | ✅ 支持 | 需要视频链接 |
| 📱 视频号 | ✅ 支持 | 需要 objectId 和 objectNonceId |

---

## ❓ 常见问题

### Q: 解析失败怎么办？
A: 检查链接是否正确，或者 API Key 是否有效

### Q: AI 改写不工作？
A: 检查 AI API 配置是否正确，参考 `AI改写功能诊断指南.md`

### Q: 如何修改样式？
A: 直接编辑 `index.html` 中的 CSS 部分

### Q: 如何添加新平台？
A: 在平台标签部分添加新的 HTML 代码

### Q: 手机上能用吗？
A: 完全支持！响应式设计，自动适配手机屏幕

---

## 🔐 安全说明

- ✅ API Key 可以公开（已配置在代码中）
- ✅ 管理员密码建议修改
- ✅ 用户数据存储在浏览器本地
- ✅ 不会上传任何隐私信息

---

## 📞 获取帮助

### 方式一：查看文档
根据问题查看对应的 `.md` 文档

### 方式二：问 Kiro
如果您在使用 Kiro，直接说：
- "帮我部署到 GitHub"
- "上传失败了怎么办"
- "帮我修改 XXX 功能"

---

## 🎉 更新日志

查看 `更新日志.md` 了解最新变化

---

## 📄 许可证

本项目仅供学习交流使用

---

## 🌟 特别感谢

- wxshares.com - 提供视频解析 API
- DeepSeek - 提供 AI 改写服务
- Simple Icons - 提供平台图标

---

## 🔗 相关链接

- GitHub 仓库：`https://github.com/aye0321123/仓库名`
- 在线演示：`https://aye0321123.github.io/仓库名/`
- 问题反馈：GitHub Issues

---

**Made with ❤️ by Kiro**

如有问题，随时联系！😊
