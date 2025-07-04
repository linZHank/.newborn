#!/usr/bin/sh
./update_dnf_conf.sh
./import_rpm_fusion.sh
# ./install_nvidia_driver.sh
./install_tools.sh
./install_ghostty.sh
./install_tmux.sh
./download_nerdfonts.sh
./install_neovim.sh
./install_lazygit.sh

# Install special packages
./setup_zsh.sh

# restart computer
echo "you may now restart your computer"
