#! /bin/bash

sudo apt update
sudo apt upgrade -y

sudo apt install -y build-essential
sudo apt install -y git git-man
sudo apt install -y curl
sudo apt install -y cmake

sudo apt install -y qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools
sudo apt install -y libxerces-c-dev

sudo apt install -y gfortran
sudo apt install -y python3-dev python3-numpy-dev

sudo apt install -y libxpm-dev libxft-dev libxmu-dev
sudo apt install -y libssl-dev

sudo apt-get install -y libpcre3-dev libglu1-mesa-dev \
                libftgl-dev libfftw3-dev libcfitsio-dev \
                libgraphviz-dev libxml2-dev libgsl-dev