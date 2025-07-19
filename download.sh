#!/bin/sh

. ./vars.sh
. ./download-funcs.sh

mkdir -p $SOURCE &&
  pushd $SOURCE &&
  download_gcc &&
  download_package $MPFR_URL &&
  download_package $BINUTILS_URL &&
  download_package $BASH_URL &&
  download_package $FILE_URL &&
  download_flex &&
  download $ZLIB_PKG $ZLIB_URL &&
  unpack zxf $ZLIB_PKG $ZLIB_SRC &&
  download $BZIP2_PKG $BZIP2_URL &&
  unpack zxf $BZIP2_PKG $BZIP2_SRC &&
  download_package $COREUTILS_URL &&
  download $E2FSPROGS_PKG $E2FSPROGS_URL &&
  unpack zxf $E2FSPROGS_PKG $E2FSPROGS_SRC &&
  download $LIBUUID_PKG $LIBUUID_URL &&
  unpack zxf $LIBUUID_PKG $LIBUUID_SRC &&
  download $UTIL_LINUX_PKG $UTIL_LINUX_URL &&
  unpack zxf $UTIL_LINUX_PKG $UTIL_LINUX_SRC &&
  download_package $GRUB_URL &&
  download_package $LIBXCRYPT_URL &&
  download_shadow &&
  download_gmp &&
  download $MPC_PKG $MPC_URL &&
  unpack zxf $MPC_PKG $MPC_SRC &&
  download_package $HTOP_URL &&
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
  download_package $GAWK_URL &&
  download_less &&
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
  download_package $BISON_URL &&
  download_package $DIFFUTILS_URL &&
  download_package $GZIP_URL &&
  download_package $TEXINFO_URL &&
  download_m4 &&
  download_package $LIBTOOL_URL &&
  download_package $AUTOCONF_URL &&
  download_package $AUTOCONF_ARCHIVE_URL &&
  download_package $AUTOMAKE_URL &&
  download_package $PKGCONF_URL &&
  download_package $NINJA_URL &&
  download_patch &&
  download_package $LIBXKBCOMMON_URL &&
  download_package $XKEYBOARD_CONFIG_URL &&
  download_package $LIBXML2_URL &&
  download_package $HELP2MAN_URL &&
  download_package $TAR_URL &&
  download_package $XZ_URL &&
  download_package $PYTHON_URL &&
  download_python_bootstrap &&
  download_package $MESON_URL &&
  download_pacman &&
  download_package $LIBARCHIVE_URL &&
  download_package $SUDO_URL &&
  download_package $GETTEXT_URL &&
  download_package $GPERF_URL &&
  download_package $PO4A_URL &&
  download_package $READLINE_URL &&
  download_package $PERL_BUILD_URL &&
  download_package $PERL_INC_LATEST_URL &&
  download_package $PERL_POD_PARSER_URL &&
  download_package $ELFUTILS_URL &&
  download_xxhash &&
  download_rhash &&
  download_package $DEBUGEDIT_URL &&
  download_package $LZ4_URL &&
  download_package $ZSTD_URL &&
  download_package $CMAKE_URL &&
  download_package $LIBSSH2_URL &&
  download_package $PCRE2_URL &&
  download_package $EXPAT_URL &&
  download_package $JSONCPP_URL &&
  download_libuv &&
  download_package $LIBKSBA_URL &&
  download_package $LIBASSUAN_URL &&
  download_package $NPTH_URL &&
  download_package $GNUPG_URL &&
  download_publicsuffix_list &&
  download_package $MPDECIMAL_URL &&
  download_package $TCL_URL &&
  download_sqlite &&
  download_package $PATCHELF_URL &&
  download_libxslt &&
  download_package $MERCURIAL_URL &&
  download_package $ASCIIDOC_URL &&
  download_package $LIBMD_URL &&
  download_package $LIBBSD_URL &&
  download_package $LIBFFI_URL &&
  download_package $NETTLE_URL &&
  download_package $LIBTASN1_URL &&
  download_package $GNUTLS_URL &&
  download_gyp &&
  download_nspr &&
  download_package $PYTHON_SIX_URL &&
  download_package $PYTHON_PASSLIB_URL &&
  download_package $ATTR_URL &&
  download_package $NSL_URL &&
  echo "Download complete."
