#!/bin/bash

./init_jailhouse_env.sh

cp /run/media/boot-mmcblk1p1/Image /usr/share/jailhouse/inmates/kernel/
cp /run/media/boot-mmcblk1p1/imx93-11x11-evk-inmate.dtb /usr/share/jailhouse/inmates/dtb
../tools/jailhouse disable;

../tools/jailhouse enable ../cells/imx93.cell;
../tools/jailhouse cell linux \
                   ../cells/imx93-linux-demo.cell \
                   ../inmates/kernel/Image        \
                -d ../inmates/dtb/imx93-11x11-evk-inmate.dtb \
                -c "clk_ignore_unused console=ttyLP1,115200 root=/dev/mmcblk0p2 rootwait rw"

