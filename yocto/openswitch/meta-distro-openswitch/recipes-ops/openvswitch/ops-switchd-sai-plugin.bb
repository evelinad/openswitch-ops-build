UMMARY = "OpenSwitch vswitchd SAI plugin"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"

DEPENDS = "ops-ovsdb virtual/sai ops-switchd"

PROVIDES += "virtual/ops-switchd-switch-api-plugin"
RPROVIDES_${PN} += "virtual/ops-switchd-switch-api-plugin"

SRC_URI = "git://github.com/Centecnetworks/openswitch-ops-switchd-sai-plugin;protocol=http"

FILES_${PN} = "${libdir}/openvswitch/plugins"

SRCREV = "7430715271999f432353ff3a40067307e4771f23"

# When using AUTOREV, we need to force the package version to the revision of git
# in order to avoid stale shared states.
PV = "git${SRCPV}"

S = "${WORKDIR}/git"

inherit openswitch cmake
