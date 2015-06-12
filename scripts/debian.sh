#!/bin/sh

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install build-essential u-boot-tools uboot-mkimage binutils-arm-linux-gnueabihf gcc-4.7-arm-linux-gnueabihf-base g++-4.7-arm-linux-gnueabihf 
sudo apt-get install gcc-arm-linux-gnueabihf cpp-arm-linux-gnueabihf libusb-1.0-0 libusb-1.0-0-dev git wget fakeroot kernel-package zlib1g-dev libncurses5-dev