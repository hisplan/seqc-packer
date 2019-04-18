#!/bin/bash -e

SAMTOOLS_VERSION="1.3.1"

sudo yum install -y zlib-devel ncurses-devel

cd /tmp

curl -OL https://github.com/samtools/samtools/releases/download/${SAMTOOLS_VERSION}/samtools-${SAMTOOLS_VERSION}.tar.bz2
tar xjvf samtools-${SAMTOOLS_VERSION}.tar.bz2
rm -rf samtools-${SAMTOOLS_VERSION}.tar.bz2

cd samtools-${SAMTOOLS_VERSION}
make

sudo mv samtools /usr/bin/
