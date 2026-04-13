# 🚀 部署到 Vercel（免费，更快）

Vercel 是最简单的部署方式，拖拽文件即可上线！

---

## 步骤 1：注册 Vercel

1. 访问 https://vercel.com
2. 点击 **Sign Up**
3. 选择 **Continue with GitHub**（用 GitHub 账号登录）

---

## 步骤 2：部署项目

### 方法 A：拖拽上传（最简单）

1. 登录 Vercel 后，点击 **Add New** → **Project**
2. 点击 **Browse** 或直接拖拽文件夹
3. 将包含以下文件的文件夹拖进去：
   ```
   video-parser/
   ├── index.html
   ├── admin.html
   └── bg.jpg
   ```
4. 点击 **Deploy**
5. 等待 30 秒，部署完成！

### 方法 B：从 GitHub 导入

1. 先将文件上传到 GitHub（参考 GitHub Pages 教程）
2. 在 Vercel 点击 **Import Project**
3. 选择您的 GitHub 仓库
4. 点击 **Deploy**

---

## 🎉 完成！

部署成功后，Vercel 会给您一个网址：
```
https://your-project-name.vercel.app
```

**主页**：`https://your-project-name.vercel.app/`  
**管理后台**：`https://your-project-name.vercel.app/admin.html`

---

## 🌐 绑定自定义域名（可选）

1. 在项目设置中点击 **Domains**
2. 输入您的域名（如：`video.yourdomain.com`）
3. 按照提示在域名服务商添加 DNS 记录
4. 等待生效（通常几分钟）

---

## 🔧 更新网站

### 方法 1：重新拖拽
1. 修改本地文件
2. 重新拖拽文件夹到 Vercel
3. 自动部署新版本

### 方法 2：通过 GitHub
1. 更新 GitHub 仓库的文件
2. Vercel 自动检测并部署

---

## 优点
✅ 完全免费
✅ 部署超快（30秒）
✅ 自动 HTTPS
✅ 全球 CDN
✅ 自动更新
✅ 比 GitHub Pages 更快

---

## ⚠️ 注意事项

同样需要注意 HTTPS 和 HTTP 混合内容问题。
AI API 使用 HTTP 可能被浏览器阻止。
