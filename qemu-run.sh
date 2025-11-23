#!/bin/sh

set -xe

HDA_IMAGE="$1"

shift

qemu-system-x86_64 -enable-kvm -vga std \
                   -m 4096 -smp 4,cores=4 -cpu host,+ssse3,+sse4.2,+popcnt,+avx,+aes,+xsave,+xsaveopt,check, \
                   -machine q35,accel=kvm:tcg \
                   -usb -device usb-kbd -device usb-tablet \
                   -device usb-ehci,id=ehci \
                   -device e1000,netdev=net0 \
                   -netdev user,id=net0,hostfwd=tcp::10022-:22,hostfwd=tcp::5900-:5900,hostfwd=tcp::5555-:5555, \
                   -device AC97 \
                   -hda "$HDA_IMAGE" \
                   -monitor stdio -display none -vnc 0.0.0.0:99,password=off\
                   "$@"
