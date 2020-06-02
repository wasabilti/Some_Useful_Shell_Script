#!/bin/bash

# make udisk to be bootable and install windows system
# ref:
# https://blog.csdn.net/u013128262/article/details/91961913?utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-1.nonecase&depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-1.nonecase

read -p "Mark your U Disk label and index.eg. HELLOWORLD & disk2" tmp

diskutil list | less

read -p "Your U Disk label(eg: HELLOWORLD): " UDISK_LABEL
read -p "Your U Disk index(eg: disk2): " UDISK_INDEX

echo "Erase U Disk and make it bootable"

diskutil eraseDisk MS-DOS "$UDISK_LABEL" MBR $UDISK_INDEX

ls /Volumes

read -p "Your Windows image mounted at(eg: /Volumes/CCCOMA): " IMG_DIR

read -p "Your U Disk mounted at(eg: /Volumes/HELLOWORLD)" UDISK_DIR

echo "Start copy file..."
cp -rp $IMG_DIR/* $UDISK_DIR
echo "Done!"
