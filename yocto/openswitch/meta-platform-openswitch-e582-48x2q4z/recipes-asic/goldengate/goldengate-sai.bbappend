# Copyright (C) 2016 Centec Networks (suzhou) Co., Ltd. All Rights Reserved.

PR_append = "_e582_48x2q4z"

do_install_append() {
    # Install datapath files
    install -d ${D}/etc/spec
    install -d ${D}/etc/datapath_profile
    install -m 0644 ${S}/platform/e582-48x2q4z/spec.txt ${D}/etc/spec/
    install -m 0644 ${S}/platform/e582-48x2q4z/datapath_cfg.txt ${D}/etc/datapath_profile/

    # Install kernel modules
    cd ${S}/dal
    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
    oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" \
        CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
        O=${STAGING_KERNEL_BUILDDIR} modules_install
}
