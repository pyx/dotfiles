cd /usr/src/linux
make clean && \
make oldconfig && \
make -j3 && \
make modules_install && \
emerge @module-rebuild
cd -
