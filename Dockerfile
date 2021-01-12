FROM alpine:latest

RUN apk add --update bash openssh-client libssh2-dev git alpine-sdk

WORKDIR /tmp
RUN curl -o- https://curl.haxx.se/download/curl-7.74.0.tar.gz | tar -zxf - && cd curl-7.74.0 && ./configure --with-libssh2 && make && make install
RUN curl https://raw.githubusercontent.com/git-ftp/git-ftp/master/git-ftp > /usr/local/bin/git-ftp && chmod 755 /usr/local/bin/git-ftp

RUN apk del alpine-sdk

RUN mkdir /app
WORKDIR /app
