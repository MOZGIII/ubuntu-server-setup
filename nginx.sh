#!/bin/bash
set -ex

CODENAME="$(lsb_release -cs)"
echo "deb http://nginx.org/packages/mainline/ubuntu/ $CODENAME nginx" > /etc/apt/sources.list.d/nginx.list
echo "deb-src http://nginx.org/packages/mainline/ubuntu/ $CODENAME nginx" >> /etc/apt/sources.list.d/nginx.list

wget --quiet -O - http://nginx.org/keys/nginx_signing.key | apt-key add -
apt-get update
apt-get install -y nginx
