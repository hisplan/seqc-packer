#!/bin/bash

# https://fonts.google.com/specimen/Raleway
# https://fonts.google.com/specimen/Lato

# path_src="~/.local/share/fonts"
path_src="/tmp/fonts"
path_dst="/opt/conda/lib/python3.7/site-packages/matplotlib/mpl-data/fonts/ttf/"

# download
mkdir -p ${path_src}
cd ${path_src}

wget -O Raleway.zip https://fonts.google.com/download?family=Raleway
wget -O Lato.zip https://fonts.google.com/download?family=Lato

unzip -o Raleway.zip
unzip -o Lato.zip

# install
sudo mv Lato-*.ttf ${path_dst}
sudo mv Raleway-*.ttf ${path_dst}
sudo mv static/*.ttf ${path_dst}

fc-cache -f -v

rm -rf ~/.cache/matplotlib
rm -rf ${path_src}

# test
# from matplotlib import font_manager
# fm = font_manager.fontManager
# fm.findfont("Raleway")
# fm.findfont("Lato")
