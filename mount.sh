#!/bin/bash

VG=LVMGroup
LV_PREFIX=/dev/mapper/${VG}
LV_NAMES=(home var srv tmp var--log)
LV_MOUNTPOINTS=(/home /var /srv /tmp /var/log)

if [ ! -d "/var/log" ]; then
	mkdir "/var/log"
fi

for i in ${!LV_NAMES[@]}
do
	mount "${LV_PREFIX}-${LV_NAMES[$i]}" "${LV_MOUNTPOINTS[$i]}"
done
