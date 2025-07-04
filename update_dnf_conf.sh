#!/usr/bin/sh

sudo cp /etc/dnf/dnf.conf /etc/dnf/dnf.conf.original
sudo cp $HOME/.newborn/dnf.conf /etc/dnf/ 
sudo dnf update

echo "DNF configuration updated."



