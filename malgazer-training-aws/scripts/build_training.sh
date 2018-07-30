#! /bin/bash

# Install packages...
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
  cifs-utils

# Get the source code...
mkdir -p /Source
cd /Source
git clone https://github.com/keithjjones/malgazer.git
cd malgazer
chown -R kjones:kjones /Source
pip3 install -r requirements.txt

# Copy the data over...
# mkdir -p /mnt/data
# chown -R kjones:kjones /mnt/data
# chown -R kjones:kjones /mnt/virustotal
# cd /mnt/data
# cp -R /mnt/virustotal/RWE .
# cp -R /mnt/virustotal/GIST .
