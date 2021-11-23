#!/bin/bash

VG=LVMGroup
LV_PREFIX=/dev/mapper/${VG}
LV_NAMES=(home var srv tmp var--log)
LV_MOUNTPOINTS=(/home /var /srv /tmp /var/log)

for i in ${!LV_NAMES[@]}
do
	[ "${LV_NAMES[$i]}" = "var--log" ] && mkdir -p "/var/log"
	mount "${LV_PREFIX}-${LV_NAMES[$i]}" "${LV_MOUNTPOINTS[$i]}"
done
