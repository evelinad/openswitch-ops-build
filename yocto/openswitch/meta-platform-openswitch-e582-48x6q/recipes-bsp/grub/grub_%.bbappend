# Copyright (C) 2016 Centec Networks (suzhou) Co., Ltd. All Rights Reserved.

PR_append = "_e582_48x6q"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
  file://00-serial-setup.cfg \
"
