# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=automake
pkgver=1.18
pkgrel=1
pkgdesc="A GNU tool for automatically creating Makefiles"
arch=('any')
license=('GPL')
url="https://www.gnu.org/software/automake"
depends=('perl' 'bash')
makedepends=('autoconf')
checkdepends=('dejagnu' 'gcc-fortran' 'java-environment' 'vala' 'emacs' 'cscope'
              'expect' 'ncompress' 'gettext' 'lzip' 'zip' 'sharutils' 'help2man'
              # disable TeX tests for now, lots of them fail and need upstream
              # fixes for current texlive release
              #'texlive-bin' 'texinfo'
              'python' 'python-virtualenv')
source=("https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.sig})
sha512sums=('3488d9188a9e11a3e7f911f429ef49d2d92c5ea42262e3e288e1d4de39217facd5a7b7c7ccac06e6fd78a661985af1fe5638353575ebadffb36fc22553e5f782'
            'SKIP')
validpgpkeys=('E1622F96D2BB4E58018EEF9860F906016E407573'   # Stefano Lattarini
              'F2A38D7EEB2B66405761070D0ADEE10094604D37'   # Mathieu Lirzin
              '155D3FC500C834486D1EEA677FD9FCCB000BEEEE'   # Jim Meyering
              '17D3311B14BC0F248267BF020716748A30D155AD')  # Karl Berry

build() {
	cd "${pkgname}-${pkgver}"
	./configure --build=$CHOST --prefix=/usr
	make
}

check() {
	cd "${pkgname}-${pkgver}"
	make check
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
