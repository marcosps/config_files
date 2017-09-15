export EDITOR=vim
export LINUX_GIT_PATH=/mnt/data/gitroot/linux:~/gitroot/linux
# http://devel.fedoraproject.narkive.com/lE637KsY/malloc-perturb-everyone-should-set-this-envvar
export export MALLOC_PERTURB_=$(($RANDOM % 255 + 1))
eval $(thefuck --alias)
# You can use whatever you want as an alias, like for Mondays:
eval $(thefuck --alias FUCK)

# locales
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
