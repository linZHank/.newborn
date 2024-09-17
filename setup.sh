# download packages info and upgrade packages
sudo apt update && sudo apt upgrade -y
echo "package manager update finished."

# install packages
sudo add-apt-repository ppa:aslatter/ppa # alacritty
sudo apt install -y \
  make \
  python3-dev \
  python3-pip \
  alacritty \
  zsh \
  git \
  tmux \
  stow \
  neofetch \
  htop

# Install neovim
echo "Start building neovim"
sudo apt install -y \
  ninja-build \
  gettext \
  cmake \
  unzip \
  curl \
  build-essential \
  wl-clipboard \
  ripgrep

cd $HOME
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/.local/neovim"
make install
export PATH="$HOME/.local/neovim/bin:$PATH"
cd $HOME
echo "neovim build finished."

# lazygit
cd $HOME
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

# install node version manager
curl -fsSL https://fnm.vercel.app/install | bash
export PATH=$HOME/.fnm:$PATH
eval "$(fnm env --use-on-cd)"
fnm install v18.16.1

# stow dotfiles
cd $HOME/.newborn
stow alacritty
stow zsh
stow git
stow tmux
# setup lazyvim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# install ros-jazzy, comment next block if ros not wanted
sudo apt install -y gnupg lsb-release
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list >/dev/null
sudo apt update && sudo apt install ros-dev-tools
sudo apt install -y ros-jazzy-ros-base python3-colcon-common-extensions

# install nvidia driver
cd $HOME/Downloads
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.0-1_all.deb
sudo dpkg -i cuda-keyring_1.0-1_all.deb
sudo apt update
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/nvidia-driver-560_560.35.03-0ubuntu1_amd64.deb
sudo apt install -y ./nvidia-driver-560_560.35.03-0ubuntu1_amd64.deb
cd $HOME

# install nerd-fonts
mkdir -p $HOME/.local/share/fonts/NerdFonts/
cd $HOME/.local/share/fonts/NerdFonts/
wget -P ~/.local/share/fonts/NerdFonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/MartianMono.zip
cd ~/.local/share/fonts/NerdFonts
unzip MartianMono.zip
rm MartianMono.zip
fc-cache -fv

# install mamba-forge
cd $HOME
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
bash Miniforge3-$(uname)-$(uname -m).sh
rm -f Miniforge3-$(uname)-$(uname -m).sh

# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s $(which zsh) $USER # use zsh as default shell

# restart computer
echo "you may now restart your computer"
