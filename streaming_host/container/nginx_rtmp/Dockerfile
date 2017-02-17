FROM gliderlabs/alpine:3.4
MAINTAINER nsoushi

ENV NGINX_VERSION nginx-1.11.9
ENV RTMP_MODULE_VERSION 1.1.10
ENV PATH $PATH:/usr/local/nginx/sbin

RUN mkdir /src /data

RUN apk --update add bash tzdata ca-certificates pcre ffmpeg && \
    apk --no--cache add --virtual=build-dependencies wget build-base perl-dev pcre-dev zlib-dev openssl openssl-dev

WORKDIR /src
RUN wget -O ${NGINX_VERSION}.tar.gz http://nginx.org/download/${NGINX_VERSION}.tar.gz && \
  tar -zxvf ${NGINX_VERSION}.tar.gz && \
  rm ${NGINX_VERSION}.tar.gz && \
  wget -O nginx-rtmp-module-${RTMP_MODULE_VERSION}.tar.gz https://github.com/arut/nginx-rtmp-module/archive/v${RTMP_MODULE_VERSION}.tar.gz && \
  tar -zxvf nginx-rtmp-module-${RTMP_MODULE_VERSION}.tar.gz && \
  rm nginx-rtmp-module-${RTMP_MODULE_VERSION}.tar.gz

WORKDIR /src/${NGINX_VERSION}
RUN ./configure --add-module=/src/nginx-rtmp-module-${RTMP_MODULE_VERSION} --with-debug \
  --http-log-path=/var/log/nginx/access.log \
  --error-log-path=/var/log/nginx/error.log \
  --conf-path=/etc/nginx/conf/nginx.conf && \
  make && \
  make install && \
  rm -rf /etc/localtime && \
  ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
  apk del build-dependencies && \
  rm -rf /var/cache/apk/*

ADD etc/nginx/conf/nginx.conf /etc/nginx/conf/nginx.conf

EXPOSE 1935

ENTRYPOINT ["nginx", "-g", "daemon off;"]
