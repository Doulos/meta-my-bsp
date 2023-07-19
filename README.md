This README file contains information on the contents of the meta-my-bsp layer.

 The layer demonstrates how to modify a kernel using append recipes to:
 + configure additional in-tree modules (e.g CONFIG_WIREGUARD)
 + add the skeleton hello-mod recipe

## Compatible Machines
+ QEMU emulators (only tested with qemuarm64)
+ NXP i.MX 93 EVK (imx93-11x11-lpddr4x-evk)

## Dependencies

  URI: https://github.com/yoctoproject/poky.git
  branch: mickledore

  URI: https://github.com/Doulos/meta-my-bsp.git 
  branch: mickledore

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
kas build kas/qemuarm64.yml
```

2. Build for i.MX 93 EVK (only tested with *kirkstone*)
```shell
kas build kas/imx93-11x11-evk.yml 
```

## Using the Yocto built-in configuartion management feature
The configuation settings used during the Webinar have been saved to the meta-my-bsp *mickledore* branch.

For the QEMU emulator, the configurations were saved using:
 "bitbake-layers save-build-conf <PATH TO>/meta-my-bsp build-qemuarm64-with-wireguard".


For the NXP i.MX 93 EVK, the configurations were saved using:
 "bitbake-layers save-build-conf <PATH TO>/meta-my-bsp build-real-time-edge-with-wireguard".


### Building QEMU core-image-minimal

Clone the *poky* build system 

```shell
git clone git://git.yoctoproject.org/poky

cd poky

git checkout origin/mickledore -t

cd ../

```

Copy or clone this meta-my-bsp layer into a directory called *layers*:

```shell
mkdir layers

cd layers

git clone https://github.com/Doulos/meta-my-bsp

cd meta-my-bsp

git chechout origin/mickledore -t

cd ..
```
We are ready to build. Make sure you have these directories at the same level:

```shell
poky
layers/meta-my-bsp
```
Fron one directory above poky, try this:

```shell
TEMPLATECONF=$(pwd)/layers/meta-my-bsp/conf/templates/build-qemuarm64-with-wireguard . poky/oe-init-build-env build-try-build-qemuarm64-with-wireguard
```

### Building NXP Realtime Edge image

To make use of this, we need to clone all the depend layers first:

```shell
mkdir yocto-real-time-edge

cd yocto-real-time-edge

repo init -u https://github.com/nxp-real-time-edge-sw/yocto-real-time-edge.git -b real-time-edge-mickledore -m real-time-edge-2.6.0.xml

repo sync
```

Then, in the same *yocto-real-time-edge* directory, create the *extra-layers* sub-directory.
The mete-my-bsp layer must be copied (or cloned) into *extra-layers*:
```shell
mkdir extra-layers

cd extra-layers

git clone https://github.com/Doulos/meta-my-bsp
```
Make sure we have the folowing directories at the same level:
```shell
extra-layers/meta-my-bsp
sources/poky
```

We are ready to build custom *yocto-real-time-edge* image:
```shell
cd ../

TEMPLATECONF=$(pwd)/extra-layers/meta-my-bsp/conf/templates/build-real-time-edge-with-wireguard soure sources/poky/oe-init-build-env build-test-real-time-edge-with-wireguard

bitbake nxp-image-real-time-edge
``` 

