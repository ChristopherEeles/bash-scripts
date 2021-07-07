#!/bin/bash

# -- Update and upgrade
sudo apt-get update -y && sudo apt-get upgrade -y

# -- Install miniconda for current stable Python release
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3*.sh

# -- Add R repo to apt, then use it to install R
sudo apt install dirmngr gnupg apt-transport-https ca-certificates \
    software-properties-common
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys \
    E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository \
    'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'

# -- Install apt useful packages
apt_pkgs=(
    # system deps
    'libcurl4-openssl-dev' 'libssl-dev' 'libxml2-dev' 'build-essentials'
    'libsodium-dev'
    # databases
    'sqlite' 'mysql-server' 'mariabd-server-10.3' 'mariadb-server' 
    'libmariadbclient-dev'
    # CLI tools
    'git'  'pigz'  'htop' 'thefuck' 'silversearcher-ag'
    # programming languages
    'r-base' 'node-typescript' 
)

for pkg in "${apt_pkgs[@]}"
do
    sudo apt-get install -y "$pkg" || exit 1
done

# -- Install rust via rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh