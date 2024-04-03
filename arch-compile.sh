#!/bin/bash

# installs actually don’t install but generate the packages
install_iana() {
	pushd archhurd-repo/core/iana-etc
	LC_ALL=C makepkg -d
	popd
}

install_filesystem() {
	pushd archhurd-repo/core/filesystem
	LC_ALL=C makepkg -d
	popd
}

install_gnumach_headers() {
	pushd archhurd-repo/core/gnumach
	LC_ALL=C makepkg -d
	popd
}

install_mig() {
	pushd archhurd-repo/core/mig
	LC_ALL=C makepkg -d
	popd
}

install_tzdata() {
	pushd archhurd-repo/core/tzdata
	LC_ALL=C makepkg -d
	popd
}

install_glibc() {
	pushd archhurd-repo/core/glibc
	LC_ALL=C makepkg -d
	popd
}

install_ncurses() {
	pushd archhurd-repo/core/ncurses
	LC_ALL=C makepkg -d
	popd
}

install_readline() {
	pushd archhurd-repo/core/readline
	LC_ALL=C makepkg -d
	popd
}

install_bash() {
	pushd archhurd-repo/core/bash
	LC_ALL=C makepkg -d
	popd
}

install_gmp() {
	pushd archhurd-repo/core/gmp
	LC_ALL=C makepkg -d
	popd
}

install_mpfr() {
	pushd archhurd-repo/core/mpfr
	LC_ALL=C makepkg -d
	popd
}

install_libmpc() {
	pushd archhurd-repo/core/libmpc
	LC_ALL=C makepkg -d
	popd
}

install_lz4() {
	pushd archhurd-repo/core/lz4
	LC_ALL=C makepkg -d
	popd
}

install_xz() {
	pushd archhurd-repo/core/gnumach
	LC_ALL=C makepkg -d
	popd
}

install_zlib() {
	pushd archhurd-repo/core/zlib
	LC_ALL=C makepkg -d
	popd
}

install_xstd() {
	pushd archhurd-repo/core/zstd
	LC_ALL=C makepkg -d
	popd
}

install_jansson() {
	pushd archhurd-repo/core/jansson
	LC_ALL=C makepkg -d
	popd
}

install_libelf() {
	pushd archhurd-repo/core/libelf
	LC_ALL=C makepkg -d
	popd
}

install_binutils() {
	pushd archhurd-repo/core/binutils
	LC_ALL=C makepkg -d
	popd
}

install_gcc() {
	pushd archhurd-repo/core/gcc
	LC_ALL=C makepkg -d
	popd
}

install_pacman() {
	pushd archhurd-repo/core/pacman
	LC_ALL=C makepkg -d
	popd
}

install_iana &&
	install_filesystem &&
	install_gnumach_headers &&
	install_mig &&
	install_tzdata &&
	install_glibc &&
	install_ncurses &&
	install_readline &&
	install_bash &&
	install_gmp &&
	install_mpfr &&
	install_libmpc &&
	install_lz4 &&
	install_xz &&
	install_zlib &&
	install_zstd &&
	install_jansson &&
	install_libelf &&
	install_binutils &&
	install_gcc &&
	install_pacman && # TODO Main 1st objective
	# then add sysvinit
	# then add network (netdde + hurd)
	# then openssh # TODO Main 2nd objective
	# Once there 3rd step, ssh and recreate every project within a chroot (new script)
	exit 0

