# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=libassuan
pkgver=3.0.0
pkgrel=1
pkgdesc='IPC library used by some GnuPG related software'
arch=(x86_64)
url="https://www.gnupg.org/related_software/libassuan/"
license=(
  FSFULLR
  GPL-2.0-or-later
  LGPL-2.1-or-later
)
depends=(
  glibc
  libgpg-error
  sh
)
makedepends=(
  git
)
provides=(libassuan.so)
source=(git+https://dev.gnupg.org/source/libassuan.git?signed#tag=${pkgname}-${pkgver})
sha512sums=('4b118ce0e45596836e7c1eb4d784c297a9080c2ae7a1deee6e1dc526177b6a637fe5234651565f3a923906e64de84b7f4e92a370533953a9d1ea9d22ec3ed46b')
b2sums=('d6f007d0b15b3871b0a12d51a768f5634e4617c1c2ee84b7823ef6fe98d09691f200901f52cd6654d5eefd2978116cb78f99333f2914895d23ec35e61bbb2719')
validpgpkeys=(
  6DAA6E64A76D2840571B4902528897B826403ADA  # "Werner Koch (dist signing 2020)"
  AC8E115BF73E2D8D47FA9908E98E9B2D19C6C8BD  # Niibe Yutaka (GnuPG Release Key)
)

prepare() {
  cd $pkgname
  sh autogen.sh
}

build() {
  cd $pkgname
  ./configure --enable-maintainer-mode --prefix=/usr
  make
}

check() {
  make check -C $pkgname
}

package() {
  make DESTDIR="$pkgdir" install -C $pkgname
  install -vDm 644 $pkgname/{AUTHORS,NEWS,README,ChangeLog} -t "$pkgdir/usr/share/doc/$pkgname/"
}
