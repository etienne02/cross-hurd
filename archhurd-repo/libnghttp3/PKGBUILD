# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Maintainer: Christian Hesse <eworm@archlinux.org>

pkgname=libnghttp3
pkgver=1.10.1
pkgrel=1
pkgdesc="HTTP/3 library written in C"
url='https://github.com/ngtcp2/nghttp3'
arch=('x86_64')
license=('MIT')
depends=('glibc')
provides=('libnghttp3.so')
validpgpkeys=('F4F3B91474D1EB29889BD0EF7E8403D5D673C366') # Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
source=("https://github.com/ngtcp2/nghttp3/releases/download/v${pkgver}/nghttp3-${pkgver}.tar.xz"{,.asc})
sha256sums=('e6b8ebaadf8e57cba77a3e34ee8de465fe952481fbf77c4f98d48737bdf50e03'
            'SKIP')

prepare() {
  cd nghttp3-${pkgver}
  autoreconf -i
}

build() {
  cd nghttp3-${pkgver}
  ./configure \
    --prefix=/usr
  make
}

check() {
  cd nghttp3-${pkgver}
  make check
}

package() {
  cd nghttp3-${pkgver}/lib
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
