#!/bin/R
# shellcheck shell=bash

mkdir ~/.azcopy
cd ~/.azcopy || exit
wget -c https://aka.ms/downloadazcopy-v10-linux -O azcopy.tar.gz
tar -xvf azcopy.tar.gz
rm azcopy.tar.gz
mv azcopy*/* .
rm -r azcopy_*
echo >> ~/.bashrc # add a newline
echo 'export PATH=$PATH:'"$(pwd)" >> ~/.bashrc
# shellcheck disable=SC1091
source ~/.bashrc