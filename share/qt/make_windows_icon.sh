#!/bin/bash
# create multiresolution windows icon
ICON_SRC=../../src/qt/res/icons/zebra.png
ICON_DST=../../src/qt/res/icons/zebra.ico
convert ${ICON_SRC} -resize 16x16 zebra-16.png
convert ${ICON_SRC} -resize 32x32 zebra-32.png
convert ${ICON_SRC} -resize 48x48 zebra-48.png
convert zebra-16.png zebra-32.png zebra-48.png ${ICON_DST}
