#/bin/bash

# Install Xapian core if not already present
if [[ ! -d xapian-core-1.2.25 ]]
then
    tar -xvf xapian-core-1.2.25.tar.xz
    cd xapian-core-1.2.25
    mkdir install
    ./configure --prefix=$PWD/install
    make -j16
    make install
    cd -
fi

# Build search engine
make
