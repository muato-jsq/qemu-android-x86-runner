# Quick Start

- Install [QEMU]
- Download `android-x86_64-7.1-r1.iso` from http://www.android-x86.org/download
- `$ ./qemu-install.sh ./android-x86_64-7.1-r1.iso ./android.img`
- `$ ./qemu-run.sh ./android.img` -- run with VNC listener on for local incoming connections on 5999 port in default

No root permissions should be required for running any of the scripts. If this is not true in some cases, please submit a fix with a Pull Request.

[QEMU]: https://www.qemu.org/
