#! /bin/bash
mkdir /mnt/data
cd /mnt/data
cp -R /mnt/virustotal/RWE .
cp -R /mnt/virustotal/GIST .
mkdir -p /Source
cd /Source
git clone https://github.com/keithjjones/malgazer.git
cd malgazer
pip install -r requirements.txt
