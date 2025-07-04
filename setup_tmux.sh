#!/usr/bin/sh

echo "Start install tmux."

sudo dnf install -y tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
stow tmux

echo "Tmux installed."
echo "Please start tmux then <C-b> + I to install plugins"
