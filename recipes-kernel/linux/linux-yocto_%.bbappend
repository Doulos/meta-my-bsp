# AT: Ignore these when using KERNEL_FEATURES

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI += "\
        file://vpn.scc \
        "
#LINUX_KERNEL_TYPE = "preempt-rt"


#SRC_URI:qemuarm64 += "\ 
#        file://myboard;type=kmeta;destsuffix=myboard \
#        "
#

KERNEL_FEATURES:append = " vpn.scc"
