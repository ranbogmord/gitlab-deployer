FROM alpine:latest

RUN apk add --update curl bash openssh-client
RUN mkdir /app
WORKDIR /app
