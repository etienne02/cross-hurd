#!/bin/bash

DISK_LOOP=disk
PART_LOOP=disk1
IMG=archhurd.img

create_image() {
  echo "detecting image"
    settrans -ca -- "$DISK_LOOP" /hurd/storeio -T typed file:$IMG && # like losetup but hurd way
    echo "partitionning image" &&
    /sbin/parted -a optimal -s $DISK_LOOP -- mklabel msdos &&
    /sbin/parted -a optimal -s $DISK_LOOP -- mkpart primary ext2 2048s -1 &&
    /sbin/parted -s $DISK_LOOP -- set 1 boot on &&
    settrans -ca -- "$PART_LOOP" /hurd/storeio -T typed part:1:file:$IMG && # like losetup but hurd way
    echo "creating fs on partition" &&
    mkfs.ext2 -E root_owner=$UID:0 $PART_LOOP
}

mount_image() {
  echo "mounting image"
  settrans -ca -- mount /hurd/ext2fs $PART_LOOP # like mount but the hurd way
}

install_grub() {
  grub-install --target=i386-pc --directory=/usr/lib/grub/i386-pc --boot-directory=$PWD/mount/boot $DISK_LOOP
  cp archhurd_grub.cfg $PWD/mount/boot/grub/grub.cfg
}

umount_image() {
	settrans -g mount
	settrans -g $PART_LOOP
	settrans -g $DISK_LOOP
    rm mount $DISK_LOOP $PART_LOOP
}

do_pacstrap() {
  echo "bootsraping image"
  mkdir package-repository

  for package in $(ls $PWD/archhurd-repo/); do
    echo "copying package $package"
		for archive in $(ls ${PWD}/archhurd-repo/${package}/*.pkg.tar.gz); do
			cp "$archive" package-repository/
		done
  done

  echo "pacstraping"
  # pacstrap equivalent
  newroot=$PWD/mount &&
  mkdir -m 0755 -p "$newroot"/var/{cache/pacman/pkg,lib/pacman,log} "$newroot"/{dev,run,etc/pacman.d} &&
  mkdir -m 1777 -p "$newroot"/tmp &&
  mkdir -m 0555 -p "$newroot"/proc &&

  pacman-key --gpgdir "$newroot"/etc/pacman.d/gnupg --init &&
	  pacman -r "$newroot" -U $(ls $PWD/package-repository/*) &&
	  cp rc $newroot/usr/lib/ &&
	  cp runsystem $newroot/usr/lib/ &&
	  cp SETUP $newroot/ &&
      chmod +x $newroot/SETUP
}

trap umount_image EXIT
trap umount_image INT

create_image &&
  mount_image &&
  do_pacstrap &&
  install_grub &&
  echo "done" &&
  exit 0
