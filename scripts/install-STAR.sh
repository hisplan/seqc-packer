#!/bin/bash -e

STAR_VERSION="2.7.6a"

cd /tmp
curl -OL https://github.com/alexdobin/STAR/archive/${STAR_VERSION}.tar.gz
tar -xf ${STAR_VERSION}.tar.gz
rm -rf ${STAR_VERSION}.tar.gz

sudo cp STAR-${STAR_VERSION}/bin/Linux_x86_64_static/STAR /usr/bin/
