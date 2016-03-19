#!/bin/bash
set -ex

apt-get update
apt-get install -y unattended-upgrades debconf-utils

# Reset apt configs
apt-get -o Dpkg::Options::="--force-confmiss" --reinstall install apt
dpkg-query --showformat='${Conffiles}\n' --show apt | awk '{ print $1 }' | xargs rm -f
apt-get -o Dpkg::Options::="--force-confmiss" --reinstall install apt

# Reconfigure unattended-upgrades
echo 'unattended-upgrades unattended-upgrades/enable_auto_updates boolean true' | debconf-set-selections
dpkg-reconfigure -u unattended-upgrades
