# download packages info and upgrade packages
sudo add-apt-repository ppa:aslatter/ppa  # alacritty
sudo apt upgrade -y

# install packages
sudo apt install -y \
    curl \
    unzip \
    make \
    build-essential \
    alacritty \
    zsh \
    git \
    neovim \
    tmux \
    stow \
    python3-dev \
    python3-pip \

# install nvim
wget https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.deb
sudo apt install ./nvim-linux64.deb

# install pyenv
sudo apt install -y \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    llvm \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libffi-dev \
    liblzma-dev \
curl https://pyenv.run | bash

# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shell
sudo chsh -s $(which zsh) $USER

# stow dotfiles
stow alacritty
stow zsh
stow nvim
stow git
stow tmux

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

# install ros-humble, comment next block if ros not wanted

# install node version manager
curl -fsSL https://fnm.vercel.app/install | bash
export PATH=$HOME/.fnm:$PATH
eval "$(fnm env --use-on-cd)"
fnm install v16.14.0

# install linting, formatting tools
pip install pip pyright flake8 black --upgrade # python
sudo apt install libxml2-utils tidy  # xml
npm install -g markdownlint-cli  # markdown

# install nvidia driver and cuda
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/3bf863cc.pub
sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/ /"
sudo apt update
wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu2204/x86_64/nvidia-driver-515_515.48.07-0ubuntu1_amd64.deb
sudo apt install ./nvidia-driver-515_515.48.07-0ubuntu1_amd64.deb

# install conda, cuda and tf
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash ./Miniconda3-latest-Linux-x86_64.sh
conda create --name tensorflow python=3.9
conda activate tf
conda install -c conda-forge cudatoolkit=11.2 cudnn=8.1.0
pip install tensorflow
python3 -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))"

# restart computer
echo "you may now restart your computer"
