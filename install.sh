sudo cp bash_config /etc/profile.d
cp kernel_config ~/

for i in vimrc gitconfig muttrc
do
	cp $i ~/.$i
done
