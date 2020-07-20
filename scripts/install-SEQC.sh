#!/bin/bash -e

# github tag version to pull
SEQC_VERSION="0.2.6-beta.6"

# install dependencies
sudo yum install -y cairo pango
sudo yum install -y mutt

cd /tmp

sudo pip3 install Cython
sudo pip3 install numpy
sudo pip3 install bhtsne

# curl -OL https://github.com/dpeerlab/seqc/archive/v${SEQC_VERSION}.tar.gz
curl -OL https://github.com/hisplan/seqc/archive/v${SEQC_VERSION}.tar.gz
tar xvzf v${SEQC_VERSION}.tar.gz
rm -rf v${SEQC_VERSION}.tar.gz

cd seqc-${SEQC_VERSION}

sudo pip3 install .

# falling back to Dejavu Sans seems to work only after this workaround implemented:
# /opt/conda/lib/python3.6/site-packages/matplotlib/font_manager.py:1241: UserWarning: findfont: Font family ['sans-serif'] not found. Falling back to DejaVu Sans.
# (prop.get_family(), self.defaultFamily[fontext]))
site_package=`python -c "import site; print(site.getsitepackages()[0])"`
sudo cp ${site_package}/matplotlib/mpl-data/fonts/ttf/DejaVuS* /usr/share/fonts/
fc-cache -fv
