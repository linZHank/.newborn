# dnf system upgrade
cd $HOME
sudo dnf update
sudo dnf group install 'Hardware Support'


# import RPM Fusion 
sudo dnf install -y \
https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y \
https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf upgrade --refresh


# install packages
sudo dnf install -y \
    @development-tools \
    curl \
    alacritty \
    zsh \
    git \
    tmux \
    stow \
    neofetch \
    htop \


# install neovim
echo "start install neovim..."
cd $HOME
sudo dnf install -y \
    ninja-build \
    libtool \
    autoconf \
    automake \
    cmake \
    gcc \
    gcc-c++ \
    make \
    pkgconfig \
    unzip \
    patch \
    gettext \
    curl \
    xclip \
    xsel \
    wl-clipboard
    
cd $HOME
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout v0.9.4
make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=$HOME/.local/neovim
make install 
cd $HOME
echo "End build neovim."


# install node version manager
curl -fsSL https://fnm.vercel.app/install | bash
export PATH=$HOME/.local/share/fnm:$PATH
eval "$(fnm env --use-on-cd)"
fnm install v16.14.0


# install conda
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh"
bash Mambaforge-$(uname)-$(uname -m).sh
rm -f Mambaforge-$(uname)-$(uname -m).sh


# stow dotfiles
cd $HOME/.newborn
stow alacritty
stow zsh
stow nvim
stow git
stow tmux
stow git


# use zsh as default shell
command -v zsh | sudo tee -a /etc/shells # set zsh as login shell
sudo dnf install -y util-linux-user
sudo chsh -s $(which zsh) $USER


# install nvidia driver
sudo dnf install -y akmod-nvidia xorg-x11-drv-nvidia-cuda


# install nerd-fonts
mkdir -p $HOME/.local/share/fonts/NerdFonts/
cd $HOME/.local/share/fonts/NerdFonts/
curl -fLo "BigBlueTermPlus Nerd Font Regular.ttf" https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/BigBlueTerminal/BigBlueTermPlusNerdFont-Regular.ttf
curl -fLo "BigBlueTermPlus Nerd Font Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/BigBlueTerminal/BigBlueTermPlusNerdFontMono-Regular.ttf
curl -fLo "BigBlueTermPlus Nerd Font Propo.ttf" https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/BigBlueTerminal/BigBlueTermPlusNerdFontPropo-Regular.ttf
fc-cache -f -v
cd $HOME
echo "Fonts downloaded."


# restart computer
echo "you may now restart your computer"
