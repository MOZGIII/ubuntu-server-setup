#!/bin/bash
set -ex

apt-get -y update
apt-get -y upgrade

apt-get install -y \
  vim \
  aptitude \
  language-pack-ru \
  build-essential \
  software-properties-common \
  git \
  subversion \
  curl \
  wget \
  checkinstall \
  pkg-config \
  cmake \
  p7zip-full \
  p7zip-rar \
  htop

update-alternatives --set editor /usr/bin/vim.basic

locale-gen
