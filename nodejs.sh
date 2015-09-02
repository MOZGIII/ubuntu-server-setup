#!/bin/bash
set -ex

# Node.js is useful anywhere
curl -sL https://deb.nodesource.com/setup_0.12 | bash -
apt-get install -y nodejs
