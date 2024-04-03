. package-vars.sh

SOURCE=/root
SYS_ROOT=/
PROCS=1

install_python() {
   rm -rf $PYTHON_SRC.obj &&
   mkdir -p $PYTHON_SRC.obj &&
   pushd $PYTHON_SRC &&
   autoreconf -fi || autoreconf &&
   popd &&
   pushd $PYTHON_SRC.obj &&
   $SOURCE/$PYTHON_SRC/configure --prefix=$SYS_ROOT \
      --enable-shared \
	  --disable-optimizations \
	  --with-computed-gotos \
	  --without-lto \
	  --without-ensurepip &&
   make -j$PROCS &&
   make install &&
   ln -fs /bin/python3.12 /bin/python3
   ln -fs /bin/python3 /bin/python
   popd
}

install_autoconf() {
   rm -rf $AUTOCONF_SRC.obj &&
   mkdir -p $AUTOCONF_SRC.obj &&
   pushd $AUTOCONF_SRC.obj &&
   $SOURCE/$AUTOCONF_SRC/configure --prefix=$SYS_ROOT &&
   make -j$PROCS &&
   make install &&
   popd
}

install_autoconf_archive() {
   rm -rf $AUTOCONF_ARCHIVE_SRC.obj &&
   mkdir -p $AUTOCONF_ARCHIVE_SRC.obj &&
   pushd $AUTOCONF_ARCHIVE_SRC.obj &&
   $SOURCE/$AUTOCONF_ARCHIVE_SRC/configure --prefix=$SYS_ROOT &&
   make -j$PROCS &&
   make install &&
   popd
}

install_automake() {
   rm -rf $AUTOMAKE_SRC.obj &&
   mkdir -p $AUTOMAKE_SRC.obj &&
   pushd $AUTOMAKE_SRC.obj &&
   $SOURCE/$AUTOMAKE_SRC/configure --prefix=$SYS_ROOT &&
   make -j$PROCS &&
   make install &&
   popd
}

install_perl() {
   pushd $PERL_SRC &&
   ./Configure -des -Dcc=gcc -Dprefix=$SYS_ROOT &&
   make install &&
   popd
}

install_bash() {
    rm -rf $BASH_SRC.obj &&
        mkdir -p $BASH_SRC.obj &&
        cd $BASH_SRC.obj &&
        export CFLAGS="$CFLAGS -fcommon"
    $SOURCE/$BASH_SRC/configure --prefix="$SYS_ROOT" \
        --build="$HOST" --host="$CROSS_HURD_TARGET" \
        --without-bash-malloc &&
        make -j$PROCS &&
        make -j$PROCS install &&
        cd ..
}


install_gzip() {
   pushd $SOURCE/$GZIP_SRC &&
   autoreconf -i &&
   popd &&
   rm -rf $GZIP_SRC.obj &&
   mkdir -p $GZIP_SRC.obj &&
   pushd $GZIP_SRC.obj &&
   $SOURCE/$GZIP_SRC/configure --prefix=$SYS_ROOT &&
   make -j$PROCS &&
   make install &&
   popd
}

install_gettext() {
   pushd $SOURCE/$GETTEXT_SRC &&
   autoreconf -i &&
   popd &&
   rm -rf $GETTEXT_SRC.obj &&
   mkdir -p $GETTEXT_SRC.obj &&
   pushd $GETTEXT_SRC.obj &&
   $SOURCE/$GETTEXT_SRC/configure --prefix=$SYS_ROOT &&
   make -j$PROCS &&
   make install &&
   popd
}

install_texinfo() {
   rm -rf $TEXINFO_SRC.obj &&
   mkdir -p $TEXINFO_SRC.obj &&
   pushd $TEXINFO_SRC.obj &&
   $SOURCE/$TEXINFO_SRC/configure --prefix=$SYS_ROOT &&
   make -j$PROCS &&
   make install &&
   popd
}

install_openssl() {
   rm -rf $OPENSSL_SRC.obj &&
   mkdir -p $OPENSSL_SRC.obj &&
   pushd $OPENSSL_SRC.obj &&
   $SOURCE/$OPENSSL_SRC/Configure --prefix=$SYS_ROOT \
      --openssldir=/etc/ssl \
	  --libdir=lib \
	  hurd-generic32 &&
   make -j$PROCS &&
   make install &&
   popd
}

install_curl() {
   pushd $SOURCE/$CURL_SRC &&
   autoreconf -i &&
   popd &&
   rm -rf $CURL_SRC.obj &&
   mkdir -p $CURL_SRC.obj &&
   pushd $CURL_SRC.obj &&
   $SOURCE/$CURL_SRC/configure --prefix=$SYS_ROOT \
     --with-openssl \
	 --enable-versioned-symbol \
	 --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt &&
   make -j$PROCS &&
   make install &&
   popd
}

install_pkgconf() {
   pushd $SOURCE/$PKGCONF_SRC &&
   autoreconf -i &&
   popd &&
   rm -rf $PKGCONF_SRC.obj &&
   mkdir -p $PKGCONF_SRC.obj &&
   pushd $PKGCONF_SRC.obj &&
   $SOURCE/$PKGCONF_SRC/configure --prefix=$SYS_ROOT \
     --with-system-libdir=/lib \
	 --with-system-includedir=/include &&
   make -j$PROCS &&
   make install &&
   ln -s /bin/pkgconf /bin/pkg-config
   popd
}

install_libarchive() {
   pushd $SOURCE/$LIBARCHIVE_SRC &&
   autoreconf -i &&
   popd &&
   rm -rf $LIBARCHIVE_SRC.obj &&
   mkdir -p $LIBARCHIVE_SRC.obj &&
   pushd $LIBARCHIVE_SRC.obj &&
   $SOURCE/$LIBARCHIVE_SRC/configure --prefix=$SYS_ROOT \
      --without-xml2 \
	  --without-nettle \
	  --disable-static &&
   make -j$PROCS &&
   make install &&
   popd
}

install_bison() {
   pushd $SOURCE/$BISON_SRC &&
   autoreconf -fi &&
   popd &&
   rm -rf $BISON_SRC.obj &&
   mkdir -p $BISON_SRC.obj &&
   pushd $BISON_SRC.obj &&
   $SOURCE/$BISON_SRC/configure --prefix=$SYS_ROOT --docdir=$SYS_ROOT/usr/share/doc/bison-$BISON_VERSION &&
   make -j$PROCS &&
   make install &&
   popd
}

install_ninja() {
   pushd $NINJA_SRC &&
   python configure.py --bootstrap
   install -m 755 -D ninja "/bin/ninja"
   popd
}

install_cmake() {
  pushd $CMAKE_SRC &&
  ./bootstrap --prefix=$SYS_ROOT \
    --mandir=/share/man \
    --docdir=/share/doc/cmake \
    --datadir=/share/cmake \
    --system-libs
  make &&
  make install &&
  popd
}

install_zstd() {
  pushd $ZSTD_SRC &&
  #cmake -S build/cmake -B build -G Ninja \
  #  -DCMAKE_BUILD_TYPE=None \
  #  -DCMAKE_INSTALL_PREFIX=$SYS_ROOT \
  #  -DZSTD_ZLIB_SUPPORT=ON \
  #  -DZSTD_LZMA_SUPPORT=ON \
  #  -DZSTD_LZ4_SUPPORT=ON \
  #  -DZSTD_BUILD_CONTRIB=OFF \
  #  -DZSTD_BUILD_STATIC=OFF \
  #  -DZSTD_BUILD_TESTS=OFF \
  #  -DZSTD_PROGRAMS_LINK_SHARED=ON &&
  #cmake --build build &&
  #cmake --install build &&
  make install PREFIX=$SYS_ROOT
  popd
}

install_libxkbcommon () {
   pushd $LIBXKBCOMMON_SRC &&
   meson setup build --prefix="$SYS_ROOT" \
   -Denable-x11=false \
   -Denable-wayland=false \
   -Denable-docs=false &&
   meson install -C build &&
   popd
}

install_xkeyboard_config () {
   pushd $XKEYBOARD_CONFIG_SRC &&
   meson setup build --prefix="$SYS_ROOT" \
   meson install -C build &&
   popd
}

install_hurd() {
   pushd $SOURCE/$HURD_SRC &&
   autoreconf -i &&
   popd &&
   mkdir -p $HURD_SRC.obj &&
   pushd $HURD_SRC.obj &&
   $SOURCE/$HURD_SRC/configure \
      --prefix=$SYS_ROOT \
      --with-libgcrypt-prefix=$SYS_ROOT \
      --enable-static-progs='ext2fs,iso9660fs,rumpdisk,pci-arbiter,acpi' \
      --disable-profile &&
   make -j$PROCS clean &&
   make -j$PROCS all &&
   make -j$PROCS install &&
   popd
}

install_git() {
   pushd $SOURCE/$GIT_SRC &&
   make prefix=/ gitexecdir=/lib/git-core NO_EXPAT=1 NO_TCLTK=1 NO_GETTEXT=1 INSTALL_SYMLINKS=1 install &&
   popd
}


install_perl_inc_latest() {
   pushd $SOURCE/$PERL_INC_LATEST_SRC &&
   perl Makefile.PL installdirs=vendor &&
   make &&
   make DESTDIR=$SYS_ROOT install &&
   popd
}

install_perl_build() {
   pushd $SOURCE/$PERL_BUILD_SRC &&
   perl Build.PL installdirs=vendor &&
   perl Build &&
   perl Build install destdir=$SYS_ROOT &&
   popd
}

install_po4a() {
   pushd $SOURCE/$PO4A_SRC &&
   perl Build.PL installdirs=vendor create_packlist=0 &&
   # The script expects a UTF-8 locale
   LC_ALL=en_US.UTF-8 perl Build &&
   perl Build destdir=$SYS_ROOT &&
   popd
}

install_pacman() {
   pushd $SOURCE/$PACMAN_SRC &&
   meson --prefix=$SYS_ROOT \
      --buildtype=plain \
      -Ddoc=disabled \
      -Ddoxygen=disabled\
      -Dldconfig=/bin/ldconfig \
      build &&
   meson compile -C build &&
   meson install -C build &&
   popd
}

install_sudo() {
   rm -rf $SUDO_SRC.obj &&
   mkdir -p $SUDO_SRC.obj &&
   pushd $SUDO_SRC.obj &&
   $SOURCE/$SUDO_SRC/configure --prefix=$SYS_ROOT \
       --with-vardir=/var/db/sudo \
	   --with-rundir=/run/sudo \
	   --with-passprmpt="[sudo] password for %p: " \
	   --without-bsm-audit \
	   --with-add-insults &&
   make -j$PROCS &&
   make install &&
   chmod 644 /etc/sudo.conf &&
   chmod 440 /etc/sudoers &&
   popd
}

configure_aur_user() {
	echo "aur   ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/aur &&
	chmod 640 /etc/sudoers.d/aur
	passwd root
}

install_ifupdown() {
   rm -rf ifupdown.obj &&
   mkdir -p ifupdown.obj &&
   pushd ifupdown.obj &&
   make DESTDIR=$SYS_ROOT install &&
   popd
}

install_isc_dhcp() {
   rm -rf $PKGCONF_SRC.obj &&
   mkdir -p $PKGCONF_SRC.obj &&
   pushd $PKGCONF_SRC.obj &&
   $SOURCE/$PKGCONF_SRC/configure --prefix=$SYS_ROOT &&
   make -j$PROCS &&
   make install &&
   popd
}

setup_network() {
	/dev/MAKEDEV netdde eth0 eth1 eth2 eth3 eth4
}

install_autoconf &&
	install_automake &&
	install_bash &&
	install_autoconf_archive &&
	#install_texinfo &&
	install_gzip &&
	install_gettext &&
	install_bison &&
	install_pkgconf &&
	install_python &&
	install_libarchive &&
	install_ninja &&
	install_zstd &&
	/bin/locale-gen &&
	install_perl_inc_latest &&
	install_perl_build &&
	#install_po4a &&
	install_pacman &&
	install_sudo &&
	configure_aur_user &&
	echo "installation finished, you can now halt the VM" &&
	exit 0
