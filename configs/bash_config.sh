export EDITOR=vim
eval "$(thefuck --alias)"
# You can use whatever you want as an alias, like for Mondays:
eval "$(thefuck --alias FUCK)"

# set GO env vars
GITROOT=~/data/gitroot
if [ ! -d "$GITROOT" ]; then
	GITROOT=~/gitroot
fi

export GOPATH=$GITROOT/go
export GOBIN=$GITROOT/go/bin
mkdir -p $GITROOT/{go,bin}

# locales
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
