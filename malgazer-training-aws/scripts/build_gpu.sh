cd ~/
apt-get install -y openjdk-8-jdk build-essential swig libcurl3-dev

curl -O http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
dpkg -i ./cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
apt-get update
apt-get install cuda=9.0.176-1 -y

wget https://developer.nvidia.com/compute/cuda/9.0/Prod/local_installers/cuda_9.0.176_384.81_linux-run
mv cuda_9.0.176_384.81_linux-run cuda_9.0.176_384.81_linux-run.sh
sh cuda_9.0.176_384.81_linux-run.sh

# https://developer.nvidia.com/compute/machine-learning/cudnn/secure/v7.3.1/prod/9.0_2018927/cudnn-9.0-linux-x64-v7.3.1.20
tar -xzvf /tmp/cudnn-9.0-linux-x64-v7.3.1.20.tgz
cp cuda/include/cudnn.h /usr/local/cuda/include
cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*

export PATH=/usr/local/cuda-9.0/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export CUDA_HOME=/usr/local/cuda

pip3 uninstall -y tensorflow
pip3 install tensorflow-gpu==1.10

nvcc --version
