#!/usr/bin/sh

echo "Start downloading MartianMono"

mkdir -p $HOME/.local/share/fonts/NerdFonts/
cd $HOME/.local/share/fonts/NerdFonts/
wget -P ~/.local/share/fonts/NerdFonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/MartianMono.zip
cd ~/.local/share/fonts/NerdFonts
unzip MartianMono.zip
rm MartianMono.zip
fc-cache -fv

echo "MartianMono stored."


