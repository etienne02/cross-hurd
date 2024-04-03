#!/bin/sh

. ./config.sh

BINUTILS_URL=https://ftp.gnu.org/gnu/binutils/$BINUTILS_PKG
FLEX_URL=https://github.com/westes/flex/releases/download/v$FLEX_VERSION/$FLEX_PKG
ZLIB_URL=http://zlib.net/"$ZLIB_PKG"
BZIP2_URL=https://sourceware.org/pub/bzip2/$BZIP2_PKG
BASH_URL=https://ftp.gnu.org/gnu/bash/"$BASH_PKG"
E2FSPROGS_URL=https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v"$E2FSPROGS_VERSION"/"$E2FSPROGS_PKG"
PKGCONFIGLITE_URL=http://downloads.sourceforge.net/project/pkgconfiglite/"$PKGCONFIGLITE_VERSION"/"$PKGCONFIGLITE_PKG"
LIBUUID_URL=http://downloads.sourceforge.net/project/libuuid/"$LIBUUID_PKG"
UTIL_LINUX_URL=https://www.kernel.org/pub/linux/utils/util-linux/v$UTIL_LINUX_MAJOR_VERSION/"$UTIL_LINUX_PKG"
SHADOW_URL=https://github.com/shadow-maint/shadow/releases/download/"$SHADOW_VERSION"/"$SHADOW_PKG"
SED_URL=https://ftp.gnu.org/gnu/sed/"$SED_PKG"
GMP_URL=https://ftp.gnu.org/gnu/gmp/"$GMP_PKG"
MPFR_URL=http://mpfr.org/mpfr-current/"$MPFR_PKG"
MPC_URL=https://ftp.gnu.org/gnu/mpc/"$MPC_PKG"
NCURSES_URL=https://ftp.gnu.org/gnu/ncurses/"$NCURSES_PKG"
LIBEDIT_URL=https://thrysoee.dk/editline/$LIBEDIT_PKG
MAKE_URL=ftp://ftp.gnu.org/gnu/make/"$MAKE_PKG"
GREP_URL=https://ftp.gnu.org/gnu/grep/"$GREP_PKG"
GAWK_URL=https://ftp.gnu.org/gnu/gawk/"$GAWK_PKG"
LESS_URL=https://www.greenwoodsoftware.com/less/$LESS_PKG
FILE_URL=ftp://ftp.astron.com/pub/file/$FILE_PKG
DASH_URL=http://gondor.apana.org.au/~herbert/dash/files/$DASH_PKG
LIBPCIACCESS_URL=https://www.x.org/pub/individual/lib/$LIBPCIACCESS_PKG
LIBXCRYPT_URL=https://github.com/besser82/libxcrypt/releases/download/v$LIBXCRYPT_VERSION/$LIBXCRYPT_PKG
PARTED_URL=https://ftp.gnu.org/gnu/parted/$PARTED_PKG
DMIDECODE_URL=http://download.savannah.gnu.org/releases/dmidecode/$DMIDECODE_PKG
FINDUTILS_URL=https://ftp.gnu.org/gnu/findutils/$FINDUTILS_PKG
IANA_ETC_URL=https://github.com/Mic92/iana-etc/releases/download/$IANA_ETC_VERSION/$IANA_ETC_PKG
INETUTILS_URL=https://ftp.gnu.org/gnu/inetutils/$INETUTILS_PKG
WGET_URL=https://ftp.gnu.org/gnu/wget/$WGET_PKG
PERL_CROSS_URL=https://github.com/arsv/perl-cross/raw/releases/$PERL_CROSS_PKG
PERL_URL=https://www.cpan.org/src/5.0/$PERL_PKG

MESON_URL=https://github.com/mesonbuild/meson/releases/download/$MESON_VERSION/$MESON_PKG
BISON_URL=https://ftp.gnu.org/gnu/bison/$BISON_PKG
PACMAN_URL=https://gitlab.archlinux.org/pacman/pacman/-/releases/v$PACMAN_VERSION/downloads/$PACMAN_PKG
PYTHON_URL=https://www.python.org/ftp/python/$PYTHON_VERSION/$PYTHON_PKG
GDB_URL=https://ftp.gnu.org/gnu/gdb/$GDB_PKG
M4_URL=https://ftp.gnu.org/gnu/m4/$M4_PKG
LIBTOOL_URL=https://ftp.gnu.org/gnu/libtool/$LIBTOOL_PKG
AUTOCONF_URL=https://ftp.gnu.org/gnu/autoconf/$AUTOCONF_PKG
AUTOCONF_ARCHIVE_URL=https://ftp.gnu.org/gnu/autoconf-archive/$AUTOCONF_ARCHIVE_PKG
AUTOMAKE_URL=https://ftp.gnu.org/gnu/automake/$AUTOMAKE_PKG
NINJA_URL=https://github.com/ninja-build/ninja/archive/v$NINJA_VERSION/$NINJA_PKG
PATCH_URL=https://ftp.gnu.org/gnu/patch/$PATCH_PKG
TAR_URL=https://ftp.gnu.org/gnu/tar/$TAR_PKG
XZ_URL=https://github.com/tukaani-project/xz/releases/download/v$XZ_VERSION/$XZ_PKG
LIBDAEMON_URL=https://0pointer.de/lennart/projects/libdaemon/$LIBDAEMON_PKG
LIBXKBCOMMON_URL=https://xkbcommon.org/download/$LIBXKBCOMMON_PKG
XKEYBOARD_CONFIG_URL=http://www.x.org/releases/individual/data/xkeyboard-config/$XKEYBOARD_CONFIG_PKG
PKGCONF_URL=https://distfiles.ariadne.space/pkgconf/$PKGCONF_PKG
LIBARCHIVE_URL=https://github.com/libarchive/libarchive/releases/download/v$LIBARCHIVE_VERSION/$LIBARCHIVE_PKG
OPENSSL_URL=https://www.openssl.org/source/$OPENSSL_PKG
CURL_URL=https://curl.se/download/$CURL_PKG
LIBXML2_URL=https://gitlab.gnome.org/GNOME/libxml2/-/archive/$LIBXML2_VERSION/$LIBXML2_PKG
DIFFUTILS_URL=https://ftp.gnu.org/gnu/diffutils/$DIFFUTILS_PKG
TEXINFO_URL=https://ftp.gnu.org/gnu/texinfo/$TEXINFO_PKG
GZIP_URL=https://ftp.gnu.org/pub/gnu/gzip/$GZIP_PKG
SUDO_URL=https://www.sudo.ws/sudo/dist/$SUDO_PKG
HELP2MAN_URL=https://ftp.gnu.org/gnu/help2man/$HELP2MAN_PKG
GIT_URL=https://www.kernel.org/pub/software/scm/git/$GIT_PKG
ISC_DHCP_URL=https://downloads.isc.org/isc/dhcp/$ISC_DHCP_VERSION/$ISC_DHCP_PKG
LIBPCAP_URL=https://www.tcpdump.org/release/$LIBPCAP_PKG
GETTEXT_URL=https://ftp.gnu.org/pub/gnu/gettext/$GETTEXT_PKG
GPERF_URL=https://ftp.gnu.org/pub/gnu/gperf/$GPERF_PKG
LIBASSUAN_URL=https://gnupg.org/ftp/gcrypt/libassuan/$LIBASSUAN_PKG
PO4A_URL=https://github.com/mquinson/po4a/releases/download/v$PO4A_VERSION/$PO4A_PKG
READLINE_URL=https://ftp.gnu.org/gnu/readline/$READLINE_PKG
PERL_BUILD_URL=https://search.cpan.org/CPAN/authors/id/L/LE/LEONT/$PERL_BUILD_PKG
PERL_INC_LATEST_URL=https://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/$PERL_INC_LATEST_PKG
ELFUTILS_URL=https://sourceware.org/ftp/elfutils/$ELFUTILS_VERSION/$ELFUTILS_PKG
XXHASH_URL=https://github.com/Cyan4973/xxHash/archive/refs/tags/v$XXHASH_VERSION.tar.gz
DEBUGEDIT_URL=https://sourceware.org/ftp/debugedit/$DEBUGEDIT_VERSION/$DEBUGEDIT_PKG
LZ4_URL=https://github.com/lz4/lz4/releases/download/v$LZ4_VERSION/$LZ4_PKG
ZSTD_URL=https://github.com/facebook/zstd/releases/download/v$ZSTD_VERSION/$ZSTD_PKG
CMAKE_URL=https://gitlab.kitware.com/cmake/cmake/-/archive/v$CMAKE_VERSION/$CMAKE_PKG
LIBSSH2_URL=https://www.libssh2.org/download/$LIBSSH2_PKG

unpack() {
    if [ -d "$3" ]; then
        return 0
    fi
    print_info "unpacking $2" &&
        tar $1 $2
}

DOWNLOAD_CACHE_DIRECTORY=~/.cache/cross-hurd
CACHE_DOWNLOADS=1
CACHE_GIT=1

download() {
    if [ -f $1 ]; then
        return 0
    fi
    if [ -n "$CACHE_DOWNLOADS" ]; then
        mkdir -p $DOWNLOAD_CACHE_DIRECTORY
        pushd $DOWNLOAD_CACHE_DIRECTORY &&
            (test -f $1 || wget $2) &&
            popd &&
            cp $DOWNLOAD_CACHE_DIRECTORY/$1 .
    else
        wget $2
    fi
}

# $1 - url of the package
download_package() {
    local url=$1 &&
        local package_file=$(basename $url) &&
        download $package_file $url &&
        local dir_name=$(basename $(basename $(basename $package_file .tar.gz) .tar.xz) .tar.bz2) &&
        local extension="${package_file##.*}" &&
        unpack "xf" $package_file $dir_name
}

download_from_git() {
    dir=$1
    repo=$2
    branch=$3
    add_branch=""
    if [ -n "$branch" ]; then
        add_branch="--branch $branch"
    fi
    (if [ -d $dir ]; then
        pushd $dir &&
            git reset --hard &&
            git pull &&
            local git_result=$?
        popd &&
            return $git_result
    elif [ -n "$CACHE_GIT" ]; then
        mkdir -p $DOWNLOAD_CACHE_DIRECTORY &&
            pushd $DOWNLOAD_CACHE_DIRECTORY &&
            (if [ -d $dir ]; then
                pushd $dir &&
                    git reset --hard &&
                    git pull &&
                    popd
            else
                git clone --depth=1 $repo $add_branch $dir
            fi) &&
            popd &&
            ln -sf $DOWNLOAD_CACHE_DIRECTORY/$dir .
    else
        git clone --depth=1 $repo
    fi)
}

download_gnumach() {
    download_from_git gnumach git://git.savannah.gnu.org/hurd/gnumach.git &&
        pushd gnumach &&
        apply_patch $SCRIPT_DIR/patches/gnumach/50_initrd.patch 1 &&
        apply_patch $SCRIPT_DIR/patches/gnumach/79_dde-debian.patch 1 &&
        popd
}

download_netdde() {
    download_from_git netdde git://git.savannah.gnu.org/hurd/incubator.git dde_net &&
        pushd netdde &&
        apply_patch $SCRIPT_DIR/patches/netdde/machdev.patch 1 &&
        apply_patch $SCRIPT_DIR/patches/netdde/crypt.patch 1 &&
        apply_patch $SCRIPT_DIR/patches/netdde/csum.patch 1 &&
        popd
}

download_mig() {
    download_from_git mig git://git.savannah.gnu.org/hurd/mig.git
}

download_hurd() {
    download_from_git hurd git://git.savannah.gnu.org/hurd/hurd.git &&
        pushd hurd &&
        apply_patch $SCRIPT_DIR/patches/hurd/link-rump.patch 1 &&
        apply_patch $SCRIPT_DIR/patches/hurd/hurd-refcounts-assert.patch 1 &&
        popd
}

download_rumpkernel() {
    download_from_git rumpkernel https://salsa.debian.org/hurd-team/rumpkernel.git
}

download_libacpica() {
    download_from_git libacpica https://salsa.debian.org/hurd-team/libacpica.git
}

download_dde() {
    download_from_git dde git://git.savannah.gnu.org/hurd/incubator.git dde &&
        pushd dde &&
        apply_patch $SCRIPT_DIR/patches/dde/gcc-14.patch 1 &&
        popd
}

download_ca_certificates() {
    download_from_git ca-certificates $CA_CERTIFICATES_URL
}

apply_patch() {
    print_info "Using patch $1 (level: $2)"
    if patch -f -Np$2 --dry-run <$1 >/dev/null 2>&1; then
        patch -Np$2 <$1 || exit 1
    else
        echo "Cannot apply patch!"
    fi
}

download_glibc() {
    (if [ ! -d glibc ]; then
        git clone --depth=1 git://sourceware.org/git/glibc.git
    fi) &&
        cd glibc &&
        git reset --hard &&
        git pull &&
        git checkout $GLIBC_TAG &&
        apply_patch $SCRIPT_DIR/patches/glibc/tg-bits_atomic.h_multiple_threads.diff 1 &&
        apply_patch $SCRIPT_DIR/patches/glibc/tg-unlockpt-chroot.diff 1 &&
        apply_patch $SCRIPT_DIR/patches/glibc/local-clock_gettime_MONOTONIC.diff 1 &&
        apply_patch $SCRIPT_DIR/patches/glibc/submitted-AF_LINK.diff 1 &&
        apply_patch $SCRIPT_DIR/patches/glibc/unsubmitted-prof-eintr.diff 1 &&
        apply_patch $SCRIPT_DIR/patches/glibc/unsubmitted-getaux_at_secure.diff 1 &&
        apply_patch $SCRIPT_DIR/patches/glibc/local-static_pthread_setcancelstate.diff 1 &&
        apply_patch $SCRIPT_DIR/patches/glibc/tg-mach-hurd-link.diff 1 &&
        cd ..
}

download_gcc() {
    download_package $GCC_URL &&
        pushd $GCC_SRC &&
        apply_patch $SCRIPT_DIR/patches/gcc/ada-hurd-amd64.diff 1 &&
        popd
}

download_sed() {
    download $SED_PKG $SED_URL &&
        if [ -d "$SED_SRC" ]; then
            return 0
        fi
    unpack xf $SED_PKG $SED_SRC
}

download_ncurses() {
    download $NCURSES_PKG $NCURSES_URL &&
        if [ -d "$NCURSES_SRC" ]; then
            return 0
        fi
    unpack zxf $NCURSES_PKG $NCURSES_SRC
}

download_libedit() {
    download $LIBEDIT_PKG $LIBEDIT_URL &&
        unpack zxf $LIBEDIT_PKG $LIBEDIT_SRC
}

download_libtirpc() {
    download_package $LIBTIRPC_URL &&
        pushd $LIBTIRPC_SRC &&
        apply_patch $SCRIPT_DIR/patches/libtirpc/03-kfreebsd.diff 1 &&
        apply_patch $SCRIPT_DIR/patches/libtirpc/05-hurd-port.diff 1 &&
        apply_patch $SCRIPT_DIR/patches/libtirpc/06-hurd-client-port.diff 1 &&
        popd
}

download_make() {
    download $MAKE_PKG $MAKE_URL &&
        if [ -d "$MAKE_SRC" ]; then
            return 0
        fi
    unpack xf $MAKE_PKG $MAKE_SRC
}

download_grep() {
    download $GREP_PKG $GREP_URL &&
        if [ -d "$GREP_SRC" ]; then
            return 0
        fi
    unpack xf $GREP_PKG $GREP_SRC
    pushd $GREP_SRC &&
        apply_patch $SCRIPT_DIR/patches/grep/gnulib-hurd-x86_64.patch 1 &&
        popd
}

download_gawk() {
    download $GAWK_PKG $GAWK_URL &&
        if [ -d "$GAWK_SRC" ]; then
            return 0
        fi
    unpack xf $GAWK_PKG $GAWK_SRC
}

download_less() {
    download $LESS_PKG $LESS_URL &&
        unpack xf $LESS_PKG $LESS_SRC
}

download_file() {
    download $FILE_PKG $FILE_URL &&
        unpack xf $FILE_PKG $FILE_SRC
}

download_dash() {
    download $DASH_PKG $DASH_URL &&
        if [ -d $DASH_SRC ]; then
            return 0
        fi
    unpack xf $DASH_PKG $DASH_SRC
    pushd $DASH_SRC &&
        apply_patch $SCRIPT_DIR/patches/dash/dash-path-max.patch 1 &&
        popd
}

download_libpciaccess() {
    download $LIBPCIACCESS_PKG $LIBPCIACCESS_URL &&
        if [ -d $LIBPCIACCESS_SRC ]; then
            return 0
        fi
    unpack xf $LIBPCIACCESS_PKG $LIBPCIACCESS_SRC
}

download_libxcrypt() {
    download $LIBXCRYPT_PKG $LIBXCRYPT_URL &&
        if [ -d $LIBXCRYPT_SRC ]; then
            return 0
        fi
    unpack xf $LIBXCRYPT_PKG $LIBXCRYPT_SRC
}

download_parted() {
    download $PARTED_PKG $PARTED_URL &&
        if [ -d $PARTED_SRC ]; then
            return 0
        fi
    unpack xf $PARTED_PKG $PARTED_SRC
}

download_dmidecode() {
    download $DMIDECODE_PKG $DMIDECODE_URL &&
        if [ -d $DMIDECODE_SRC ]; then
            return 0
        fi
    unpack xf $DMIDECODE_PKG $DMIDECODE_SRC
}

download_findutils() {
    download $FINDUTILS_PKG $FINDUTILS_URL &&
        if [ -d $FINDUTILS_SRC ]; then
            return 0
        fi
    unpack xf $FINDUTILS_PKG $FINDUTILS_SRC
}

download_iana_etc() {
    download $IANA_ETC_PKG $IANA_ETC_URL &&
        unpack xf $IANA_ETC_PKG $IANA_ETC_SRC
}

download_inetutils() {
    download_package $INETUTILS_URL &&
        pushd $INETUTILS_SRC &&
        apply_patch $SCRIPT_DIR/patches/inetutils/hurd-gcc14.patch 1 &&
        popd
}

download_wget() {
    download $WGET_PKG $WGET_URL &&
        unpack xf $WGET_PKG $WGET_SRC
}

download_perl() {
    download $PERL_CROSS_PKG $PERL_CROSS_URL &&
        unpack xf $PERL_CROSS_PKG $PERL_CROSS_SRC &&
        download $PERL_PKG $PERL_URL &&
        unpack xf $PERL_PKG $PERL_SRC
}

download_sed () {
	download $SED_PKG $SED_URL &&
	if [ -d "$SED_SRC" ]; then
		return 0
	fi
	unpack xf $SED_PKG $SED_SRC
}

download_ifupdown () {
   download_from_git rumpkernel https://salsa.debian.org/debian/ifupdown.git
}

download_patch () {
   download $PATCH_PKG $PATCH_URL &&
   if [ -d $PATCH_SRC ]; then
      return 0
   fi
   unpack xf $PATCH_PKG $PATCH_SRC &&
   pushd $PATCH_SRC &&
   apply_patch $SCRIPT_DIR/patches/patch/path_max.patch  1 &&
   popd
}

download_xxhash () {
  if [ -d $XXHASH_SRC ]; then
    return 0
  fi
  wget $XXHASH_URL &&
  mv "v${XXHASH_VERSION}.tar.gz" $XXHASH_PKG
  unpack xf $XXHASH_PKG $XXHASH_SRC
}

download_pacman () {
   download $PACMAN_PKG $PACMAN_URL &&
   if [ -d $PACMAN_SRC ]; then
      return 0
   fi
   unpack xf $PACMAN_PKG $PACMAN_SRC &&
   pushd $PACMAN_SRC &&
   apply_patch $SCRIPT_DIR/patches/pacman/0001-Hurd-define-PATH_MAX.patch  1 &&
   apply_patch $SCRIPT_DIR/patches/pacman/0001-makepkg-Clear-ERR-trap-before-trying-to-restore-it.patch  1 &&
   apply_patch $SCRIPT_DIR/patches/pacman/0002-Hurd-define-PIPE_BUF.patch  1 &&
   apply_patch $SCRIPT_DIR/patches/pacman/0003-Hurd-use-FAKED_MODE-instead-of-FAKEROOTKEY-for-faker.patch  1 &&
   apply_patch $SCRIPT_DIR/patches/pacman/0004-Hurd-use-V-for-fakeroot-version-output.patch  1 &&
   popd
}
