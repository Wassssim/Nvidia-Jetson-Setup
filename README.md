# Nvidia-Jetson-Setup

This repository contains helper scripts that automate the configuration and installation steps for the following elements:
- Deepstream SDK 6.0
- Deepstream SDK 5.1 (default version)

<b> NOTE:</b> the python bindings installation only works for Deepstream 6.0

Run
`sudo ./install_deepstream_debpackage.sh` To install deepstream and all its prerequisites through the debian package method

Run `sudo ./test_deepstream.sh` To check if the deepstream installation is working correctly

This was tested on the Nvidia Jetson Nano in headless mode, with a fresh installation of the Jetpack 4.5.1 and 4.6

This repository is still under WIP (Work in Progress)
