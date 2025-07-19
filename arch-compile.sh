#!/bin/bash

# installs actually don’t install but generate the packages
install() {
	pushd archhurd-repo/$1
	find . -maxdepth 1 -type f -name '*.pkg.tar.gz' 2>/dev/null | grep -q .
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
	install hurd.bootstrap &&
	install diffutils &&
	install gdbm &&
	install db5.3 &&  # Need to hack for build
	install lmdb &&
	install acl &&
	install attr &&
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
	install tar &&
	install gzip &&
	install lz4 &&
	install lzo &&
	install xz.bootstrap &&
	install zlib &&
	install zstd &&
	install bzip2 &&
	install libxml2.bootstrap &&
	install jansson &&
	install elfutils.bootstrap &&
	install binutils.bootstrap &&
	install libisl &&
	install gcc.bootstrap &&
	install coreutils.bootstrap &&
	install libunistring &&
	install libmd &&
	install libbsd &&
	install libtasn1 &&
	install p11-kit.bootstrap &&
	#install gyp && # not for bootsrap, nss is not compiled
	install nspr &&
	install nss.bootstrap &&  # ca-certificates-mozilla
	install ca-certificates.bootstrap &&
	install brotli.bootstrap &&
	install krb5.bootstrap &&
	install libidn2 &&
	install libnghttp2 &&
	install libnghttp3 &&
	install publicsuffix-list &&
	install libpsl.bootstrap &&
	install libssh2 &&
	#install leancrypto && # fails missing symbols
	install nettle &&
	install gnutls.bootstrap &&
	install curl.bootstrap &&
	install wget &&
	install tcl &&
	install sqlite.bootstrap &&
	install expat &&
	install perl &&
	install perl-error &&
	install perl-mailtools &&
	install perl-timedate &&
	install openssl &&
	install libxcrypt &&
	install git.bootstrap &&
	install gawk &&
	install gnulib-l10n &&
	install gettext &&
	install libgpg-error &&
	install libassuan &&
	install libgcrypt &&
	install libksba &&
	install npth &&
	install gnupg.bootstrap &&
	install gpgme.bootstrap &&
	install libarchive &&
	install mpdecimal &&
	install libffi &&
	install python.bootstrap &&
	install meson.bootstrap &&
	install m4 &&
	install automake &&
	install autoconf &&
	install autoconf-archive &&
	install texinfo &&
	install flex &&
	install bison &&
	install pkgconf &&
	install ninja.bootstrap &&
	install patch &&
	install libtool &&
	install gperf &&
	install libtirpc &&
	install libnsl &&
	install json-c &&
	install jsoncpp.bootstrap &&
	install libuv.bootstrap &&
	install rhash &&
	install cmake.bootstrap &&
	install pacman.bootstrap &&
	install libpciaccess &&
	install libacpica &&
	install libedit &&
	install dmidecode &&
	install parted &&
	install libdaemon &&
	install libxkbcommon.bootstrap &&
	install xkeyboard-config &&
	install e2fsprogs &&
	install pambase &&
	install pam.bootstrap &&
	install findutils &&
	install file.bootstrap &&
	install rumpkernel &&
	#install vim &&  # problem
	#insall nano &&  # problem
	# networking
	install dde &&  # problem
	install netdde &&  # problem
	install inetutils.bootstrap &&
	install sysvinit &&
	#install grub.bootstrap &&  # problem
	install shadow.bootstrap &&
	install openssh.bootstrap &&
	exit 0

