# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Maintainer: Dan McGee <dan@archlinux.org>

pkgname=libarchive
pkgver=3.8.9
pkgrel=1
pkgdesc='Multi-format archive and compression library'
arch=('x86_64')
url='https://libarchive.org/'
license=(
  BSD-2-Clause
  BSD-4-Clause-UC
  'Apache-2.0 OR CC0-1.0 OR OpenSSL'
)
depends=('acl'
         'bzip2'
         'glibc'
         'libxml2'
         'lz4'
         'openssl'
         'xz'
         'zlib'
         'zstd')
makedepends=('git')
provides=('libarchive.so')
validpgpkeys=('DB2C7CF1B4C265FAEF56E3FC5848A18B8F14184B'  # Martin Matuska <martin@matuska.org>
              '659C84C0E23EA1FA97E0B58CC040B508D63D2B36') # Martin Matuska <mm@FreeBSD.org>
source=("git+https://github.com/${pkgname}/${pkgname}.git?signed#tag=v${pkgver}")
sha256sums=('033f8b22a755d01f87a79a5723ce4faed4d3772ab703f739c26ce32c6b1da0fd')

_backports=(
)

_reverts=(
)

prepare() {
  # extract licenses
  # NOTE: some license files are missing: https://github.com/libarchive/libarchive/issues/2385
  sed -n '43,65p' $pkgname/COPYING > BSD-2-Clause.txt
  sed -n '33,62p' $pkgname/$pkgname/archive_read_support_filter_compress.c > BSD-4-Clause-UC.txt

  cd "${pkgname}"

  local _c _l
  for _c in "${_backports[@]}"; do
    if [[ "${_c}" == *..* ]]; then _l='--reverse'; else _l='--max-count=1'; fi
    git log --oneline "${_l}" "${_c}"
    git cherry-pick --mainline 1 --no-commit "${_c}"
  done
  for _c in "${_reverts[@]}"; do
    if [[ "${_c}" == *..* ]]; then _l='--reverse'; else _l='--max-count=1'; fi
    git log --oneline "${_l}" "${_c}"
    git revert --mainline 1 --no-commit "${_c}"
  done

  autoreconf -fiv
}

build() {
  cd "${pkgname}"

  ./configure \
      --prefix=/usr \
      --without-nettle \
      --disable-static
  make
}

check() {
  cd "${pkgname}"

  make check
}

package() {
  depends+=(
    'libacl.so'
    'libbz2.so'
    'libxml2.so'
    'libcrypto.so'
    'liblzma.so'
    'libz.so'
    'libzstd.so')

  make DESTDIR="$pkgdir" install -C "$pkgname"
  install -vDm 644 ./*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
