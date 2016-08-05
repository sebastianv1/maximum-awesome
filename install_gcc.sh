VERSION=4.7.0
PREFIX=/usr/gcc-$(VERSION)
LANGUAGES=c,c++,fortran
MAKE=make
# Or
# MAKE='make -j 4' # to compile using four cores

# Prerequisites

brew install gmp
brew install mpfr
brew install libmpc

# Download & install the latest GCC

mkdir -p $PREFIX
mkdir temp-gcc
cd temp-gcc
wget ftp://ftp.gnu.org/gnu/gcc/gcc-$VERSION/gcc-$VERSION.tar.gz
tar xfz gcc-$VERSION.tar.gz
rm gcc-$VERSION.tar.gz
cd gcc-$VERSION

mkdir build
cd build

../configure \
     --prefix=$PREFIX \
        --with-gmp=$(brew-path gmp) \
           --with-mpfr=$(brew-path mpfr) \
              --with-mpc=$(brew-path libmpc) \
                 --program-suffix=-$VERSION \
                    --enable-languages=$LANGUAGES \
                       --with-system-zlib \
                          --enable-stage1-checking \
                             --enable-plugin \
                                --enable-lto \
                                   --disable-multilib

$MAKE bootstrap

make install

# Uncomment for cleanup …
cd ../../..
rm -r temp-gcc
