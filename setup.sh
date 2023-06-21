# download packages info and upgrade packages
sudo apt update && sudo apt upgrade -y
echo "package manager update finished."

# install packages
sudo add-apt-repository ppa:aslatter/ppa  # alacritty
sudo apt install -y \
    curl \
    unzip \
    make \
    build-essential \
    python3-dev \
    python3-pip \
    alacritty \
    zsh \
    git \
    tmux \
    stow \
    neofetch \


# Install neovim
sudo apt install -y \
    ninja-build \
    gettext \
    cmake \
    unzip \
    curl \
    # libtool \
    # libtool-bin \
    # autoconf \
    # automake \
    # g++ \
    # pkg-config \
    # doxygen \
    # lua5.4 \
    # luajit \
    
cd $HOME
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout release-0.9
make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/.local/neovim"
make install 
export PATH="$HOME/.local/neovim/bin:$PATH"
cd $HOME
echo "neovim build finished."


# install node version manager
curl -fsSL https://fnm.vercel.app/install | bash
export PATH=$HOME/.fnm:$PATH
eval "$(fnm env --use-on-cd)"
fnm install v16.14.0


# stow dotfiles
cd $HOME/.newborn
stow alacritty
stow zsh
stow nvim
stow git
stow tmux
# stow x


# install ros-humble, comment next block if ros not wanted
sudo apt install -y gnupg lsb-release
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update
sudo apt install -y ros-humble-ros-base python3-colcon-common-extensions


# install nvidia driver 
cd $HOME
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.0-1_all.deb
sudo dpkg -i cuda-keyring_1.0-1_all.deb
sudo apt update
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/nvidia-driver-515_515.48.07-0ubuntu1_amd64.deb
sudo apt install -y ./nvidia-driver-515_515.48.07-0ubuntu1_amd64.deb


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


# install mamba-forge
cd $HOME
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh"
bash Mambaforge-$(uname)-$(uname -m).sh
rm -f Mambaforge-$(uname)-$(uname -m).sh


# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s $(which zsh) $USER # use zsh as default shell


# install pyenv
# sudo apt install -y \
#     libssl-dev \
#     zlib1g-dev \
#     libbz2-dev \
#     libreadline-dev \
#     libsqlite3-dev \
#     wget \
#     llvm \
#     libncursesw5-dev \
#     xz-utils \
#     tk-dev \
#     libxml2-dev \
#     libxmlsec1-dev \
#     libffi-dev \
#     liblzma-dev
# 
# curl https://pyenv.run | bash


# install linting, formatting tools
# pip install pip pyright flake8 black --upgrade # python
# sudo apt install -y libxml2-utils tidy  # xml
# npm install -g markdownlint-cli  # markdown


# restart computer
echo "you may now restart your computer"
