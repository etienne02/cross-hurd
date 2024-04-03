#!/bin/bash

setup_arch() {
	chown aur:aur -R /arch
}

setup_arch &&
	su aur
