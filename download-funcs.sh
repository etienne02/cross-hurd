#!/bin/sh

. ./config.sh

BINUTILS_URL=https://ftp.gnu.org/gnu/binutils/$BINUTILS_PKG
GCC_URL=https://ftp.gnu.org/gnu/gcc/gcc-"$GCC_VERSION"/"$GCC_PKG"
FLEX_URL=https://github.com/westes/flex/releases/download/v$FLEX_VERSION/$FLEX_PKG
ZLIB_URL=http://zlib.net/"$ZLIB_PKG"
BZIP2_URL=https://sourceware.org/pub/bzip2/$BZIP2_PKG
BASH_URL=https://ftp.gnu.org/gnu/bash/"$BASH_PKG"
COREUTILS_URL=https://ftp.gnu.org/gnu/coreutils/"$COREUTILS_PKG"
E2FSPROGS_URL=https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v"$E2FSPROGS_VERSION"/"$E2FSPROGS_PKG"
PKGCONFIGLITE_URL=http://downloads.sourceforge.net/project/pkgconfiglite/"$PKGCONFIGLITE_VERSION"/"$PKGCONFIGLITE_PKG"
LIBUUID_URL=http://downloads.sourceforge.net/project/libuuid/"$LIBUUID_PKG"
UTIL_LINUX_URL=https://www.kernel.org/pub/linux/utils/util-linux/v"$UTIL_LINUX_VERSION"/"$UTIL_LINUX_PKG"
GRUB_URL=https://ftp.gnu.org/gnu/grub/"$GRUB_PKG"
SHADOW_URL=https://github.com/shadow-maint/shadow/releases/download/"$SHADOW_VERSION"/"$SHADOW_PKG"
SED_URL=https://ftp.gnu.org/gnu/sed/"$SED_PKG"
GMP_URL=https://ftp.gnu.org/gnu/gmp/"$GMP_PKG"
MPFR_URL=http://mpfr.org/mpfr-current/"$MPFR_PKG"
MPC_URL=https://ftp.gnu.org/gnu/mpc/"$MPC_PKG"
NCURSES_URL=https://ftp.gnu.org/gnu/ncurses/"$NCURSES_PKG"
VIM_URL=ftp://ftp.vim.org/pub/vim/unix/"$VIM_PKG"
GPG_ERROR_URL=ftp://ftp.gnupg.org/gcrypt/libgpg-error/"$GPG_ERROR_PKG"
GCRYPT_URL=ftp://ftp.gnupg.org/gcrypt/libgcrypt/"$GCRYPT_PKG"
MAKE_URL=ftp://ftp.gnu.org/gnu/make/"$MAKE_PKG"
GREP_URL=https://ftp.gnu.org/gnu/grep/"$GREP_PKG"
GAWK_URL=https://ftp.gnu.org/gnu/gawk/"$GAWK_PKG"
DASH_URL=http://gondor.apana.org.au/~herbert/dash/files/$DASH_PKG
LIBPCIACCESS_URL=https://www.x.org/pub/individual/lib/$LIBPCIACCESS_PKG

unpack () {
   if [ -d "$3" ]; then
      return 0
   fi
   print_info "unpacking $2" &&
   tar $1 $2
}

DOWNLOAD_CACHE_DIRECTORY=~/.cache/cross-hurd
CACHE_DOWNLOADS=1
CACHE_GIT=1

download () {
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

download_from_git () {
   dir=$1
   repo=$2
   branch=$3
   add_branch=""
   if [ -n "$branch" ]; then
     add_branch="--branch $branch"
   fi
   if [ -d $dir ]; then
      pushd $dir || return 1
      git pull &&
      local git_result=$?
      popd &&
      return $git_result
   fi
   if [ -n "$CACHE_GIT" ]; then
       mkdir -p $DOWNLOAD_CACHE_DIRECTORY &&
       pushd $DOWNLOAD_CACHE_DIRECTORY &&
       (test -d $dir || git clone --depth=1 $repo $add_branch $dir) &&
       popd &&
       ln -sf $DOWNLOAD_CACHE_DIRECTORY/$dir .
   else
       git clone --depth=1 $repo
   fi
}

download_gnumach () {
   download_from_git gnumach git://git.savannah.gnu.org/hurd/gnumach.git
   pushd gnumach &&
   if [ ! -f "device/ramdisk.c" ]; then
    apply_patch $SCRIPT_DIR/patches/gnumach/50_initrd.patch 1
   fi
   popd
}

download_mig () {
   download_from_git mig git://git.savannah.gnu.org/hurd/mig.git
}

download_hurd () {
   download_from_git hurd git://git.savannah.gnu.org/hurd/hurd.git
}

download_rumpkernel () {
   download_from_git rumpkernel https://salsa.debian.org/hurd-team/rumpkernel.git
}

download_libacpica () {
   download_from_git libacpica https://salsa.debian.org/hurd-team/libacpica.git
}

apply_patch() {
   print_info "Using patch $1 (level: $2)"
   patch -Np$2 < $1 || exit 1
}

download_glibc () {
   if [ ! -d glibc ]; then
      git clone --depth=1 git://sourceware.org/git/glibc.git
   fi

   cd glibc &&
   git reset --hard &&
   git pull &&
   git checkout $GLIBC_TAG &&
   apply_patch $SCRIPT_DIR/patches/glibc/tg-mach-hurd-link.diff 1 &&
   apply_patch $SCRIPT_DIR/patches/glibc/unsubmitted-clock_t_centiseconds.diff 1 &&
   apply_patch $SCRIPT_DIR/patches/glibc/unsubmitted-prof-eintr.diff 1 &&
   cd ..
}

download_gcc () {
   download $GCC_PKG $GCC_URL &&
   if [ -d "$GCC_SRC" ]; then
      return 0
   fi
   unpack zxf $GCC_PKG $GCC_SRC
}

download_binutils () {
   download $BINUTILS_PKG $BINUTILS_URL &&
   if [ -d "$BINUTILS_SRC" ]; then
      return 0
   fi
   unpack jxf $BINUTILS_PKG $BINUTILS_SRC
 }

download_coreutils () {
   download $COREUTILS_PKG $COREUTILS_URL &&
   if [ ! -d "$COREUTILS_SRC" ]; then
	   unpack Jxf $COREUTILS_PKG $COREUTILS_SRC
   fi
}

download_sed () {
	download $SED_PKG $SED_URL &&
	if [ -d "$SED_SRC" ]; then
		return 0
	fi
	unpack xf $SED_PKG $SED_SRC
}

download_ncurses () {
  download $NCURSES_PKG $NCURSES_URL &&
  if [ -d "$NCURSES_SRC" ]; then
    return 0
  fi
  unpack zxf $NCURSES_PKG $NCURSES_SRC
}

download_vim () {
  download $VIM_PKG $VIM_URL &&
  if [ -d "vim$VIM_BASE_VERSION" ]; then
    return 0
  fi
  unpack jxf $VIM_PKG $VIM_SRC
}

download_gpg_error () {
  download $GPG_ERROR_PKG $GPG_ERROR_URL &&
  if [ -d "$GPG_ERROR_SRC" ]; then
    return 0
  fi
  unpack jxf $GPG_ERROR_PKG $GPG_ERROR_SRC
}

download_gcrypt () {
  download $GCRYPT_PKG $GCRYPT_URL &&
  if [ -d "$GCRYPT_SRC" ]; then
    return 0
  fi
  unpack jxf $GCRYPT_PKG $GCRYPT_SRC
}

download_make () {
  download $MAKE_PKG $MAKE_URL &&
  if [ -d "$MAKE_SRC" ]; then
    return 0
  fi
  unpack xf $MAKE_PKG $MAKE_SRC
}

download_grub () {
  download $GRUB_PKG $GRUB_URL &&
  if [ -d "$GRUB_SRC" ]; then
    return 0
  fi
  unpack zxf $GRUB_PKG $GRUB_SRC
}

download_grep () {
  download $GREP_PKG $GREP_URL &&
  if [ -d "$GREP_SRC" ]; then
    return 0
  fi
  unpack xf $GREP_PKG $GREP_SRC
  pushd $GREP_SRC &&
  apply_patch $SCRIPT_DIR/patches/grep/gnulib-hurd-x86_64.patch 1 &&
  popd
}

download_gawk () {
  download $GAWK_PKG $GAWK_URL &&
    if [ -d "$GAWK_SRC" ]; then
      return 0
    fi
    unpack xf $GAWK_PKG $GAWK_SRC
}

download_dash () {
   download $DASH_PKG $DASH_URL &&
   if [ -d $DASH_SRC ]; then
      return 0
   fi
   unpack xf $DASH_PKG $DASH_SRC
   pushd $DASH_SRC &&
   apply_patch $SCRIPT_DIR/patches/dash/dash-path-max.patch 1 &&
   popd
}

download_libpciaccess () {
   download $LIBPCIACCESS_PKG $LIBPCIACCESS_URL &&
   if [ -d $LIBPCIACCESS_SRC ]; then
      return 0
   fi
   unpack xf $LIBPCIACCESS_PKG $LIBPCIACCESS_SRC
}
