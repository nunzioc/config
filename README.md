# Configs

they can be installed using:
- mkdir .configrepo
- git clone --bare https://github.com/nunzioc/config.git ~/.configrepo
- alias config='/usr/bin/git --git-dir=$HOME/.configrepo/ --work-tree=$HOME'
- config config --local status.showUntrackedFiles no
- config checkout
- config submodule --update --recursive
