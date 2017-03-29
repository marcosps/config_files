#!/bin/bash

if [ "x$1" = "xsetup" ]; then
	# packages to be installed on a fresh Fedora install
	sudo dnf install \
		acpitool acpica-tools \
		vim \
		mutt \
		git \
		mtdev-devel \
		libwacom-devel \
		sparse

	# install pt spellcheck for vim
	if [ ! -f /usr/share/vim/vim80/spell/pt.utf-8.spl ]; then
		wget https://github.com/vim/vim/files/657554/pt.utf-8.spl.zip -O /tmp/pt.zip
		sudo unzip /tmp/pt.zip -d /usr/share/vim/vim80/spell/
		rm /tmp/pt.zip
	fi
fi

sudo cp bash_config /etc/profile.d

for i in vimrc gitconfig muttrc tmux.conf
do
	cp $i ~/.$i
done

if [ ! -f ~/.vim/bundle ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
	vim +PluginInstall +qall
fi

#create signature file
echo $'Thanks,\n\tMarcos' >~/.signature
