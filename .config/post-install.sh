#! /bin/sh
curl https://sh.rustup.rs -sSf | sh
$HOME/.cargo/bin/cargo install ripgrep ruplacer skim zoxide fd-find

os=$(lsb_release -d)
packages="kitty zsh kakoune trash-cli"
case $os in
    *Ubuntu*)
        sudo apt install -y $packages ;;
    *Fedora*)
        sudo dnf install -y $packages ;;
    *)
        echo 'Error: OS $os is not supported' ;;
esac
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

