#!/bin/sh

# Install deps
apt-get update
apt-get install -y gcc gnat clang-3.5 lldb-3.5 make libz-dev libedit-dev

# Link clang binary
ln -s /usr/bin/clang-3.5 /usr/bin/clan
ln -s /usr/bin/clang++-3.5 /usr/bin/clang++

# Download ghdl
wget https://github.com/ghdl/ghdl/archive/v0.35.tar.gz

# uncompress
tar -xzf v0.35.tar.gz

cd ghdl-0.35/

# Create build directory
mkdir build
cd build

# configure and build
../configure  --with-llvm-config=/usr/bin/llvm-config-3.5 --prefix=/usr/local
make
make install

# cleanup
cd ..
rm -rf v0.35.tar.gz ghdl-0.35/
apt-get purge -y gcc gnat clang-3.5 lldb-3.5
