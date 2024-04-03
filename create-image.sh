#!/bin/bash

. ./vars.sh

LOOP=$(sudo losetup -f)
LOOPPART="${LOOP}p1"
IMG=hd.img
IMG_SIZE=50GB
BASE_SYS_ROOT=$(basename $SYS_ROOT)

create_image() {
   print_info "Creating disk image $IMG using $LOOP..."
   fallocate -l $IMG_SIZE $IMG &&
      sudo losetup $LOOP $IMG &&
      sudo parted -a optimal -s $LOOP mklabel msdos &&
      sudo parted -a optimal -s $LOOP -- mkpart primary ext2 2048s -1 &&
      sudo parted -s $LOOP -- set 1 boot on &&
      sudo losetup -d $LOOP &&
      sudo losetup -P $LOOP $IMG &&
      sleep 2 &&
      sudo mkfs.ext2 -o hurd -m 1 -v $LOOPPART
}

mount_image() {
   mkdir -p mount &&
      sudo mount -o rw -t ext2 $LOOPPART mount &&
      sudo chmod ogu+w -R mount/
}

copy_files() {
   print_info "Copying system into mount..."
   mkdir -p mount/{etc,boot,dev,usr,hurd,include,servers,lib,libexec,proc,sbin,bin,var,root,run,share} &&
      mkdir -p mount/var/{run,lib,log} &&
      install -d -m700 mount/var/lib/sshd &&
      mkdir -p mount/servers/{socket,bus} &&
      cp -R files/etc/* mount/etc/ &&
      cp -R files/bin/* mount/bin/ &&
      mkdir -p mount/etc/hurd &&
      cp files/runsystem.hurd mount/libexec/ &&
      chmod ogu+x mount/libexec/runsystem.hurd &&
      mkdir -p mount/boot/grub &&
      cp files/boot/grub.cfg mount/boot/grub/grub.cfg &&
      cp $SYSTEM/boot/gnumach.gz mount/boot &&
      mkdir -p mount/servers &&
      touch mount/servers/{acpi,exec,crash-kill,default-pager,password,socket,startup,proc,auth,symlink} &&
      mkdir mount/tmp && chmod 01777 mount/tmp &&
      cp -R $SYSTEM/$BASE_SYS_ROOT/hurd/* mount/hurd/ &&
      cp -R $SYSTEM/$BASE_SYS_ROOT/dev/* mount/dev/ &&
      cp -R $SYSTEM/$BASE_SYS_ROOT/include/* mount/include/ &&
      cp -R $SYSTEM/$BASE_SYS_ROOT/sbin/* mount/sbin/ &&
      cp -R $SYSTEM/$BASE_SYS_ROOT/bin/* mount/bin/ &&
      cp -R $SYSTEM/$BASE_SYS_ROOT/lib/* mount/lib/ &&
      cp -R $SYSTEM/$BASE_SYS_ROOT/share/* mount/share/ &&
      cp -R $SYSTEM/$BASE_SYS_ROOT/etc/* mount/etc/ &&
      cp -R $SYSTEM/$BASE_SYS_ROOT/libexec/* mount/libexec/ &&
      sudo cp -R /usr/share/X11/locale mount/share/X11 &&  # HACK HACK HACK to have compose working
      cp files/{rc,runsystem} mount/libexec/ &&
	  mkdir -p mount/share/hurd &&
      (if [ -f mount/lib/ld-x86-64.so.1 ]; then
         ln -sfv /lib/ld-x86-64.so.1 mount/lib/ld.so
      else
         ln -sfv /lib/ld.so.1 mount/lib/ld.so
      fi) &&
      ln -svf / mount/$BASE_SYS_ROOT &&
      ln -svf /bin/bash mount/bin/sh &&
      #ln -svf /bin/dash mount/bin/sh &&
      ln -svf /bin/gcc mount/bin/cc &&
      ln -svf /bin/i686-gnu-mig mount/bin/mig &&
      ln -svf /bin mount/usr/bin &&
      ln -svf /share mount/usr/share &&
      #ln -svf /etc/mtab mount/proc/mount &&
      #ln -svf /var/run/mtab mount/proc/mount &&
	  cp $CROSS_TOOLS/lib/gcc/i686-gnu/${GCC_VERSION}/include/limits.h mount/lib/gcc/i686-gnu/${GCC_VERSION}/include/limits.h &&
      cp files/SETUP mount/ &&
      mkdir mount/lib/locale &&
      chmod +x mount/SETUP &&
      rm -f manifest-$CPU.txt &&
      pushd mount &&
      (find . >../manifest-$CPU.txt || true) &&
      popd &&
      # Create a motd message.
      echo "Welcome to the HURD!" >mount/etc/motd &&
      echo "Cross-compiled from a $HOST on $(date)" >>mount/etc/motd &&
      # Ensure all files are owned by root inside the system image.
      sudo chown root:root -R mount/*
}

install_grub() {
   print_info "Installing the GRUB on $IMG..."
   sudo grub-install --target=i386-pc --directory=$SYS_ROOT/lib/grub/i386-pc --boot-directory=$PWD/mount/boot $LOOP
}

umount_image() {
   print_info "Umounting $LOOP"
   sudo umount mount >/dev/null 2>&1 &&
      sudo losetup -d $LOOP &&
      rmdir mount
}

qemu_arch() {
   if [ "$CPU" = "i686" ]; then
      echo "i386"
   else
      echo "x86_64"
   fi
}

post_install () {
    #sudo cp -R src/$PERL_SRC mount/root &&
    sudo cp -R src/$AUTOCONF_SRC mount/root &&
    sudo cp -R src/$AUTOMAKE_SRC mount/root &&
    sudo cp -R src/$AUTOCONF_ARCHIVE_SRC mount/root &&
    sudo cp -R src/$GETTEXT_SRC mount/root &&
    sudo cp -R src/$PO4A_SRC mount/root &&
    sudo cp -R src/$BISON_SRC mount/root &&
    sudo cp -R src/$PKGCONF_SRC mount/root &&
    sudo cp -R src/$PYTHON_SRC mount/root &&
    sudo cp -R src/$OPENSSL_SRC mount/root &&
    sudo cp -R src/$LIBARCHIVE_SRC mount/root &&
    sudo cp -R src/$NINJA_SRC mount/root &&
    #sudo cp -R src/$LIBXKBCOMMON_SRC mount/root &&
    #sudo cp -R src/$XKEYBOARD_CONFIG_SRC mount/root &&
    sudo cp -RL src/$HURD_SRC mount/root &&
    sudo cp -R src/$TEXINFO_SRC mount/root &&
    sudo cp -R src/$GZIP_SRC mount/root &&

    sudo cp -R src/$CURL_SRC mount/root &&
    sudo cp -R src/$GIT_SRC mount/root &&
    sudo cp -R src/$PACMAN_SRC mount/root &&
    sudo cp -R src/$SUDO_SRC mount/root &&

    sudo cp -R src/$CMAKE_SRC mount/root &&
    sudo cp -R src/$ZSTD_SRC mount/root &&
    sudo cp -R src/$PERL_INC_LATEST_SRC mount/root &&
    sudo cp -R src/$PERL_BUILD_SRC mount/root &&
    sudo cp -R src/$BASH_SRC mount/root &&

    sudo cp package-versions.sh mount/root/ &&
    sudo cp package-vars.sh mount/root/ &&
    sudo cp step1.sh mount/root/ &&
    sudo chown root:root -R mount/root/* &&
    sudo chmod u+x mount/root/step1.sh

    sudo mkdir -p mount/opt/meson &&
    sudo cp -R src/$MESON_SRC/* mount/opt/meson &&

    sudo mkdir -p mount/home/aur &&
    sudo chown 1001:1001 mount/home/aur
}

qemu_net() {
   local network_hardware="nic,model=e1000"
   echo "-net user$(if [[ -f $SYS_ROOT/sbin/sshd ]]; then echo ",hostfwd=tcp:127.0.0.1:2222-:22"; fi) -net $network_hardware"
}

trap umount_image EXIT
trap umount_image INT

umount mount >/dev/null 2>&1
sudo losetup -d $LOOP >/dev/null 2>&1
rm -f $IMG
create_image &&
   mount_image &&
   copy_files &&
   install_grub &&
   post_install &&
   print_info "Disk image available on $IMG" &&
   print_info "Run the following command to boot the image:" &&
   echo "    qemu-system-$(qemu_arch) --enable-kvm -m 4G -drive cache=writeback,file=$IMG -M q35 $(qemu_net)" &&
   exit 0
