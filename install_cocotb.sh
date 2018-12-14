#!/bin/sh

# Install deps
apt-get update
apt-get install -y python python-tk

pip install --upgrade pip

# install some handy python packages
pip2.7 install numpy scipy matplotlib
