
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# linux-imx kernels use delta configs instead of fragments:

DELTA_KERNEL_DEFCONFIG:append = " myboard/cfg/usb-kaw-eth.config"

#SRC_URI += "\
#	file://myboard/cfg/wireguard.cfg \
#        file://defconfig \
#        "


## Begin linux-yocto setup. 
#  It can be enabled alongside the DELTA_KERNEL_DEFCONFIG 
#  It make the kernel build use linux-yocto style 
#  configuration tasks. 
#  Uncomment the following (to the end of file):
#require recipes-kernel/linux/linux-yocto.inc
#inherit kernel-yocto

#  IGNORE missing Kernel Features
#  We are only appending a few kernel fragments:
KERNEL_DANGLING_FEATURES_WARN_ONLY = "1"


#  Storing kernel metadata locally: 
SRC_URI:append = "\ 
        file://myboard;type=kmeta;name=myboard;destsuffix=myboard \
        "
KERNEL_FEATURES:append = " features/vpn.scc" 

#  This builds a kernel with the PREEMPT-RT patches ...
#LINUX_KERNEL_TYPE = "preempt-rt"

#  IMPORTANT: linux-imx kernels discard Yocto fragments when calling do_copy_defconfig.
#  We have collected the linux-imx defconfig and made it available in the kernel metadata. 
#  So we override this function: 
do_copy_defconfig() {
}
#  This is disabled for linux-imx kernels, renable it:
unset do_kernel_configcheck[noexec]

#### End linux-yocto setup
