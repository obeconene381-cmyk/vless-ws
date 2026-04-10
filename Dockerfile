FROM alpine:latest

# تثبيت xray-core
RUN apk add --no-cache curl bash
RUN bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install

# تجهيز المجلدات والملفات
RUN mkdir -p /etc/xray
COPY config.json /etc/xray/config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# البورت اللي يشرطو جوجل
EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]
