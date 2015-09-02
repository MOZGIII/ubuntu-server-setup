#!/bin/bash
set -ex

# Allows passing VERSION from outside
: ${VERSION:=2.2.3}

apt-get remove -y ruby1.8 ruby1.9

apt-get install -y \
  checkinstall \
  git-core \
  curl \
  build-essential \
  libsqlite3-dev \
  sqlite3 \
  libxml2-dev \
  libxslt1-dev \
  libcurl4-openssl-dev

apt-get install -y \
  debhelper \
  autotools-dev \
  dh-autoreconf \
  bison \
  libgdbm-dev \
  libncursesw5-dev \
  libncurses5-dev \
  libreadline6-dev \
  zlib1g-dev \
  libssl-dev \
  procps \
  file \
  libffi-dev \
  libyaml-dev \
  openssl \
  chrpath \
  coreutils

VERSION_PREFIX="$(echo $VERSION | awk -F '.' '{ print $1"."$2 }')"

mkdir /tmp/ruby && cd /tmp/ruby
curl -L --progress "http://cache.ruby-lang.org/pub/ruby/$VERSION_PREFIX/ruby-$VERSION.tar.bz2" | tar xj
cd "ruby-$VERSION"
./configure --disable-install-rdoc
make -j`nproc`

checkinstall -y \
  --pkgname "ruby$VERSION_PREFIX" \
  --pkgversion "$VERSION" \
  --pkgrelease "1" \
  --pkggroup "ruby" \
  --provides "ruby-interpreter"

gem update --system
