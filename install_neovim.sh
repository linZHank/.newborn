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


