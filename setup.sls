setup:
  pkg.installed:
    - pkgs:
      - autoconf
      - automake
      - babeltrace-devel
      - bc
      - bcc-tools
      - bison
      - clang
      - cmake
      - cscope
      - ctags
      - cunit-devel
      - crash
      - coccinelle
      - curl
      - dhcp-tools
      - efivar
      - exfat-utils
      - fio
      - flatpak
      - flex
      - fuse-devel
      - fuse-exfat
      - gettext-tools
      - git
      - git-email
      - gcc
      - gcc-c++
      - gdb
      - gperf
      - hexchat
      - htop
      - iotop
      - jemalloc-devel
      - kernel-source
      - keyutils-devel
      - krb5-devel
      - leveldb-devel
      - libaio-devel
      - libblkid-devel
      - libcurl-devel
      - libelf-devel
      - libexpat-devel
      - liblz4-devel
      - liboath-devel
      - libopenssl-devel
      - librados-devel
      - libradosstriper-devel
      - libtool
      - libudev-devel
      - libvirt-daemon
      - libvirt-daemon-qemu
      - libvirt-devel
      - libSDL-devel
      - linuxconsoletools
      - ltrace
      - lttng-ust-devel
      - make
      - man-pages
      - meson
      - moreutils
      - mozilla-nss-devel
      - mtr
      - mutt
      - ncurses-devel
      - openldap2-devel
      - pciutils
      - powerline-fonts
      - python2-pip
      - python3-Sphinx
      - python3-Cython
      - python3-devel
      - python3-pip
      - qemu
      - qemu-kvm
      - qemu-ovmf-x86_64
      - qemu-x86
      - quilt
      - rdma-core-devel
      - rpmdevtools
      - snappy-devel
      - strace
      - sysstat
      - taskwarrior
      - tcpdump
      - texlive-xetex
      - tmux
      - unzip
      - util-linux
      - valgrind
      - vim
      - virt-manager
      - virt-viewer
      - youtube-dl
      - wget
      - zsh

  pip.installed:
    - pkgs:
      - distro
      - ipython
      - netifaces
      - powerline-status
      - thefuck
      - virtme
