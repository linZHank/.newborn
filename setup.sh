# install nix
sh <(curl -L https://nixos.org/nix/install) --daemon

# install packages
nix-env -iA \
	nixpkgs.zsh \
	nixpkgs.git \
	nixpkgs.neovim \
	nixpkgs.tmux \
	nixpkgs.stow \
	nixpkgs.bat \
	nixpkgs.gnumake \
	nixpkgs.gcc \

# stow dotfiles
stow git
stow nvim
stow zsh

# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shell
sudo chsh -s $(which zsh) $USER

# TODO: install nerd-fonts
