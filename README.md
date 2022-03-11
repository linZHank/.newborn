# Setup New RPi
This repo contains a [shell script](https://raw.githubusercontent.com/linzhangUCA/setup_new_pi/main/setup.sh) to help you quickly setup a Raspberry Pi (3/4), including:
- install necessary packages
- setup develop rules for using GPIO, SPI, etc..
- install ROS Galactic
- Config static IP address

# Pre-requisites
- Your RPi is supposed running a **64-bit** Ubuntu Server 20.04.
- Reset your password after login.
- Better wait 2 minutes to execute the script.
- Better plug an ethernet cable to your RPi for faster internet speed.

# Usage
```shell
git clone https://github.com/linzhanguca/setup_new_pi
cd setup_new_pi
./setup.sh
```
