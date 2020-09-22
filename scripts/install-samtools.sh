#!/bin/bash -e

# https://github.com/samtools/samtools/releases/tag/1.10
SAMTOOLS_VERSION="1.10"

sudo yum install -y zlib-devel ncurses-devel bzip2-devel xz-devel

cd /tmp

curl -OL https://github.com/samtools/samtools/releases/download/${SAMTOOLS_VERSION}/samtools-${SAMTOOLS_VERSION}.tar.bz2
tar xjvf samtools-${SAMTOOLS_VERSION}.tar.bz2
rm -rf samtools-${SAMTOOLS_VERSION}.tar.bz2

cd samtools-${SAMTOOLS_VERSION}
./configure --prefix=/usr/local
make
sudo make install
