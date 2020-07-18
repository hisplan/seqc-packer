#!/bin/bash -e

# this version comes with Python 3.7.6
# https://repo.anaconda.com/miniconda/
# https://repo.anaconda.com/miniconda/Miniconda3-py37_4.8.2-Linux-x86_64.sh
miniconda_version="4.8.2"

cd /tmp
curl -O https://repo.anaconda.com/miniconda/Miniconda3-py37_${miniconda_version}-Linux-x86_64.sh
sudo bash Miniconda3-py37_${miniconda_version}-Linux-x86_64.sh -b -p /opt/conda
rm -rf Miniconda3-py37_${miniconda_version}-Linux-x86_64.sh
sudo ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh
echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc
echo "PATH=/opt/conda/bin:$PATH" >> ~/.bashrc

# load new environment vars
source ~/.bashrc

# amazon linux comes with python 2.7
# make `python3` points to conda python 3.6.5
# make `pip3` points to conda pip
sudo ln -s /opt/conda/bin/python3.6 /usr/bin/python3
sudo ln -s /opt/conda/bin/pip /usr/bin/pip3

# upgrade pip to the latest version
sudo pip3 install --upgrade pip
