FROM alpine:3.12

ENV CURL_VERSION 7.77.0

RUN apk add --update bash openssh-client libssh2-dev git alpine-sdk npm yarn composer

WORKDIR /tmp
RUN curl -o- https://curl.se/download/curl-$CURL_VERSION.tar.gz| tar -zxf - && cd curl-$CURL_VERSION && ./configure --with-libssh2 --with-openssl && make && make install
RUN curl https://raw.githubusercontent.com/git-ftp/git-ftp/master/git-ftp > /usr/local/bin/git-ftp && chmod 755 /usr/local/bin/git-ftp
RUN curl -Lo /usr/local/bin/phpseccheck https://github.com/fabpot/local-php-security-checker/releases/download/v1.0.0/local-php-security-checker_1.0.0_linux_amd64 && chmod +x /usr/local/bin/phpseccheck
RUN apk del alpine-sdk

RUN mkdir /app
WORKDIR /app
