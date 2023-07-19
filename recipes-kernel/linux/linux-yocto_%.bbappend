FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
#AT: Ignore these when using KERNEL_FEATURES
#SRC_URI += "\
#        file://wireguard.cfg \
#        "

#AT: Storing kernel metadata locally: 
SRC_URI:append = "\ 
        file://myboard;type=kmeta;name=myboard;destsuffix=myboard \
        "
KERNEL_FEATURES:append = " features/vpn.scc" 

#AT: Changing kernel type using KERNEL_FEATURES is ignored ...
#KERNEL_FEATURES:append = " bsp/qemuarm64/qemuarm64-preempt-rt.scc"

#AT: This builds a kernel with the PREEMPT-RT patches ...
LINUX_KERNEL_TYPE = "preempt-rt"
