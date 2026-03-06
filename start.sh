#!/bin/sh
mkdir -p /data/.openclaw

# Копируем конфиг из репо, если его ещё нет в /data/.openclaw
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
if [ ! -f /data/.openclaw/openclaw.json ] && [ -f "$SCRIPT_DIR/openclaw.json" ]; then
  cp "$SCRIPT_DIR/openclaw.json" /data/.openclaw/openclaw.json
fi

exec node openclaw.mjs gateway --allow-unconfigured
