#!/bin/bash
if [ ! -d "/opt/nvidia/deepstream/deepstream/sources/apps/sample_apps/deepstream-test1-rtsp_out/" ] 
then
	cp -rv ./deepstream-test1-rtsp_out /opt/nvidia/deepstream/deepstream/sources/apps/sample_apps/ 
fi


#Base dependencies
apt install -y git python-dev python3 python3-pip python3.6-dev python3.8-dev cmake g++ build-essential \
	    libglib2.0-dev libglib2.0-dev-bin python-gi-dev libtool m4 autoconf automake


#Initialization of submodules
git submodule update --init

#Install with Pip
wget -nc https://github.com/NVIDIA-AI-IOT/deepstream_python_apps/releases/download/v1.1.0/pyds-1.1.0-py3-none-linux_aarch64.whl

pip3 install ./pyds-1.1.0-py3-none*.whl
