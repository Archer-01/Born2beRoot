#!/bin/bash

VG=LVMGroup
LV_NAMES=(swap home var srv tmp var-log)
LV_SIZES=(2.3G 5G 3G 3G 3G 4G)

for i in ${!LV_NAMES[@]}
do
	lvscan | grep ${LV_NAMES[$i]} > "/dev/null"
	if [ $? -ne 0 ]; then
		lvcreate $VG -n ${LV_NAMES[$i]} -L +${LV_SIZES[$i]}
	else
		echo "Logical volume ${LV_NAMES[$i]} already exists."
	fi
done
