#!/bin/bash

# -- Install miniconda for current stable Python release
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3*.sh

# -- Install rust
apt_pkgs=(
    'git' 'rustc' 'sqlite' 'pigz' 'mysql' 'htop' 'thefuck' 'ack'
)

for pkg in "${apt_pks[@]}"
do
    apt-get install -y "$pkg" || exit 1
done