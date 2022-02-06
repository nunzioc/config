#! /bin/sh

os=$(hostnamectl | grep "Operating System")
packages="kitty zsh kakoune trash-cli git util-linux-user emacs"
case $os in
    *Ubuntu*)
        sudo apt install -y $packages ;;
    *Fedora*)
        sudo dnf install -y $packages ;;
    *)
        echo 'Error: OS $os is not supported' ;;
esac

git config --global user.email "nunziocicone@gmail.com"
git config --global user.name "Nunzio Cicone"

ssh-keygen -t ed25519 -C "nunziocicone@gmail.com"
ssh-add $HOME/.ssh/id_ed25591

echo "Add ~/.ssh/id_ed25591 to github ssh keys. type yes when done."
read ignore

cd $HOME
mkdir .configrepo
git clone --bare git@github.com/nunzioc/config.git ~/.configrepo
alias config='/usr/bin/git --git-dir=$HOME/.configrepo/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
config checkout
config submodule update --init --recursive

curl https://sh.rustup.rs -sSf | sh
$HOME/.cargo/bin/cargo install ripgrep ruplacer skim zoxide fd-find

# change shell to zsh
chsh -s `which zsh`
# gnome settings
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>u']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>i']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>o']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super>p']"
gsettings set org.gnome.desktop.wm.keybindings close "['<Super>w']"
# custom keybindings in gnome settings is a bit more involved
BEGINNING="gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"

KEY_PATH="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings \
"['$KEY_PATH/custom0/', '$KEY_PATH/custom1/']"

# Launch Terminal
$BEGINNING/custom0/ name "Terminal"
$BEGINNING/custom0/ command "kitty"
$BEGINNING/custom0/ binding "<Super>Return"

# Open up file browser
$BEGINNING/custom1/ name "Nautilus"
$BEGINNING/custom1/ command "/usr/bin/nautilus --new-window"
$BEGINNING/custom1/ binding "<Super>E"


