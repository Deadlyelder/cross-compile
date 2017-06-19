#!/bin/sh

#Normal OS update, upgrade and installing the libraries
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install libmpc-dev libcloog-isl-dev libisl-dev libmpfr-dev libgmp3-dev -y

# Creating a new folder to house the dependencies
mkdir $HOME/src
cd $HOME/src

# Downloading the Binutilies
wget http://ftp.gnu.org/gnu/binutils/binutils-2.24.tar.gz
tar xvf binutils-2.24.tar.gz

'''As mentioned by vaious people, it is dangerous to install a compiler within the system directory.
So as a workaround we put this in $HOME/opt/cross_compile.
To have the cross-compiler accessed globally it is ideal to place it at /usr/local/cross'''

# Creating PATH inside the ~/.bashrc file
echo " export PREFIX="$HOME/opt/cross_compile" \n export TARGET=x86_64-elf \n export PATH="$PREFIX/bin:$PATH" " >> ~/.bachrc

#Building the binutilies
# To be tested: cd $HOME/src
mkdir build-binutils
cd build-binutils
../binutils-2.14/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --disable-werror
make -j4
sudo make -j4 install

#Downloading gcc
wget http://ftp.gnu.org/gnu/gcc/gcc-4.9.1/gcc-4.9.1.tar.gz
tar xvf gcc-4.9.1.tar.gz

#Building the gcc
mkdir build-gcc
cd build-gcc
../gcc-4.9.1/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --enable-languages=c,c++ --without-headers
make -j4 all-gcc
make -j4 all-target-libgcc
sudo make install-gcc
sudo make install-target-libgcc
