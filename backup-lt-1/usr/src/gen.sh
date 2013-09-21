cd /usr/src/linux
make clean && \
make oldconfig && \
make && \
make modules_install && \
module-rebuild populate && \
module-rebuild rebuild
cd -
