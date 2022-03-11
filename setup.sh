# download packages info and upgrade packages
sudo apt update && sudo apt upgrade -y

# install packages
sudo apt install -y \
    curl \
    build-essential \
    git \
    tmux \
    python3-dev \
    python3-pip \

# install ros-galactic
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update
sudo apt install -y ros-galactic-ros-base python3-colcon-common-extensions
echo "source /opt/ros/galactic/setup.bash" >> $HOME/.bashrc
echo "export ROS_DOMAIN_ID=19" >> ~/.bashrc 
echo "source /usr/share/colcon_cd/function/colcon_cd.sh" >> ~/.bashrc
echo "export _colcon_cd_root=/opt/ros/galactic/" >> ~/.bashrc
echo "source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash" >> ~/.bashrc

# setup dev rules
cd $HOME/setup_new_pi
sudo apt install rpi.gpio-common
pip install pip --upgrade
pip install gpiozero RPi.GPIO
sudo adduser "${USER}" dialout  # optional
sudo cp 90-gpio-spi.rules /etc/udev/rules.d/
sudo groupadd -f --system gpio
sudo usermod -aG gpio ubuntu
sudo groupadd -f --system spi
sudo usermod -aG spi ubuntu
# TODO: config picamera

# setup static ip
sudo cp 50-cloud-init.yaml /etc/netplan/
sudo nano /etc/netplan/50-cloud-init.yaml # edit configs according to your need
sudo netplan apply

# reboot
echo "Now, you can restart your Pi"
