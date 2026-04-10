#!/bin/sh
# القيم الافتراضية
export UUID=${UUID:-"ba0e3984-ccc9-48a3-8074-b2f507f41ce8"}
export PATH_WS=${PATH_WS:-"/telegram_@coro123co_bot"}

# تعويض القيم داخل ملف الإعدادات
sed -i "s/UUID_VALUE/$UUID/g" /etc/xray/config.json
sed -i "s|PATH_VALUE|$PATH_WS|g" /etc/xray/config.json

echo "Starting Xray with Path: $PATH_WS"
/usr/bin/xray -config /etc/xray/config.json
