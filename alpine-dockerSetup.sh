#!/bin/sh

echo "http://dl-cdn.alpinelinux.org/alpine/v3.20/community" >> /etc/apk/repositories
apk update
apk upgrade
apk add libc6-compat && apk add vim
apk add docker
apk add docker-cli-compose
rc-update add docker default
service docker start