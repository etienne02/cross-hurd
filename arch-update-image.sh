#!/bin/bash

. ./vars.sh

LOOP=$(sudo losetup -f)
LOOPPART="${LOOP}p1"
IMG=hd.img

mount_image () {
   mkdir -p mount &&
      sudo losetup -P $LOOP $IMG &&
	  sudo partprobe $LOOP &&
      sudo mount -o rw -t ext2 $LOOPPART mount
}

clean_root () {
   sudo rm -rf mount/root/* &&
   sudo rm -rf mount/arch/*
}

copy_arch_repo () {
	sudo mkdir -p mount/arch/ &&
	sudo cp -r archhurd-repo mount/arch/ &&
	sudo cp arch-prepare.sh mount/root/ &&
	sudo chmod u+x mount/root/arch-prepare.sh &&
	sudo cp arch-compile.sh mount/arch/ &&
	sudo chmod u+x mount/arch/arch-compile.sh &&
	sudo chown 1001:1001 -R mount/arch/
}

umount_image () {
   print_info "Umounting $LOOP"
   sudo umount mount >/dev/null 2>&1 &&
      sudo losetup -d $LOOP &&
      rmdir mount
}

trap umount_image EXIT
trap umount_image INT

mount_image &&
   clean_root &&
   copy_arch_repo  &&
   umount_image &&
print_info "Done" &&
exit 0
