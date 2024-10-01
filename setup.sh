# download packages info and upgrade packages
sudo apt update && sudo apt upgrade -y
echo "package manager update finished."

# install packages
sudo apt install -y \
  make \
  python3-dev \
  python3-pip \
  zsh \
  git \
  tmux \
  stow \
  neofetch \

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
stow zsh
stow git
stow tmux
# setup lazyvim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

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
