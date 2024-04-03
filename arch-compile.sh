#!/bin/bash

# installs actually don’t install but generate the packages
install() {
	pushd archhurd-repo/$1
	find . -maxdepth 1 -type f -name '*.tar.gz' 2>/dev/null | grep -q .
	file=$?
  if [ 0 -eq $file ]; then
    popd
    return
  fi
  LC_ALL=C makepkg -dA --skippgpcheck --nocheck --skipchecksums &&
	popd
}


install iana-etc &&
	install filesystem &&
	install gnumach &&
	install mig &&
	install tzdata &&
	install glibc.bootstrap &&
	install hurd &&
	install ncurses &&
	install readline &&
	install bash &&
	install gmp &&
	install mpfr &&
	install libmpc &&
	install pcre2 &&
	install grep &&
	install less &&
	install sed &&
	install gzip &&
	install lz4 &&
	install lzo &&
	#install xz.bootstrap &&  # needs po4a
	install zlib &&
	#install zstd &&  # needs cmake
	install bzip2 &&
	install jansson &&
	#install elfutils && fail to package for bootstrap, missing libs
	install binutils.bootstrap &&
	install libisl &&
	install gcc.bootstrap &&
	install coreutils &&
	#install p11-kit &&
	#install nss &&  # ca-certificates-mozilla # not tested
	#install ca-certificates &&  # needs a2x from asciidoc
	#install brotli &&  # needs more python modules
	#install krb5.bootstrap &&  # needs libverto
	install libidn2 &&
	install libnghttp2 &&
	install libnghttp3 &&
	install libpsl.bootstrap &&
	install libssh2 &&
	#install curl &&
	#install wget && # needs gnutls
	install tcl &&
	#install expat &&  # needs cmake
	install perl &&
	install openssl &&
	install libxcrypt &&
	install git.bootstrap &&
	install gawk &&
	install gettext &&
	#install libassuan && # not tested
	install libgpg-error &&
	#install libgcrypt &&  # need libgpg-error
	#install gnupg &&  # neds libgpg-eror, libassuan libksba npth
	#install gpgme &&  # needs libgpg-error libassuan
	install libarchive &&
	#install python &&
	#install meson &&
	install m4 &&
	install automake &&
	install autoconf &&
	install autoconf-archive &&
	install texinfo &&
	install flex &&
	install bison &&
	install pkgconf &&
	#install ninja &&
	install patch &&
	install libtool &&
	install gperf &&
	install pacman.bootstrap &&
	install libpciaccess && # XXX need PKGBUILD
	install libirqhelp && # XXX need PKGBuild
	install libacpica &&
	install libedit &&
	install dmidecode &&
	install parted &&
	install libdaemon &&
	install libtirpc && # XXX mutex_t
	install e2fsprogs && # XXX missing...
	install findutils &&
	install file &&
	install rumpkernel && # XXX netbsd source unavailable...
	# networking
	install dde &&
	install nedde &&
	#install inetutils &&
	# then add openrc
	#install grub.bootstrap && # fails to build but not necessary for bootstrap, can use host grub
	#install shadow &&
	#install openssh && # TODO Main 2nd objective
	# Once there 3rd step, ssh and recreate every project within a chroot (new script)
	exit 0

