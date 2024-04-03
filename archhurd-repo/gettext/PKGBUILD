# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=gettext
pkgver=0.25.1
pkgrel=1
pkgdesc="GNU internationalization library"
url="https://www.gnu.org/software/gettext/"
arch=(x86_64)
license=(
  GFDL-1.2-only
  GPL-2.0-only
  GPL-2.0-or-later
  LGPL-2.0-only
)
depends=(
  acl
  attr
  gcc-libs
  gnulib-l10n
  libunistring
  libxml2
  ncurses
  sh
)
makedepends=(
  emacs
)
optdepends=('git: for autopoint infrastructure updates'
            'appstream: for appstream support')
options=(!docs)
source=(
  https://ftp.gnu.org/pub/gnu/gettext/$pkgname-$pkgver.tar.gz{,.sig}
)
b2sums=('921f5a0ccc84a910029288fcf9eb55f76c18e9a65f590b6cdc16e88d1312beca38db6150bfafa08d740d34ea14711b976ae251afe121bcfc6b664ec0592fb0e4'
        'SKIP')
validpgpkeys=('462225C3B46F34879FC8496CD605848ED7E69871'  # Daiki Ueno
              '68D94D8AAEEAD48AE7DC5B904F494A942E4616C2'
              '9001B85AF9E1B83DF1BDA942F5BE8B267C6A406D'  # Bruno Haible
              'E0FFBD975397F77A32AB76ECB6301D9E1BBEAC08') # Bruno Haible (Open Source Development)

build() {
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --enable-csharp \
    --enable-nls \
    --with-xz \
    --without-included-gettext \
    --without-included-libunistring
  sed -e 's/ -shared / -Wl,-O1,--as-needed\0/g' \
      -i gettext-{tools,runtime,runtime/libasprintf}/libtool
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
}
