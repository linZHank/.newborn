# download packages info and upgrade packages
sudo apt update && sudo apt upgrade -y
echo "package manager update finished."

# install packages
# sudo add-apt-repository ppa:aslatter/ppa  # alacritty
sudo apt install -y \
    curl \
    unzip \
    make \
    build-essential \
    python3-dev \
    python3-pip \
    zsh \
    git \
    tmux \
    stow \
    neofetch \
    htop \


# install mamba-forge
cd $HOME
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh"
bash Mambaforge-$(uname)-$(uname -m).sh
rm -f Mambaforge-$(uname)-$(uname -m).sh


# Install neovim
sudo apt install -y \
    ninja-build \
    gettext \
    cmake \
    unzip \
    curl \
    xclip \
    xsel \
    ripgrep \

cd $HOME
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout release-0.9.4
make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/.local/neovim"
make install 
export PATH="$HOME/.local/neovim/bin:$PATH"
cd $HOME
echo "neovim build finished."


# install node version manager
curl -fsSL https://fnm.vercel.app/install | bash
export PATH=$HOME/.fnm:$PATH
eval "$(fnm env --use-on-cd)"
fnm install v18.16.1


# install ros-humble, comment next block if ros not wanted
sudo apt install -y gnupg lsb-release
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update
sudo apt install -y ros-humble-ros-base python3-colcon-common-extensions


# install nerd-fonts
mkdir -p $HOME/.local/share/fonts/NerdFonts/
cd $HOME/.local/share/fonts/NerdFonts/
curl -fLo "Terminess Nerd Font BoldItalic.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Terminus/Bold-Italic/TerminessNerdFont-BoldItalic.ttf
curl -fLo "Terminess Nerd Font Mono BoldItalic.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Terminus/Bold-Italic/TerminessNerdFontMono-BoldItalic.ttf
curl -fLo "Terminess Nerd Font Propo BoldItalic.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Terminus/Bold-Italic/TerminessNerdFontPropo-BoldItalic.ttf
curl -fLo "Terminess Nerd Font Bold.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Terminus/Bold/TerminessNerdFont-Bold.ttf
curl -fLo "Terminess Nerd Font Mono Bold.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Terminus/Bold/TerminessNerdFontMono-Bold.ttf
curl -fLo "Terminess Nerd Font Propo Bold.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Terminus/Bold/TerminessNerdFontPropo-Bold.ttf
curl -fLo "Terminess Nerd Font Italic.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Terminus/Italic/TerminessNerdFont-Italic.ttf
curl -fLo "Terminess Nerd Font Mono Italic.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Terminus/Italic/TerminessNerdFontMono-Italic.ttf
curl -fLo "Terminess Nerd Font Propo Italic.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Terminus/Italic/TerminessNerdFontPropo-Italic.ttf
curl -fLo "Terminess Nerd Font Regular.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Terminus/Regular/TerminessNerdFont-Regular.ttf
curl -fLo "Terminess Nerd Font Mono Regular.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Terminus/Regular/TerminessNerdFontMono-Regular.ttf
curl -fLo "Terminess Nerd Font Propo Regular.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Terminus/Regular/TerminessNerdFontPropo-Regular.ttf
fc-cache -f -v


# install tmux package manager
cd $HOME
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm


# stow dotfiles
cd $HOME/.newborn
stow zsh
stow nvim
stow git
stow tmux


# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s $(which zsh) $USER # use zsh as default shell


# restart computer
echo "you may now restart your computer"
