#!/bin/bash

#sudo apt-get install libc6-armel-cross libc6-dev-armel-cross
#sudo apt-get install binutils-arm-linux-gnueabi
#sudo apt-get install gcc-arm-linux-gnueabi
#sudo apt-get install g++-arm-linux-gnueabi
#sudo apt-get install libncurses5-dev

PWD_DIR=$(pwd)

DIR_BIN="${PWD_DIR}/bin/"
DIR_U_BOOT_SUNXI="${PWD_DIR}/../tools/u-boot-sunxi/"
DIR_LINUX_SUNXI="${PWD_DIR}/../tools/linux-sunxi/"

FILE_DISK="${DIR_BIN}/disk.img"

SIZE_DISK=8000


cd ${DIR_U_BOOT_SUNXI}

make CROSS_COMPILE=arm-linux-gnueabi- BananaPro_config
make CROSS_COMPILE=arm-linux-gnueabi-

cd ${DIR_LINUX_SUNXI}

make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- sun7i_defconfig
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- menuconfig
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- uImage modules
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- INSTALL_MOD_PATH=output modules_install


mkdir -p ${DIR_BIN}

dd if=/dev/zero of=${FILE_DISK} bs=1M count=${SIZE_DISK}