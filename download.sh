#!/bin/sh

. ./vars.sh
. ./download-funcs.sh

mkdir -p $SOURCE &&
  pushd $SOURCE &&
  download_gcc &&
  download_package $BINUTILS_URL &&
  download $FLEX_PKG $FLEX_URL &&
  unpack zxf $FLEX_PKG $FLEX_SRC &&
  download $ZLIB_PKG $ZLIB_URL &&
  unpack zxf $ZLIB_PKG $ZLIB_SRC &&
  download $BZIP2_PKG $BZIP2_URL &&
  unpack zxf $BZIP2_PKG $BZIP2_SRC &&
  download $BASH_PKG $BASH_URL &&
  unpack zxf $BASH_PKG $BASH_SRC &&
  download_package $COREUTILS_URL &&
  download $E2FSPROGS_PKG $E2FSPROGS_URL &&
  unpack zxf $E2FSPROGS_PKG $E2FSPROGS_SRC &&
  download $PKGCONFIGLITE_PKG $PKGCONFIGLITE_URL &&
  unpack zxf $PKGCONFIGLITE_PKG $PKGCONFIGLITE_SRC &&
  download $LIBUUID_PKG $LIBUUID_URL &&
  unpack zxf $LIBUUID_PKG $LIBUUID_SRC &&
  download $UTIL_LINUX_PKG $UTIL_LINUX_URL &&
  unpack zxf $UTIL_LINUX_PKG $UTIL_LINUX_SRC &&
  download_package $GRUB_URL &&
  download $SHADOW_PKG $SHADOW_URL &&
  unpack Jxf $SHADOW_PKG $SHADOW_SRC &&
  download $GMP_PKG $GMP_URL &&
  unpack jxf $GMP_PKG $GMP_SRC &&
  download $MPFR_PKG $MPFR_URL &&
  unpack jxf $MPFR_PKG $MPFR_SRC &&
  download $MPC_PKG $MPC_URL &&
  unpack zxf $MPC_PKG $MPC_SRC &&
  download_package $HTOP_URL &&
  download_libxcrypt &&
  download_ncurses &&
  download_libedit &&
  download_package $VIM_URL &&
  download_package $GPG_ERROR_URL &&
  download_package $GCRYPT_URL &&
  download_dmidecode &&
  download_findutils &&
  download_parted &&
  download_package $LIBDAEMON_URL &&
  download_libtirpc &&
  download_make &&
  download_grep &&
  download_gawk &&
  download_less &&
  download_file &&
  download_sed &&
  download_dash &&
  download_ca_certificates &&
  download_iana_etc &&
  download_inetutils &&
  download_package $OPENSSL_URL &&
  download_wget &&
  download_perl &&
  download_package $LIBUNISTRING_URL &&
  download_package $LIBIDN2_URL &&
  download_package $LIBPSL_URL &&
  download_package $CURL_URL &&
  download_package $GIT_URL &&
  download_package $OPENSSH_URL &&
  download_libpciaccess &&
  download_gnumach &&
  download_mig &&
  download_dde &&
  download_netdde &&
  download_hurd &&
  download_glibc &&
  download_libacpica &&
  download_rumpkernel &&
  download_binutils_gdb &&

  download_package $ISL_URL &&
  download $BISON_PKG $BISON_URL &&
  unpack xf $BISON_PKG $BISON_SRC &&
  download $DIFFUTILS_PKG $DIFFUTILS_URL &&
  unpack xf $DIFFUTILS_PKG $DIFFUTILS_SRC &&
  download $GZIP_PKG $GZIP_URL &&
  unpack xf $GZIP_PKG $GZIP_SRC &&
  download $TEXINFO_PKG $TEXINFO_URL &&
  unpack xf $TEXINFO_PKG $TEXINFO_SRC &&
  download $M4_PKG $M4_URL &&
  unpack xf $M4_PKG $M4_SRC &&
  download $LIBTOOL_PKG $LIBTOOL_URL &&
  unpack xf $LIBTOOL_PKG $LIBTOOL_SRC &&
  download $AUTOCONF_PKG $AUTOCONF_URL &&
  unpack xf $AUTOCONF_PKG $AUTOCONF_SRC &&
  download $AUTOCONF_ARCHIVE_PKG $AUTOCONF_ARCHIVE_URL &&
  unpack xf $AUTOCONF_ARCHIVE_PKG $AUTOCONF_ARCHIVE_SRC &&
  download $AUTOMAKE_PKG $AUTOMAKE_URL &&
  unpack xf $AUTOMAKE_PKG $AUTOMAKE_SRC &&
  download $PKGCONF_PKG $PKGCONF_URL &&
  unpack xf $PKGCONF_PKG $PKGCONF_SRC &&
  download $NINJA_PKG $NINJA_URL &&
  unpack xf $NINJA_PKG $NINJA_SRC &&
  download_patch &&
  download $LIBXKBCOMMON_PKG $LIBXKBCOMMON_URL &&
  unpack xf $LIBXKBCOMMON_PKG $LIBXKBCOMMON_SRC &&
  download $XKEYBOARD_CONFIG_PKG $XKEYBOARD_CONFIG_URL &&
  unpack xf $XKEYBOARD_CONFIG_PKG $XKEYBOARD_CONFIG_SRC &&
  download $LIBXML2_PKG $LIBXML2_URL &&
  unpack zxf $LIBXML2_PKG $LIBXML2_SRC &&
  download $HELP2MAN_PKG $HELP2MAN_URL &&
  unpack xf $HELP2MAN_PKG $HELP2MAN_SRC &&
  download $TAR_PKG $TAR_URL &&
  unpack xf $TAR_PKG $TAR_SRC &&
  download $XZ_PKG $XZ_URL &&
  unpack xf $XZ_PKG $XZ_SRC &&
  download $PYTHON_PKG $PYTHON_URL &&
  unpack xf $PYTHON_PKG $PYTHON_SRC &&
  download $MESON_PKG $MESON_URL &&
  unpack xf $MESON_PKG $MESON_SRC &&
  download_pacman &&
  download $LIBARCHIVE_PKG $LIBARCHIVE_URL &&
  unpack xf $LIBARCHIVE_PKG $LIBARCHIVE_SRC &&
  download $SUDO_PKG $SUDO_URL &&
  unpack zxf $SUDO_PKG $SUDO_SRC &&
  download $ISC_DHCP_PKG $ISC_DHCP_URL &&
  unpack zxf $ISC_DHCP_PKG $ISC_DHCP_SRC &&
  download $GETTEXT_PKG $GETTEXT_URL &&
  unpack zxf $GETTEXT_PKG $GETTEXT_SRC &&
  download $GPERF_PKG $GPERF_URL &&
  unpack zxf $GPERF_PKG $GPERF_SRC &&
  download $LIBASSUAN_PKG $LIBASSUAN_URL &&
  unpack xf $LIBASSUAN_PKG $LIBASSUAN_SRC &&
  download $PO4A_PKG $PO4A_URL &&
  unpack zxf $PO4A_PKG $PO4A_SRC &&
  download $READLINE_PKG $READLINE_URL &&
  unpack zxf $READLINE_PKG $READLINE_SRC &&
  download $PERL_BUILD_PKG $PERL_BUILD_URL &&
  unpack zxf $PERL_BUILD_PKG $PERL_BUILD_SRC &&
  download $PERL_INC_LATEST_PKG $PERL_INC_LATEST_URL &&
  unpack zxf $PERL_INC_LATEST_PKG $PERL_INC_LATEST_SRC &&
  download $ELFUTILS_PKG $ELFUTILS_URL &&
  unpack xf $ELFUTILS_PKG $ELFUTILS_SRC &&
  download_xxhash &&
  download $DEBUGEDIT_PKG $DEBUGEDIT_URL &&
  unpack xf $DEBUGEDIT_PKG $DEBUGEDIT_SRC &&
  download $LZ4_PKG $LZ4_URL &&
  unpack xf $LZ4_PKG $LZ4_SRC &&
  download $ZSTD_PKG $ZSTD_URL &&
  unpack xf $ZSTD_PKG $ZSTD_SRC &&
  download $CMAKE_PKG $CMAKE_URL &&
  unpack xf $CMAKE_PKG $CMAKE_SRC &&
  download $LIBSSH2_PKG $LIBSSH2_URL &&
  unpack xf $LIBSSH2_PKG $LIBSSH2_SRC &&
  download_ifupdown &&
  echo "Download complete."
