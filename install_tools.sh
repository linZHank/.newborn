#!/usr/bin/sh

echo "Start to install some useful tools."

sudo dnf install -y \
  @development-tools \
  curl \
  git \
  stow \
  fastfetch \
  htop

# Install Brave browser
cd $HOME
curl -fsS https://dl.brave.com/install.sh | sh

echo "Useful tools are installed."
