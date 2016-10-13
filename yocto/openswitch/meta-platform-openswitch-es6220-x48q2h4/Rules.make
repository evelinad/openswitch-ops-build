# Copyright (C) 2016 EmbedWay Technologies (Shanghai) Corporation. All Rights Reserved.

DISTRO_KERNEL_FILE = $(BASE_BZIMAGE_FILE)
DISTRO_FS_FILE = $(BASE_CPIO_FS_FILE)
DISTRO_FS_TARGET = openswitch-disk-image
ONIE_INSTALLER_RECIPE = openswitch-onie-installer
ONIE_INSTALLER_FILE = onie-installer-x86_64-es6220_x48q2h4

# For this platform we create an onie-installer
all:: onie-installer
