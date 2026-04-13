# 🚀 部署到 GitHub Pages（免费）

## 步骤 1：创建 GitHub 账号
1. 访问 https://github.com
2. 点击 **Sign up** 注册账号（如果已有账号，直接登录）

---

## 步骤 2：创建新仓库

1. 登录后，点击右上角 **+** → **New repository**
2. 填写信息：
   - **Repository name**: `video-parser`（或任意名称）
   - **Description**: 视频去水印工具
   - **Public**（选择公开）
   - ✅ 勾选 **Add a README file**
3. 点击 **Create repository**

---

## 步骤 3：上传文件

### 方法 A：网页上传（简单）

1. 在仓库页面，点击 **Add file** → **Upload files**
2. 拖拽以下文件到页面：
   - `index.html`
   - `admin.html`
   - `bg.jpg`
3. 在底部填写提交信息：`上传视频解析工具`
4. 点击 **Commit changes**

### 方法 B：使用 Git（专业）

```bash
# 1. 克隆仓库
git clone https://github.com/你的用户名/video-parser.git
cd video-parser

# 2. 复制文件到仓库目录
# 将 index.html, admin.html, bg.jpg 复制到这个文件夹

# 3. 提交并推送
git add .
git commit -m "上传视频解析工具"
git push
```

---

## 步骤 4：启用 GitHub Pages

1. 在仓库页面，点击 **Settings**（设置）
2. 左侧菜单找到 **Pages**
3. 在 **Source** 下：
   - Branch: 选择 **main**
   - Folder: 选择 **/ (root)**
4. 点击 **Save**
5. 等待 1-2 分钟，页面会显示：
   ```
   Your site is live at https://你的用户名.github.io/video-parser/
   ```

---

## 🎉 完成！

**您的网站地址**：
```
https://你的用户名.github.io/video-parser/
```

**管理后台地址**：
```
https://你的用户名.github.io/video-parser/admin.html
```

---

## ⚠️ 注意事项

### 1. HTTPS 和 HTTP 混合内容问题
GitHub Pages 使用 HTTPS，但您的 AI API 是 HTTP：
```javascript
const AI_API_URL = 'http://43.139.203.146:8050/v1/chat/completions';
```

**解决方案**：
- 浏览器可能会阻止 HTTP 请求
- 建议将 AI API 改为 HTTPS
- 或者暂时禁用 AI 改写功能

### 2. 自定义域名（可选）
如果您有自己的域名：
1. 在 GitHub Pages 设置中添加 **Custom domain**
2. 在域名服务商添加 CNAME 记录指向 `你的用户名.github.io`

---

## 🔧 更新网站

以后要更新网站，只需：
1. 修改本地文件
2. 在 GitHub 仓库页面上传新文件（覆盖旧文件）
3. 等待 1-2 分钟自动部署

---

## 优点
✅ 完全免费
✅ 无需服务器
✅ 自动 HTTPS
✅ 全球 CDN 加速
✅ 无流量限制
