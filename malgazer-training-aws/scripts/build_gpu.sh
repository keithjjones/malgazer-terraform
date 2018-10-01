cd ~/
apt-get update
apt-get upgrade -y
apt-get install -y gcc

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

nvcc --version
