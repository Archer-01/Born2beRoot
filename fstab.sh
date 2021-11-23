#!/bin/bash

FSTAB_PATH=/etc/fstab
LV_NAMES=(home var: srv tmp var--log)
LV_MOUNTPOINTS=(/home /var /srv /tmp /var/log)

# SWAP Partition
UUID=$(blkid | grep "swap" | cut -d '"' -f 2)
echo UUID=${UUID} none swap sw 0 0 >> $FSTAB_PATH

# Other Partitions
for i in ${!LV_NAMES[@]}
do
	UUID=$(blkid | grep ${LV_NAMES[$i]} | cut -d '"' -f 2)
	echo UUID=${UUID} ${LV_MOUNTPOINTS[$i]} ext4 defaults 0 0 >> $FSTAB_PATH
done
