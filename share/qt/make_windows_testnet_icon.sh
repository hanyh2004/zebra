#!/bin/bash
# create multiresolution windows icon
ICON_SRC=../../src/qt/res/icons/zebra_testnet.png
ICON_DST=../../src/qt/res/icons/zebra_testnet.ico
convert ${ICON_SRC} -resize 16x16 zebra_testnet-16.png
convert ${ICON_SRC} -resize 32x32 zebra_testnet-32.png
convert ${ICON_SRC} -resize 48x48 zebra_testnet-48.png
convert zebra_testnet-16.png zebra_testnet-32.png zebra_testnet-48.png ${ICON_DST}
