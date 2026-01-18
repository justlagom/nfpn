#!/usr/bin/env sh

# 将占位符改为 DOMAIN_PLACEHOLDER，以便与 entrypoint.sh 中的 sed 命令匹配
status=$(curl -o /dev/null -s -w "%{http_code}" https://DOMAIN_PLACEHOLDER)
echo `date "+%Y-%m-%d %H:%M:%S"` - Request: https://DOMAIN_PLACEHOLDER, Response: $status > /tmp/keepalive.log
