# SETUP TOOLS FOR COMPILATION OF GEANT4 ON LINUX (UBUNTU 22.04)

## Helpful Links

https://geant4.web.cern.ch/support/download

https://geant4-userdoc.web.cern.ch/UsersGuides/InstallationGuide/html/installguide.html


## Install Prerequisites
sudo privaleges are required!

```
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
```

## Build and Install
```
#! /bin/bash

echo "pull source code from github"  
git clone https://github.com/Geant4/geant4.git
cd geant4/
git checkout v11.0.2
cd ..

echo "make the build directory"
mkdir geant4_build/
cd geant4_build/

echo "make the install directory"
sudo mkdir /usr/local/geant4/11.0.2

cmake -DCMAKE_INSTALL_PREFIX=/usr/local/geant4/11.0.2 \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DGEANT4_INSTALL_DATA=ON \
    -DGEANT4_USE_GDML=ON \
    -DGEANT4_USE_QT=ON \
    ../geant4

echo "installing"
sudo cmake --build . --target install -- -j4
echo "build done"
```

Add this line to your ~/.bashrc so cmake can find the Geant4 library
```
source /usr/local/geant4/11.0.2/bin/geant4.sh
```

## Known issues
I ran into an issue when installing (the last command) cmake couldn't move geant4_build/data to the installation directory in /usr/local/geant4. The following commands can be used just before, ``` sudo cmake --build . --target install -- -j4 ```, to fix the problem. 

```
sudo mkdir /usr/local/geant4/11.0.2/share/Geant4-11.0.2/data
sudo cp -r data/ /usr/local/geant4/11.0.2/share/Geant4-11.0.2/data/
```

## Try one of the example programs
```
cp -r /usr/local/geant4/11.0.2/share/Geant4-11.0.2/examples/basic/B1 G4-B1
cd G4-B1
mkdir build && cd build
cmake ../ && cd ..
cmake --build ./build --config Release
```