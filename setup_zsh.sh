# zsh
sudo apt install zsh
# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s $(which zsh) $USER # use zsh as default shell

