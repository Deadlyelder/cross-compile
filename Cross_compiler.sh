#!/bin/sh

set -e

#Normal OS update, upgrade and installing the libraries
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install libmpc-dev libcloog-isl-dev libisl-dev libmpfr-dev libgmp3-dev -y

# Creating a new folder to house the dependencies
mkdir $HOME/src
cd $HOME/src

# Downloading the Binutilies
wget http://ftp.gnu.org/gnu/binutils/binutils-2.28.tar.gz
tar xvf binutils-2.28.tar.gz

#Downloading gcc
wget http://ftp.gnu.org/gnu/gcc/gcc-7.1.0/gcc-7.1.0.tar.gz
# Alternative link
# wget http://ftp-stud.hs-esslingen.de/pub/Mirrors/ftp.gnu.org/gcc/gcc-7.1.0/gcc-7.1.0.tar.gz
tar xvf gcc-7.1.0.tar.gz

# Creating PATH 
export PREFIX="$HOME/opt/cross"
export TARGET=x86_64-elf
export PATH="$PREFIX/bin:$PATH"

#Building the binutilies
cd $HOME/src
mkdir build-binutils
cd build-binutils
../binutils-2.28/configure --target=$TARGET --prefix=/opt/cross --disable-nls --disable-werror
make -j4
sudo make -j4 install

cd $HOME/src
#Building the gcc
mkdir build-gcc
cd build-gcc
../gcc-7.1.0/configure --target=$TARGET --prefix=/opt/cross --disable-nls --enable-languages=c,c++ --without-headers --disable-multilib
make -j4 all-gcc
make -j4 all-target-libgcc
sudo make install-gcc
sudo make install-target-libgcc
