#! /bin/bash

# Install packages...
apt-get update
apt-get install -y python3 python3-pip
apt-get install -y \
  gcc \
  git \
  tk \
  python3-tk \
  libfftw3-dev \
  libhdf5-serial-dev \
  libmagic-dev \
  curl \
  cifs-utils \
  tmux \
  htop \
  expect

# Get the source code...
mkdir -p /Source
cd /Source
git clone https://github.com/keithjjones/malgazer.git
cd malgazer
git checkout develop
chown -R ubuntu:ubuntu /Source
pip3 install -r requirements.txt
#sudo -u ubuntu pip3 install -r requirements.txt

# Copy the data over...
mkdir -p /mnt/data
chown -R ubuntu:ubuntu /mnt/data
cd /mnt/data
# sudo -u kjones cp -R /mnt/virustotal/RWE /mnt/virustotal/GIST /mnt/virustotal/CSV /mnt/data
# sudo -u kjones cp -R /mnt/virustotal/GIST /mnt/virustotal/CSV /mnt/data
# sudo -u kjones mkdir RWE
# sudo -u kjones cp /mnt/virustotal/RWE/rwe_window_256_datapoints_1024.hdf RWE
# ln -s /mnt/virustotal/RWE RWE
# ln -s /mnt/virustotal/GIST GIST
# ln -s /mnt/virustotal/CSV CSV
