# install nvidia driver
cd $HOME/Downloads
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.0-1_all.deb
sudo apt update
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/x86_64/nvidia-driver-570_570.86.15-0ubuntu1_amd64.deb
sudo apt install -y ./nvidia-driver-570_570.86.15-0ubuntu1_amd64.deb
rm nvidia-driver-570_570.86.15-0ubuntu1_amd64.deb
cd $HOME


