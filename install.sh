#!/bin/bash

function install() {
	SUDO=$(which sudo 2>/dev/null)
	# don't execute where it doesn't have (running from a container)
	if [ -z $SUDO ] ; then
		SUDO=""
	fi

	# packages to be installed on a fresh Fedora install
	if which dnf 2>/dev/null 1>/dev/null
	then
		$SUDO dnf install \
			ctags \
			gcc \
			clang \
			llvm-devel \
			llvm-static \
			luajit-devel \
			ncurses-devel \
			iperf \
			elfutils-libelf-devel \
			kernel-headers \
			kernel-devel \
			make \
			meson \
			autoconf \
			automake \
			acpitool acpica-tools \
			wget \
			vim \
			mutt \
			git \
			subversion \
			tmux \
			mtdev-devel \
			libwacom-devel \
			sparse \
			libunwind-devel \
			libinput-devel \
			libevdev-devel \
			openssl-devel \
			strace \
			libxml2 \
			unzip \
			docker \
		--best

		# install pt spellcheck for vim
		if [ ! -f /usr/share/vim/vim80/spell/pt.utf-8.spl ]; then
			wget https://github.com/vim/vim/files/657554/pt.utf-8.spl.zip -O /tmp/pt.zip
			$SUDO unzip /tmp/pt.zip -d /usr/share/vim/vim80/spell/
			rm /tmp/pt.zip
		fi
	fi

	$SUDO cp bash_config.sh /etc/profile.d

	for i in vimrc gitconfig muttrc tmux.conf tmux-powerlinerc
	do
		cp $i ~/.$i
	done

	#create signature file
	echo $'Thanks,\n\tMarcos' >~/.signature

	if [ ! -f ~/.vim/autoload/plug.vim ]; then
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
			https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	fi

	if [ ! -d ~/.vim/tmux-powerline ]; then
		git clone https://github.com/erikw/tmux-powerline ~/.vim/tmux-powerline
	fi

	cp custom-theme.sh ~/.vim/tmux-powerline/themes
}

install
