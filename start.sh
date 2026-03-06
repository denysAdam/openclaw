#!/bin/sh
mkdir -p /data/.openclaw
cat > /data/.openclaw/openclaw.json << 'EOF'
{
"gateway": {
"controlUi": {
"dangerouslyAllowHostHeaderOriginFallback": true
}
}
}
EOF
exec node openclaw.mjs gateway --allow-unconfigured --bind lan
