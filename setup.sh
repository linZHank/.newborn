# dnf system upgrade
cd $HOME
sudo dnf upgrade

# import RPM Fusion 
sudo dnf install -y \
https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install \
https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf upgrade --refresh

# install packages
sudo dnf groupinstall @development-tools @development-libraries
sudo dnf install \
    curl \
    alacritty \
    zsh \
    git \
    neovim \
    tmux \
    stow \
    neofetch \
    python3-devel \
    python3-pip

# install pyenv
sudo dnf install -y \
    make \
    gcc \
    zlib-devel \
    bzip2 \
    bzip2-devel \
    readline-devel \
    sqlite \
    sqlite-devel \
    openssl-devel \
    tk-devel \
    libffi-devel \
    xz-devel
    
curl https://pyenv.run | bash

# install node version manager
curl -fsSL https://fnm.vercel.app/install | bash
export PATH=$HOME/.fnm:$PATH
eval "$(fnm env --use-on-cd)"
fnm install v16.14.0

# install conda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash ./Miniconda3-latest-Linux-x86_64.sh

# install linting, formatting tools
pip install pip --upgrade
pip install pyright flake8 black --upgrade # python
sudo apt install -y libxml2-utils tidy  # xml
npm install -g markdownlint-cli  # markdown

# stow dotfiles
cd $HOME/.newborn
stow alacritty
stow zsh
stow nvim
stow git
stow tmux

# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shell
sudo dnf install util-linux-user
sudo chsh -s $(which zsh) $USER

# install nerd-fonts
mkdir -p $HOME/.local/share/fonts/NerdFonts/
cd $HOME/.local/share/fonts/NerdFonts/
curl -fLo "Hack BoldItalic Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/BoldItalic/complete/Hack%20Bold%20Italic%20Nerd%20Font%20Complete.ttf
curl -fLo "Hack BoldItalic Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/BoldItalic/complete/Hack%20Bold%20Italic%20Nerd%20Font%20Complete%20Mono.ttf
curl -fLo "Hack Bold Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Bold/complete/Hack%20Bold%20Nerd%20Font%20Complete.ttf
curl -fLo "Hack Bold Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Bold/complete/Hack%20Bold%20Nerd%20Font%20Complete%20Mono.ttf
curl -fLo "Hack Italic Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Italic/complete/Hack%20Italic%20Nerd%20Font%20Complete.ttf
curl -fLo "Hack Italic Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Italic/complete/Hack%20Italic%20Nerd%20Font%20Complete%20Mono.ttf
curl -fLo "Hack Regular Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf
curl -fLo "Hack Regular Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf

# install nvidia driver
sudo dnf install akmod-nvidia -y
sudo dnf install xorg-x11-drv-nvidia-cuda

# restart computer
echo "you may now restart your computer"
