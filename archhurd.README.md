preparatory step, have a repository with core and the pkgbuilds (1 folder per package)
in it and run the `arch-bootsrap.sh` to download all the sources of the packages
(that will be copied later, needed because the VM does not have network yet).

bootstrap image with classic cross-hurd process
then boot the image, run the `step1.sh` once finished halt the machine
Then run the arch-update-image.sh to prepare the image to build pacman packages
boot the image again, run the arch-prepare.sh
then go to /arch (you should be already su as aur), and execute the arch-compile.sh
Now you need to generate the archhurd bootstrap image (pacstrap all packages into a new image)
To do so you can execute the script arch-bootsrap.sh
Once it’s done, you’ll be able to extract this image from the hd.img disk and boot on this new image
to continue the package building.

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
#then bootsrap to create the archhurd base image in the running image (as root)
./arch-bootsrap.sh
```

Then, the image will need to be extracted and boot on. Once there you have a skeleton of a running archhurd, congrats but it’s not finished. You now need to rebuild all packages (installing them to override the bootstrap version) and push them to an official repository.

Note: The installed grub in the archhurd.img does not work, so you need to reinstall it from the host.
