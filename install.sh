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