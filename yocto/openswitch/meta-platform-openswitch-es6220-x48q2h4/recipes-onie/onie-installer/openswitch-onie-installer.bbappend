# Copyright (C) 2016 EmbedWay Technologies (Shanghai) Corporation. All Rights Reserved.

PR_append = "_es6220_x48q2h4"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "\
        file://onie.config \
"

IMAGE_NAME = "openswitch-disk-image"
ONIE_PREFIX = "x86_64-es6220_x48q2h4"
