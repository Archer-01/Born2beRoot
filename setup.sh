#!/bin/bash

echo "Born2beRoot PARTITION SETUP -  By {hhamza}"
echo -n "Begin [Y/n]? "
read ANSWER

[ "${ANSWER:-y}" = "n" ] && echo "SETUP ABORTED" && exit
[ "${ANSWER:-y}" != "y" ] && echo "not y" && exit

clear

echo "----------CREATING LOGICAL VOLUMES----------"
source ./lvm.sh

echo "-------------MAKING FILESYSTEMS-------------"
source ./fs.sh

echo "-------------MOUNTING PARTITIONS------------"
source ./mount.sh
