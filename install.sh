#!/bin/bash

SUDO=$(which sudo 2>/dev/null)
# don't execute where it doesn't have (running from a container)
if [ -z "$SUDO" ] ; then
	SUDO=""
fi

DISTRO=""
ITEMS=( apt dnf )
for i in "${ITEMS[@]}"
do
	CHECK="$(which "$i" 2>/dev/null)"
	if [ ! -z "$CHECK" ]; then
		case $i in
		apt)
			DISTRO="debian"
			;;
		dnf)
			DISTRO="redhat"
			;;
		esac
		break
	fi
done

if [ -z "$DISTRO" ]; then
	echo "Distro not found. Aborting"
	exit 1
fi

function config() {
	if [ "$DISTRO" = "redhat" ]; then
		$SUDO dnf install vim wget curl unzip python gcc redhat-rpm-config \
			powerline-fonts \
			python-devel -y
	else
		$SUDO apt install curl vim python-pip -y
	fi

	# install pt spellcheck for vim
	if [ ! -f /usr/share/vim/vim80/spell/pt.utf-8.spl ]; then
		wget https://github.com/vim/vim/files/657554/pt.utf-8.spl.zip -O /tmp/pt.zip
		$SUDO unzip /tmp/pt.zip -d /usr/share/vim/vim80/spell/
		rm /tmp/pt.zip
	fi

	python -m pip install --user powerline-status netifaces thefuck -U

	$SUDO cp configs/bash_config.sh /etc/profile.d
	$SUDO mkdir -p /etc/gdbinit.d/
	$SUDO cp configs/default.gdb /etc/gdbinit.d/

	for i in vimrc gitconfig muttrc tmux.conf zshrc
	do
		cp configs/$i ~/.$i
	done

	mkdir -p ~/.config/lxc
	cp configs/lxc/default.conf ~/.config/lxc/default.conf
	$SUDO mkdir -p /etc/lxc
	$SUDO cp configs/lxc/etc_default.conf /etc/lxc/default.conf
	if [ "$DISTRO" = "redhat" ]; then
		$SUDO sh -c 'echo "marcosps veth virbr0 10" > /etc/lxc/lxc-usernet'
		$SUDO sh -c 'echo "lxc.net.0.link = virbr0" >> /etc/lxc/default.conf'
	else
		$SUDO sh -c 'echo "marcosps veth lxcbr0 10" > /etc/lxc/lxc-usernet'
		$SUDO sh -c 'echo "lxc.net.0.link = lxcbr0" >> /etc/lxc/default.conf'
	fi

	mkdir -p ~/.config/powerline/themes/{tmux,vim}
	cp configs/tmux_default.json ~/.config/powerline/themes/tmux/default.json
	cp configs/vim_default.json ~/.config/powerline/themes/vim/default.json
	mkdir -p ~/.config/fish
	cp configs/config.fish ~/.config/fish/

	echo "$(whoami):1000:65536" >/tmp/tmp_subids
	$SUDO cp /tmp/tmp_subids /etc/subuid
	$SUDO cp /tmp/tmp_subids /etc/subgid
	rm /tmp/tmp_subids

	# zsh configuration
	sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
	curl -L git.io/antigen > $HOME/.antigen.zsh
	chsh -s /usr/bin/zsh

	#create signature file
	echo $'Thanks,\n\tMarcos' >~/.signature

	if [ ! -f ~/.vim/autoload/plug.vim ]; then
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
			https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	fi
}

function fedora_debug() {
	if which dnf 2>/dev/null 1>/dev/null
	then
		$SUDO dnf config-manager --set-enabled fedora-debuginfo

		$SUDO dnf install --enablerepo=* \
			kernel-debuginfo-"$(uname -r)" \
			kernel-devel-"$(uname -r)" \
			sparse \
			strace \
			systemtap systemtap-runtime \
			--best --verbose -y
	fi
}

function debian_install() {
	$SUDO apt install \
		apt-file \
		apt-transport-https \
		autoconf \
		bison \
		build-essential \
		ca-certificates \
		clang \
		cme \
		curl \
		debhelper devscripts dh-make \
		debootstrap \
		exuberant-ctags \
		fish \
		ffmpeg \
		flatpak \
		git git-email \
		gnutls-dev \
		golang go-dep \
		htop \
		ldnsutils \
		libcap-dev \
		libcurl4-openssl-dev \
		libdevmapper-dev \
		libevdev-dev \
		libinput-dev \
		libncurses5-dev \
		libnl-3-dev \
			libnl-cli-3-dev libnl-utils \
		libpam-cgroup libpam-cgfs \
		libpciaccess-dev \
		libudev-dev \
		libtool \
		libunwind-dev \
		libvirt-bin libvirt-dev python-libvirt \
		linux-tools-generic \
		libseccomp-dev \
		libyajl-dev \
		libxml2-dev \
		lxc lxd \
		m4 \
		mesa-utils \
		meson \
		mutt \
		net-tools \
		openssh-server \
		pkg-config \
		python \
		python-pip \
		software-properties-common \
		sqlite3 \
		thefuck \
		tmux \
		trace-cmd \
		traceroute \
		ubuntu-restricted-extras \
		uuid-dev \
		virt-manager \
		vim \
		xsltproc \
		zfsutils-linux  \
		zsh \
		-y
}

function fedora_install() {
	# packages to be installed on a fresh Fedora install
	if which dnf 2>/dev/null 1>/dev/null
	then
		$SUDO dnf install \
			acpitool acpica-tools \
			alsa-plugins-pulseaudio \
			bison \
			blktrace \
			conmon \
			containernetworking-cni \
			cppcheck \
			ctags \
			clang \
			clang-analyzer \
			clang-tools-extra \
			conntrack-tools \
			dbus-devel \
			device-mapper-devel device-mapper-libs \
			doxygen \
			elfutils-libelf-devel \
			flatpak flatpak-devel flatpak-builder \
			fuse-devel \
			gcc \
			gdb \
			gettext-devel \
			gnutls-devel \
			gobject-introspection-devel \
			golang golint golang-godoc go-md2man \
			gperf \
			gpgme-devel \
			gstreamer1-devel gstreamer1-plugins-base-devel \
			gtk-doc \
			htop  \
			iotop \
			iperf \
			jack-audio-connection-kit-devel \
			javaws \
			kernel-headers \
			kernel-tools \
			ldns-utils \
			libacl-devel \
			libassuan-devel \
			libarchive-devel \
			libcap-devel \
			libcgroup libcgroup-pam libcgroup-tools \
			libcurl \
			libevdev-devel \
			libinput-devel \
			libmount-devel \
			libnl3-devel \
			libnetfilter*-devel \
			libnfnetlink* \
			libseccomp-devel \
			libselinux-devel \
			libsoup-devel \
			libv4l-devel \
			libva-devel \
			libvirt-devel virt-viewer \
			libxml2 \
			llvm-devel llvm-static \
			luajit-devel \
			lxc lxc-templates lxc-extra libvirt debootstrap \
			make \
			meson \
			mutt \
			ocitools \
			openldap-clients \
			openssl-devel \
			ostree-devel \
			ncurses-devel \
			pam-devel \
			perf \
			podman \
			polkit-devel \
			policycoreutils policycoreutils-gui \
				policycoreutils-python \
				selinux-policy selinux-policy-devel \
				selinux-policy-targeted \
				libselinux setroubleshoot-server \
				setools setools-console mcstrans \
			pylint \
			python-devel \
			python2-sphinx \
			python2-flake8 \
			python3-devel \
			python3-flake8 \
			qemu \
			rpm-build rpmdevtools \
			rpcgen \
			runc \
			SDL2-devel SDL2_image-devel \
			ShellCheck \
			squashfs-tools \
			subversion \
			texlive-xetex-bin \
			texlive-collection-xetex \
			texlive-tabulary \
			texlive-cmap \
			texlive-pdftex	texlive-pdftex-bin \
			texlive-ec \
			texlive-ams* \
			texlive-adjustbox \
			texlive-anyfontsize \
			texlive-oberdiek \
			texlive-tools \
			texlive-capt-of \
			texlive-eqparbox \
			texlive-euenc \
			texlive-fncychap \
			texlive-mdwtools \
			texlive-framed \
			texlive-luatex85 \
			texlive-multirow \
			texlive-needspace \
			texlive-psnfss \
			texlive-parskip \
			texlive-polyglossia \
			texlive-threeparttable \
			texlive-titlesec \
			texlive-ucs \
			texlive-upquote \
			texlive-wrapfig \
			texlive-langcode \
			texlive-langsci \
			texlive-babel-english \
			texlive-hyphen-english \
			tmux \
			udev-browse \
			unzip \
			virtme \
			wget \
			xmlto \
			xmltoman \
			zsh \
		--best --verbose

		$SUDO dnf builddep libvirt -y
	fi
}

if [ "$1" == "debug" ]; then
	case "$DISTRO" in
		redhat)
			fedora_debug
			;;
	esac
elif [ "$1" == "config" ]; then
	config
elif [ "$1" == "all" ]; then
	case "$DISTRO" in
		redhat)
			fedora_install
			;;
		debian)
			debian_install
			;;
	esac
	config
else
	echo "Usage: install.sh <debug|config|all>"
	exit 1
fi
