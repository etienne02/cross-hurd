. ./config.sh

export SCRIPT_DIR=$PWD
# Set CROSS_HURD_EXTRA_PREFIX if you want to have multiple builds per arch.
export SYSTEM=$PWD/output-$CROSS_HURD_EXTRA_PREFIX$CPU
export CROSS_TOOLS=/cross-tools-$CROSS_HURD_EXTRA_PREFIX$CPU
export SYS_ROOT=/tools-$CROSS_HURD_EXTRA_PREFIX$CPU
export SOURCE=$PWD/src
export BUILD_ROOT=$PWD/build-$CROSS_HURD_EXTRA_PREFIX$CPU
export CROSS_HURD_TARGET=$CPU-gnu
export HOST="$(echo $MACHTYPE | sed "s/$(echo $MACHTYPE | cut -d- -f2)/cross/g")"
export PATH=$CROSS_TOOLS/bin:$PATH

if [ ! -z "$CCACHE_DIRECTORY" ]; then
   export PATH=$CCACHE_DIRECTORY:$PATH
fi

. ./package-vars.sh

print_info() {
   echo "* $*"
}
