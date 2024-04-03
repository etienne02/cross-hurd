
pushd archhurd-repo
pushd core
for filename in *; do
	pushd $filename
	makepkg -o --nodeps --skippgpcheck
	popd
done
popd
popd
