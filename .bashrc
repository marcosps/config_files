# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

function apply_patches() {
	find ~/data/gitroot/linux/patches -name *.patch -print | sort | xargs cat | patch -p1 -N
}

NUMCPU=8
function kcomp() {
	apply_patches
	make -j$NUMCPU
	make modules -j$NUMCPU
	make headers_install
	sudo make modules_install -j$NUMCPU
	sudo make install -j$NUMCPU
	sudo make headers_install -j$NUMCPU
	sync
	#sudo reboot
	echo "Execute a reboot!"
}

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
