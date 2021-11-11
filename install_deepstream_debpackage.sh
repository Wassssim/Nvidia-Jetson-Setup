#!/bin/bash

DS_VERSION="5.1"
SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

#Install Dependencies
apt update -y
apt install -y \
	libssl1.0.0 \
	libgstreamer1.0-0 \
	gstreamer1.0-tools \
	gstreamer1.0-plugins-good \
	gstreamer1.0-plugins-bad \
	gstreamer1.0-plugins-ugly \
	gstreamer1.0-libav \
	libgstrtspserver-1.0-0 \
	libgstrtspserver-1.0-dev \
	gstreamer1.0-rtsp \
	libjansson4=2.11-1 \
	libgstreamer-plugins-base1.0-dev \

#Install librdkafka
git clone https://github.com/edenhill/librdkafka.git
cd librdkafka
git reset --hard 7101c2310341ab3f4675fc565f64f0967e135a6a
./configure
make
sudo make install
sudo mkdir -p /opt/nvidia/deepstream/deepstream-$DS_VERSION/lib
sudo cp /usr/local/lib/librdkafka* /opt/nvidia/deepstream/deepstream-5.1/lib


#Install latest NVIDIA BSP packages
apt update
apt install --reinstall -y nvidia-l4t-gstreamer
apt install --reinstall -y nvidia-l4t-multimedia
apt install --reinstall -y nvidia-l4t-core


#Install the DeepStream SDK
cd $SCRIPT_DIR
printf '%.0s-' {1..25};printf ' Installing Deepstream '; printf '%.0s-' {1..25}; echo "";

#wget -nc https://developer.download.nvidia.com/assets/Deepstream/DeepStream_6.0/deepstream-6.0_6.0.0-1_arm64.deb?ob1SL3LsOlN2gUEqCtjZd008fnzj9lk-Lpuo7O_Z2DnyTIWXhgY0TKyaCtA1nzhREdoPIKg7yspAVtsyKpRLYjIau4ToVc4BPHJZm1q0BFOgulEgg3s-5N0eZFAaJ7uyeTct5LRs8p8FVyyCtiV3_-4o65tZ8V1EbXYpHpoIIz8 -O deepstream-6.0_6.0.0-1_arm64.deb
wget -nc https://developer.download.nvidia.com/assets/Deepstream/DeepStream_${DS_VERSION}/deepstream-${DS_VERSION}_${DS_VERSION}.0-1_arm64.deb

apt-get install -y ./deepstream-${DS_VERSION}_${DS_VERSION}.0-1_arm64.deb

#Install python dependencies
apt-get install -y gstreamer1.0-rtsp
apt-get install -y libgirepository1.0-dev
apt-get install -y gobject-introspection gir1.2-gst-rtsp-server-1.0
apt update
apt install -y python3-pip
