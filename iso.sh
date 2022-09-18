#!/bin/sh
set -e
. ./build.sh

mkdir -p isodir
mkdir -p isodir/boot
mkdir -p isodir/boot/grub

cp sysroot/boot/kyros.kernel isodir/boot/kyros.kernel
cat > isodir/boot/grub/grub.cfg << EOF
menuentry "kyros" {
	multiboot /boot/kyros.kernel
}
EOF
grub-mkrescue -o kyros.iso isodir
