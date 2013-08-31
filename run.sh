export PATH="$HOME/Projects/libs/bin:$PATH";
make clean;
make;
qemu-system-i386 -kernel simplix.bin
