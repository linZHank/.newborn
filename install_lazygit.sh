#!/usr/bin/sh

echo "Start installing lazygit."

sudo dnf copr enable atim/lazygit -y
sudo dnf install -y lazygit

echo "LazyGit installed."
