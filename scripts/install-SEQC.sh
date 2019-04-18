#!/bin/bash -e

SEQC_VERSION="0.2.3-alpha.1"

# install dependencies
sudo yum install -y cairo pango

cd /tmp

sudo pip3 install Cython
sudo pip3 install numpy
sudo pip3 install bhtsne

curl -OL https://github.com/hisplan/seqc/archive/v${SEQC_VERSION}.tar.gz
tar xvzf v${SEQC_VERSION}.tar.gz
rm -rf v${SEQC_VERSION}.tar.gz

cd seqc-${SEQC_VERSION}

sudo pip3 install .
