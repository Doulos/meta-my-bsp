This README file contains information on the contents of the meta-my-bsp layer.

 The layer demonstrates how to modify a kernel using append recipes to:
 + configure additional in-tree modules (e.g CONFIG_WIREGUARD)
 + add the skeleton hello-mod recipe

## Compatible Machines
+ QEMU emulators (only tested with qemuarm64)
+ NXP i.MX 93 EVK (imx93-11x11-lpddr4x-evk)

## Dependencies

  URI: https://github.com/yoctoproject/poky.git
  branch: kirkstone

  URI: https://github.com/Doulos/meta-my-bsp.git 
  branch: kirkstone

  When building for the i.MX 93 EVK, see:
  https://www.nxp.com/docs/en/user-guide/REALTIMEEDGEUG_Rev2.4.pdf (Realtime Edge User Guide)
  https://www.nxp.com.cn/docs/en/user-guide/RTEDGEYOCTOUG_Rev2.4.pdf (Realtime Edge Yocto User Guide)



## Quick start using Kas

Install kas (https://kas.readthedocs.io/en/latest/userguide.html):
```shell
sudo pip install kas
```

This layer contains two Kas YAML configuration files for QEMU and i.MX 93 EVK.

1. Build for QEMU ARM64
```shell
kas build meta-my-bsp/kas/qemuarm64.yml
```

2. Build for i.MX 93 EVK
```shell
kas build meta-my-bsp/kas/imx93-11x11-evk.yml 
```

## Using the Yocto built-in configuartion management feature

The *kirkstone* branch of this layer doesn't support this feature.

You need to checkout the *mickledore* branch. The README.md has additional information. 

