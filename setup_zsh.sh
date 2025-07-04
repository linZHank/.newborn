#!/usr/bin/sh

echo "Start install zsh"

sudo dnf install -y zsh
# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s $(which zsh) $USER # use zsh as default shell

cd $HOME/.newborn
stow zsh
cd $HOME

echo "Zsh installed."
