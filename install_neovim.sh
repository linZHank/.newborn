#!/usr/bin/sh

echo "Start building neovim"

sudo dnf install -y \
  ninja-build \
  gettext \
  cmake \
  gcc \
  make \
  curl \
  glibc-gconv-extra \
  xclip \
  xsel \
  wl-clipboard \
  ripgrep

cd $HOME
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/.local"
make install
export PATH="$HOME/.local/bin:$PATH"
cd $HOME

echo "NeoVim build finished."

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

echo "LazyVim configured."

