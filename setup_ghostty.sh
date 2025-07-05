#!/usr/bin/sh

echo "Start build ghostty from source."

# Install dependencies
sudo dnf install -y \
	gtk4-devel \
	gtk4-layer-shell-devel \
	zig \
	libadwaita-devel \
	blueprint-compiler \
	gettext

# Build tip version from source
cd $HOME
git clone https://github.com/ghostty-org/ghostty
cd ghostty
zig build -p $HOME/.local -Doptimize=ReleaseFast

# Sync configs
stow $HOME/.newborn/ghostty

echo "Ghostty is installed."
