#!/sbin/sh

#Unmount Partitions
umount /system_root 2>&1 | grep message
umount /product 2>&1 | grep message
umount /vendor 2>&1 | grep message
umount /system_ext 2>&1 | grep message


mount -o rw /system_root | grep message
mount -o rw /product | grep message
mount -o rw /vendor | grep message
mount -o rw /system_ext | grep message

#Set Mounted Partitions As R/W
/bin/blockdev --setrw /dev/block/mapper/system | grep message
/bin/blockdev --setrw /dev/block/mapper/product | grep message
/bin/blockdev --setrw /dev/block/mapper/vendor | grep message
/bin/blockdev --setrw /dev/block/mapper/system_ext | grep message
/bin/blockdev --setrw /dev/block/platform/bootdevice/by-name/md_udc