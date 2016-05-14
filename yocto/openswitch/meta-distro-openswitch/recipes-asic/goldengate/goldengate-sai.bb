UMMARY = "Centec SAI to program GoldenGate"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE.md;md5=476a2edccdd770fce19c5e019fabb437"

DEPENDS = "libxml2 libpcap lmsensors"

DEPENDS_${PN} += "systemd"

PROVIDES = "virtual/sai"
RPROVIDES_${PN} = "virtual/sai"

SRC_URI = "http://192.168.25.50/goldengate-sai.tar.bz2"

inherit module-base
inherit kernel-module-split

# When using AUTOREV, we need to force the package version
# to the revision of git in order to avoid stale shared states.

S = "${WORKDIR}/goldengate-sai"

# Avoid running make clean during configuration stage
CLEANBROKEN = "1"

do_install() {
    # Installing headers
    install -d ${D}${includedir}
    cp -Rp ${S}/include/* ${D}${includedir}

    # Installing library
    install -d ${D}${libdir}/pkgconfig
    install -m 0755 ${S}/lib/libsai.so.1.0.0 ${D}${libdir}
    ln -s libsai.so.1.0.0 ${D}${libdir}/libsai.so
    install -m 0655 ${S}/lib/sai.pc ${D}${libdir}/pkgconfig


    # Installing kernel modules
    install -d ${D}/lib/modules/${KERNEL_VERSION}/extra
    install -m 0644 ${S}/lib/modules/dal.ko ${D}/lib/modules/${KERNEL_VERSION}/extra
}

INSANE_SKIP_${PN} += "already-stripped"
INSANE_SKIP_${PN} += "ldflags"

inherit openswitch
