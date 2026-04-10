FROM alpine:latest

# تثبيت الأدوات اللازمة
RUN apk add --no-cache curl bash ca-certificates unzip

# تحميل ملف Xray مباشرة وتثبيته
RUN curl -L -o xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip xray.zip xray && \
    mv xray /usr/bin/xray && \
    chmod +x /usr/bin/xray && \
    rm xray.zip

# تجهيز المجلدات والملفات
RUN mkdir -p /etc/xray
COPY config.json /etc/xray/config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# البورت المطلوب
EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]
 alpine:latest

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
