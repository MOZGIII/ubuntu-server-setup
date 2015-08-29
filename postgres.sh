#!/bin/bash
set -ex

CODENAME="$(lsb_release -cs)"
echo "deb http://apt.postgresql.org/pub/repos/apt/ $CODENAME-pgdg main" > /etc/apt/sources.list.d/pgdg.list

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
apt-get update
apt-get install -y postgresql-9.4 libpq-dev
