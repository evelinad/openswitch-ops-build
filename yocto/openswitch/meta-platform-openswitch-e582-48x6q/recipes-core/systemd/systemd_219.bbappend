# Copyright (C) 2016 Centec Networks (suzhou) Co., Ltd. All Rights Reserved.

PR_append = "_e582_48x6q"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "\
        file://kexec-reboot.service \
        file://onie-install.target \
        file://onie-install.service \
"

do_install_append() {
    install -d ${D}$/lib/systemd/system
    install -m 755 ${WORKDIR}/kexec-reboot.service ${D}/lib/systemd/system
    install -m 755 ${WORKDIR}/onie-install.service ${D}/lib/systemd/system
    install -m 755 ${WORKDIR}/onie-install.target ${D}/lib/systemd/system
    install -d ${D}${sysconfdir}/systemd/system/kexec.target.wants/
    ln -sf /lib/systemd/system/kexec-reboot.service ${D}${sysconfdir}/systemd/system/kexec.target.wants/kexec-reboot.service
}
