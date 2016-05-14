inherit kernel
require linux.inc

LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"

KERNEL_RELEASE = "3.19"
S = "${WORKDIR}/linux-3.19"

PR = "r1"
PV = "${KERNEL_RELEASE}"

SRC_URI = "http://archive.openswitch.net/linux-3.19.tar.xz;name=kernel \
"

SRC_URI[kernel.md5sum] = "d3fc8316d4d4d04b65cbc2d70799e763"
SRC_URI[kernel.sha256sum] = "be42511fe5321012bb4a2009167ce56a9e5fe362b4af43e8c371b3666859806c"

do_install_append() {
   #remove empty directories to avoid errors during packaging
   find ${D}/lib/modules -empty | xargs rm -rf
}

# Disabling this logic since it's not sstate aware and therefore triggers
# unrequired builds and slows CI
#
# do_import_dts() {
#   if test "${ARCH}" = "powerpc" ; then
#      if test -n "${PLATFORM_DTS_FILE}" ; then
#         echo "Updating in-kernel dts file with ${PLATFORM_DTS_FILE}"
#         cp ${PLATFORM_DTS_FILE} ${S}/arch/powerpc/boot/dts/
#      fi
#   fi
#}
#
#addtask do_import_dts after do_patch before do_compile
