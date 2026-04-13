# AI服务器错误说明

## 问题确认

根据你提供的截图，错误信息是：

```
⚠️ 系统错误，错误ID: ERR_20260411_160448_a14892b2，请联系管理员
```

## 问题分析

这是一个**服务器端错误**，不是网络连接问题。具体说明：

### 错误来源
- 错误来自 API 服务器 `http://43.139.203.146:8050`
- 这是服务器内部的系统错误
- 客户端（浏览器）已经成功连接到服务器，但服务器处理请求时出错

### 可能的原因

1. **API密钥配置问题**
   - 服务器端的 `sk-123456` 密钥可能未正确配置
   - 密钥可能已过期或被禁用
   - 密钥权限不足

2. **服务器配置错误**
   - DeepSeek API 配置不正确
   - 数据库连接失败
   - 环境变量缺失

3. **服务器资源问题**
   - 内存不足
   - CPU过载
   - 磁盘空间不足

4. **API转发问题**
   - 如果这是一个代理服务器，可能无法连接到真正的 DeepSeek API
   - 上游 API 服务不可用

## 解决方案

### 方案1: 联系服务器管理员（推荐）

这个错误需要服务器管理员来解决，请提供以下信息：

```
错误ID: ERR_20260411_160448_a14892b2
API地址: http://43.139.203.146:8050/v1/chat/completions
API密钥: sk-123456
模型: deepseek-chat
错误时间: 2026-04-11 16:04:48
```

管理员需要检查：
- 服务器日志文件
- API密钥配置
- DeepSeek API 连接状态
- 服务器资源使用情况

### 方案2: 使用官方 DeepSeek API

如果自建服务器持续出现问题，可以直接使用官方 API：

#### 步骤：

1. **注册 DeepSeek 账号**
   - 访问: https://platform.deepseek.com
   - 注册并获取 API Key

2. **修改配置**
   
   打开 `index.html`，找到这段代码（约第1500行）：

   ```javascript
   // DeepSeek AI配置
   const AI_API_URL = 'http://43.139.203.146:8050/v1/chat/completions';
   const AI_API_KEY = 'sk-123456';
   const AI_MODEL = 'deepseek-chat';
   ```

   修改为：

   ```javascript
   // DeepSeek AI配置（官方API）
   const AI_API_URL = 'https://api.deepseek.com/v1/chat/completions';
   const AI_API_KEY = 'sk-你的官方API密钥';  // 替换为你的真实密钥
   const AI_MODEL = 'deepseek-chat';
   ```

3. **保存并刷新页面**

#### 官方API优势：
- ✅ 稳定可靠
- ✅ 支持HTTPS（更安全）
- ✅ 官方技术支持
- ✅ 性能更好

#### 官方API费用：
- 新用户通常有免费额度
- 按使用量计费
- 价格参考: https://platform.deepseek.com/pricing

### 方案3: 使用其他AI服务

如果不想使用 DeepSeek，可以考虑：

#### 3.1 OpenAI API
```javascript
const AI_API_URL = 'https://api.openai.com/v1/chat/completions';
const AI_API_KEY = 'sk-你的OpenAI密钥';
const AI_MODEL = 'gpt-3.5-turbo';  // 或 gpt-4
```

#### 3.2 通义千问 API
```javascript
const AI_API_URL = 'https://dashscope.aliyuncs.com/api/v1/services/aigc/text-generation/generation';
const AI_API_KEY = 'sk-你的通义千问密钥';
const AI_MODEL = 'qwen-turbo';
```

#### 3.3 文心一言 API
```javascript
const AI_API_URL = 'https://aip.baidubce.com/rpc/2.0/ai_custom/v1/wenxinworkshop/chat/completions';
const AI_API_KEY = '你的文心一言密钥';
const AI_MODEL = 'ernie-bot';
```

**注意**: 不同API的请求格式可能略有不同，需要相应调整代码。

### 方案4: 临时禁用AI改写功能

如果暂时不需要AI改写功能，可以隐藏这个功能：

打开 `index.html`，找到这段代码（约第1700行）：

```javascript
// 显示AI改写区域
document.getElementById('aiRewriteSection').style.display = 'block';
```

修改为：

```javascript
// 临时禁用AI改写区域
document.getElementById('aiRewriteSection').style.display = 'none';
```

## 测试步骤

修改配置后，请按以下步骤测试：

1. **清除浏览器缓存**
   - 按 `Ctrl + Shift + Delete`
   - 选择"缓存的图片和文件"
   - 点击"清除数据"

2. **刷新页面**
   - 按 `Ctrl + F5` 强制刷新

3. **测试连接**
   - 解析一个视频
   - 点击"🔧 测试连接"按钮
   - 查看是否成功

4. **测试改写**
   - 点击"📝 改写标题"按钮
   - 查看是否正常工作

## 技术细节

### 错误ID格式分析
```
ERR_20260411_160448_a14892b2
│   │        │       │
│   │        │       └─ 随机标识符
│   │        └───────── 时间戳 (16:04:48)
│   └────────────────── 日期 (2026-04-11)
└────────────────────── 错误前缀
```

这个格式说明服务器有完整的错误日志系统，管理员可以通过这个ID查找详细的错误信息。

### 服务器日志位置（供管理员参考）

如果你是服务器管理员，请检查：

```bash
# 常见日志位置
/var/log/nginx/error.log
/var/log/apache2/error.log
/var/log/app/error.log
~/.pm2/logs/

# 查看最近的错误
tail -f /var/log/app/error.log | grep "ERR_20260411_160448_a14892b2"
```

## 总结

**当前问题**: API服务器 `http://43.139.203.146:8050` 内部错误

**推荐方案**: 
1. 联系服务器管理员修复（如果是团队内部服务器）
2. 或切换到官方 DeepSeek API（更稳定可靠）

**临时方案**: 禁用AI改写功能，其他功能不受影响

如需帮助修改配置，请告诉我你选择哪个方案！
