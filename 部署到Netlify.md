# 🚀 部署到 Netlify（免费，简单）

Netlify 也是非常简单的部署方式，拖拽即可！

---

## 步骤 1：注册 Netlify

1. 访问 https://www.netlify.com
2. 点击 **Sign up**
3. 选择 **GitHub** 登录（或邮箱注册）

---

## 步骤 2：部署网站

### 最简单方式：拖拽部署

1. 登录后，直接访问：https://app.netlify.com/drop
2. 将包含以下文件的文件夹拖到页面上：
   ```
   video-parser/
   ├── index.html
   ├── admin.html
   └── bg.jpg
   ```
3. 等待上传完成（几秒钟）
4. 部署完成！

---

## 🎉 完成！

Netlify 会自动生成一个网址：
```
https://random-name-123456.netlify.app
```

**主页**：`https://random-name-123456.netlify.app/`  
**管理后台**：`https://random-name-123456.netlify.app/admin.html`

---

## 🔧 修改网站名称

1. 在 Netlify 控制台，点击 **Site settings**
2. 点击 **Change site name**
3. 输入新名称（如：`video-parser`）
4. 新网址：`https://video-parser.netlify.app`

---

## 🌐 绑定自定义域名

1. 点击 **Domain settings**
2. 点击 **Add custom domain**
3. 输入您的域名
4. 按照提示配置 DNS

---

## 🔧 更新网站

### 方法 1：拖拽更新
1. 修改本地文件
2. 在 Netlify 控制台，点击 **Deploys**
3. 拖拽新文件夹到页面
4. 自动部署新版本

### 方法 2：通过 GitHub
1. 连接 GitHub 仓库
2. 每次推送代码自动部署

---

## 优点
✅ 完全免费
✅ 拖拽即可部署
✅ 自动 HTTPS
✅ 全球 CDN
✅ 每月 100GB 流量
✅ 自动更新

---

## 📊 三个平台对比

| 特性 | GitHub Pages | Vercel | Netlify |
|------|-------------|--------|---------|
| 免费 | ✅ | ✅ | ✅ |
| 速度 | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| 部署难度 | 简单 | 最简单 | 最简单 |
| 自定义域名 | ✅ | ✅ | ✅ |
| 流量限制 | 无限 | 100GB/月 | 100GB/月 |

**推荐**：
- 新手：**Netlify**（拖拽最简单）
- 追求速度：**Vercel**
- 长期使用：**GitHub Pages**（无流量限制）
