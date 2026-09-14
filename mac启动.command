#!/bin/bash
# 双击即可启动：本地 HTTP 服务 + 打开浏览器
# 关闭窗口即结束服务

cd "$(dirname "$0")"

# 找一个空闲端口（8086-8099）
PORT=""
for p in 8086 8087 8088 8089 8090 8091 8092 8093; do
  if ! lsof -iTCP -sTCP:LISTEN -P 2>/dev/null | grep -q ":$p "; then
    PORT=$p
    break
  fi
done

if [ -z "$PORT" ]; then
  echo "没有可用端口 (8086-8093 均被占用)"
  read -p "按回车退出..."
  exit 1
fi

echo "═══════════════════════════════════════════════"
echo "  长城·龙魂 · 本地演示服务"
echo "  端口：$PORT"
echo "  地址：http://localhost:$PORT/"
echo "═══════════════════════════════════════════════"
echo ""
echo "浏览器将自动打开。关闭此终端窗口即结束服务。"
echo ""

# 后台启动服务
python3 -m http.server $PORT >/dev/null 2>&1 &
SERVER_PID=$!

# 等待服务就绪
sleep 1

# 打开浏览器
open "http://localhost:$PORT/index.html"

# 收到 Ctrl+C 或窗口关闭时清理
trap "echo ''; echo '正在停止服务...'; kill $SERVER_PID 2>/dev/null; exit 0" INT TERM EXIT

# 保持窗口存活
wait $SERVER_PID
