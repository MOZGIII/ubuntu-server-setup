#!/bin/bash
set -ex

export BOOTSTRAP_ROOT="$(dirname "${BASH_SOURCE[0]}")"
cd $BOOTSTRAP_ROOT

./basic-setup.sh
./unattended-upgrades.sh
./nginx.sh
./nodejs.sh
./postgres.sh
./ruby.sh
