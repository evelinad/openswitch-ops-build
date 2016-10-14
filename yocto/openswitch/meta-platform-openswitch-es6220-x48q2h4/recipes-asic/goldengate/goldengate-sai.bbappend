# Copyright (C) 2016 EmbedWay Technologies (Shanghai) Corporation. All Rights Reserved.

PR_append = "_es6220_x48q2h4"

do_install_append() {
    # Install datapath files
    install -d ${D}/etc/spec
    install -d ${D}/etc/datapath_profile
    install -m 0644 ${S}/platform/es6220-x48q2h4/spec.txt ${D}/etc/spec/
    install -m 0644 ${S}/platform/es6220-x48q2h4/datapath_cfg.txt ${D}/etc/datapath_profile/
    install -m 0644 ${S}/platform/es6220-x48q2h4/board_config.json ${D}/etc/spec

    # Install kernel modules
    cd ${S}/dal
    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
    oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" \
        CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
        O=${STAGING_KERNEL_BUILDDIR} modules_install
}
