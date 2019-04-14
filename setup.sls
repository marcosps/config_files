setup:
  pkg.installed:
    - cache_valid_time: 300
    - pkgs:
      - autoconf
      - automake
      - babeltrace-devel
      - bc
      - bcc-tools
      - bison
      - bridge-utils
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
      - Mesa-demo-x
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

dirs:
  file.directory:
    - user: marcos
    - group: users
    - mode: 755
    - makedirs: True
    - names:
      - ~marcos/git
      - ~marcos/.vim/autoload
      - ~marcos/.config/powerline/themes/tmux
      - ~marcos/.config/powerline/themes/vim

~marcos/.vim/autoload/plug.vim:
  file.managed:
    - source: https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    - mode: 755
    - skip_verify: True
    - user: marcos
    - group: users

~marcos/.antigen.zsh:
  file.managed:
    - source: https://raw.githubusercontent.com/zsh-users/antigen/master/bin/antigen.zsh
    - mode: 755
    - skip_verify: True
    - user: marcos
    - group: users

~marcos/.signature:
  file.managed:
    - user: marcos
    - group: users
    - mode: 755
    - contents: |
      Thanks,
      Marcos

/tmp/zsh.sh:
  file.managed:
    - source: https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
    - mode: 0555
    - skip_verify: True
    - user: marcos
    - group: users
  cmd.script:
    - runas: marcos

config-clone:
  git.cloned:
    - name: https://github.com/marcosps/config_files
    - target: ~marcos/git/config_files
    - user: marcos

# start and enable libvirtd service
libvirtd:
  service.running:
    - enable: True
