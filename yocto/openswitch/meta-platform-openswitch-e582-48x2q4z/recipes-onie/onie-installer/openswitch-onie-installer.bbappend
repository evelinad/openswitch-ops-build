# Copyright (C) 2016 Centec Networks (suzhou) Co., Ltd. All Rights Reserved.

PR_append = "_e582_48x2q4z"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "\
        file://onie.config \
"

IMAGE_NAME = "openswitch-disk-image"
ONIE_PREFIX = "x86_64-e582_48x2q4z"
