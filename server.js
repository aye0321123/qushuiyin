const http = require('http');
const fs = require('fs');
const path = require('path');
const os = require('os');

const PORT = 8000;

// 获取本机IP地址
function getLocalIP() {
  const interfaces = os.networkInterfaces();
  for (const name of Object.keys(interfaces)) {
    for (const iface of interfaces[name]) {
      if (iface.family === 'IPv4' && !iface.internal) {
        return iface.address;
      }
    }
  }
  return 'localhost';
}

// MIME类型映射
const mimeTypes = {
  '.html': 'text/html',
  '.css': 'text/css',
  '.js': 'text/javascript',
  '.json': 'application/json',
  '.png': 'image/png',
  '.jpg': 'image/jpeg',
  '.jpeg': 'image/jpeg',
  '.gif': 'image/gif',
  '.svg': 'image/svg+xml',
  '.ico': 'image/x-icon',
  '.txt': 'text/plain',
  '.md': 'text/markdown'
};

const server = http.createServer((req, res) => {
  let filePath = '.' + req.url;
  if (filePath === './') {
    filePath = './index.html';
  }

  const extname = String(path.extname(filePath)).toLowerCase();
  const contentType = mimeTypes[extname] || 'application/octet-stream';

  fs.readFile(filePath, (error, content) => {
    if (error) {
      if (error.code === 'ENOENT') {
        res.writeHead(404, { 'Content-Type': 'text/html; charset=utf-8' });
        res.end('<h1>404 - 文件未找到</h1>', 'utf-8');
      } else {
        res.writeHead(500);
        res.end('服务器错误: ' + error.code);
      }
    } else {
      res.writeHead(200, { 'Content-Type': contentType + '; charset=utf-8' });
      res.end(content, 'utf-8');
    }
  });
});

server.listen(PORT, () => {
  const localIP = getLocalIP();
  console.log('========================================');
  console.log('  无痕视频去水印工具 - 本地服务器');
  console.log('========================================');
  console.log('');
  console.log('服务器已启动！');
  console.log('');
  console.log('电脑访问地址:');
  console.log(`  http://localhost:${PORT}`);
  console.log(`  http://127.0.0.1:${PORT}`);
  console.log('');
  console.log('手机访问地址（确保手机和电脑在同一WiFi）:');
  console.log(`  http://${localIP}:${PORT}`);
  console.log('');
  console.log(`用户端: http://${localIP}:${PORT}/index.html`);
  console.log(`管理端: http://${localIP}:${PORT}/admin.html`);
  console.log('');
  console.log('========================================');
  console.log('按 Ctrl+C 停止服务器');
  console.log('========================================');
});
