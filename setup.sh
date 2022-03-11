# download packages info and upgrade packages
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt upgrade -y

# install packages
sudo apt install -y \
    curl \
    build-essential \
    zsh \
    git \
    neovim \
    stow \
    python3-dev \
    python3-pip \

# stow dotfiles
stow nvim
stow git
stow tmux

# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shell
sudo chsh -s $(which zsh) $USER

# install nerd-fonts
mkdir -p $HOME/.local/share/fonts/NerdFonts/
cd $HOME/.local/share/fonts/NerdFonts/
curl -fLo "Hack BoldItalic Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/BoldItalic/complete/Hack%20Bold%20Italic%20Nerd%20Font%20Complete.ttf
curl -fLo "Hack BoldItalic Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/BoldItalic/complete/Hack%20Bold%20Italic%20Nerd%20Font%20Complete%20Mono.ttf
curl -fLo "Hack Bold Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Bold/complete/Hack%20Bold%20Nerd%20Font%20Complete.ttf
curl -fLo "Hack Bold Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Bold/complete/Hack%20Bold%20Nerd%20Font%20Complete%20Mono.ttf
curl -fLo "Hack Italic Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Italic/complete/Hack%20Italic%20Nerd%20Font%20Complete.ttf
curl -fLo "Hack Italic Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Italic/complete/Hack%20Italic%20Nerd%20Font%20Complete%20Mono.ttf
curl -fLo "Hack Regular Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf
curl -fLo "Hack Regular Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf

# install GPIO libraries
cd $HOME/.newborn
sudo apt install rpi.gpio-common
pip install pip --upgrade
pip install gpiozero RPi.GPIO
sudo adduser "${USER}" dialout  # optional
sudo cp 90-gpio-spi.rules /etc/udev/rules.d/
sudo groupadd -f --system gpio
sudo usermod -aG gpio ubuntu
sudo groupadd -f --system spi
sudo usermod -aG spi ubuntu

# install ros-galactic, comment next block if ros not wanted
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update
sudo apt install -y ros-galactic-ros-base python3-colcon-common-extensions
echo "source /opt/ros/galactic/setup.zsh" >> $HOME/.zshrc
echo "export ROS_DOMAIN_ID=19" >> ~/.zshrc 
echo "source /usr/share/colcon_cd/function/colcon_cd.sh" >> ~/.zshrc
echo "export _colcon_cd_root=/opt/ros/galactic/" >> ~/.zshrc
echo "source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash" >> ~/.zshrc

# install node version manager
curl -fsSL https://fnm.vercel.app/install | bash
export PATH=$HOME/.fnm:$PATH
eval "$(fnm env --use-on-cd)"
fnm install v16.14.0

# setup static ip
sudo cp 50-cloud-init.yaml /etc/netplan/
sudo vim /etc/netplan/50-cloud-init.yaml # edit configs according to your need
sudo netplan apply

# reboot
