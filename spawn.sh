#!/usr/bin/sh
./update_dnf_conf.sh
./import_rpm_fusion.sh
# ./install_nvidia_driver.sh
./install_tools.sh
./install_lazygit.sh
./download_nerdfonts.sh
./setup_ghostty.sh
./setup_tmux.sh
./setup_neovim.sh
./setup_uv.sh
./setup_zsh.sh

# restart computer
echo "you may now restart your computer"
