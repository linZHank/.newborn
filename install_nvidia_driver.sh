#!/usr/bin/sh

echo "Start installing Nvidia driver"

sudo dnf install -y akmod-nvidia xorg-x11-drv-nvidia-cuda

echo "Nvidia driver installed."
