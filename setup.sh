# install homebrew
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install packages
brew install --cask alacritty 
brew install \
    zsh \
    git \
    neovim \
    tmux \
    fzf \
    stow \
    bat \
 
# stow dotfiles
stow x
stow alacritty
stow zsh
stow nvim
stow git
stow tmux

# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shell
sudo chsh -s $(which zsh) $USER
 
# install nerd fonts
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
