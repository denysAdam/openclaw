#!/bin/sh
mkdir -p /data/.openclaw

# Копируем конфиг из репо, если его ещё нет в /data/.openclaw
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
if [ ! -f /data/.openclaw/openclaw.json ] && [ -f "$SCRIPT_DIR/openclaw.json" ]; then
  cp "$SCRIPT_DIR/openclaw.json" /data/.openclaw/openclaw.json
fi

# Render/Fly: PORT из env, bind на 0.0.0.0 чтобы health check доходил
export OPENCLAW_GATEWAY_PORT="${PORT:-18789}"
exec node openclaw.mjs gateway --allow-unconfigured --port "$OPENCLAW_GATEWAY_PORT" --bind lan
