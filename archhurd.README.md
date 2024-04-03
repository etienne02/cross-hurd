preparatory step, have a repository with core and the pkgbuilds (1 folder per package)
in it and run the `arch-bootsrap.sh` to download all the sources of the packages
(that will be copied later, needed because the VM does not have network yet).

bootstrap image with classic cross-hurd process
then boot the image, run the `step1.sh` once finished halt the machine
Then run the arch-update-image.sh to prepare the image to build pacman packages
boot the image again, run the arch-prepare.sh
then go to /arch (you should be already su as aur), and execute the arch-compile.sh
And TADA, you have the packages you can extract.

résumé:
```
./arch-bootstrap.sh
./download.sh
./bootstrap.sh
./compile.sh
./create-image.sh

# boot image
# on image do
./step1.sh
# then poweroff the vm

./arch-update-image.sh

# boot image
# on image do
./arch-prepare.sh
cd /arch
./arch-compile.sh
```