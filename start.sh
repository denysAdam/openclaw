#!/bin/sh
mkdir -p /data/.openclaw

# Пишем конфиг только если его нет
if [ ! -f /data/.openclaw/openclaw.json ]; then
cat > /data/.openclaw/openclaw.json << 'EOF'
{
"gateway": {
"bind": "lan",
"controlUi": {
"dangerouslyAllowHostHeaderOriginFallback": true
}
},
"agents": {
"defaults": {
"model": {
"primary": "google/gemini-2.0-flash"
}
}
}
}
EOF
fi

exec node openclaw.mjs gateway --allow-unconfigured