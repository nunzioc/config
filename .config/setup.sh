!/bin/sh
# TODO: add ubuntu
sudo dnf install -y kitty kakoune zsh
# TODO: install rust
# zsh shell
chsh -s `which zsh`
# setup configs
mkdir .configrepo
git clone --bare https://github.com/nunzioc/config.git ~/.configrepo
alias config='/usr/bin/git --git-dir=$HOME/.configrepo/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
config checkout
