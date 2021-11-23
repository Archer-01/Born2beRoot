#!/bin/bash

VG=LVMGroup
LV_PREFIX=/dev/mapper/${VG}
LV_NAMES=(home var srv tmp var--log)
SWAP_PARTITION=${LV_PREFIX}-swap

# EXT4 Partitions
for i in ${!LV_NAMES[@]}
do
	mkfs.ext4 ${LV_PREFIX}-${LV_NAMES[$i]}
done

# Swap Partition
mkswap $SWAP_PARTITION
swapon $SWAP_PARTITION
