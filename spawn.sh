#!/user/bin/bash
# download packages info and upgrade packages
sudo apt update && sudo apt upgrade -y
echo "package manager update finished."

# Install dependencies and misc pakcages
sudo apt install -y \
    build-essential \
    make \
    python3-dev \
    python3-pip \
    git \
    tmux \
    stow \
    neofetch \
    htop

# Install special packages
./install_ghostty-u.sh
./download_nerdfont.sh
./install_neovim.sh
./install_ros.sh
./install_lazygit.sh
./install_miniforge.sh
# ./install_nvidia_driver.sh
./setup_zsh.sh
./sync_configs.sh

# restart computer
echo "you may now restart your computer"
