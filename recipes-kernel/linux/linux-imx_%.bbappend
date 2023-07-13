FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

#AT: linux-imx kernels use delta configs instalead of fragments:
#DELTA_KERNEL_DEFCONFIG:append = " wireguard.config"

#SRC_URI += "\
#	file://myboard/cfg/wireguard.cfg \
#        file://defconfig \
#        "


#### Begin linux-yocto setup

#AT: ALTERNATIVELY - to make this kernel use 
# linux-yocto style fragments and kernel features, 
# uncomment the following (to the end of file):
#inherit kernel
#require recipes-kernel/linux/linux-yocto.inc

# IGNORE missing Kernel Features
# We are only appending a few kernel fragments:
KERNEL_DANGLING_FEATURES_WARN_ONLY = "1"


#AT: Storing kernel metadata locally: 
SRC_URI:append = "\ 
        file://myboard;type=kmeta;name=myboard;destsuffix=myboard \
        "
KERNEL_FEATURES:append = " features/vpn.scc" 

#AT: This builds a kernel with the PREEMPT-RT patches ...
#LINUX_KERNEL_TYPE = "preempt-rt"

# linux-imx kernels prevents Yocto fragments - override this function: 
do_copy_defconfig() {
}
#This is disabled for linux-imx kernels, renable it:
unset do_kernel_configcheck[noexec]

#### End linux-yocto setup
