## Base

```bash
# Enable RPM Fusion
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
# sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1
sudo dnf config-manager --enable fedora-cisco-openh264


# Enable vscode repo
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-upgrade

# Install required packages
sudo dnf install -y code git-core btop toolbox clang

# Install group Virtualization
# sudo dnf group install -y --with-optional virtualization
# sudo dnf install -y brctl

# Sync dropbox
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd
```

## Multimedia

```bash
sudo dnf install -y gstreamer1-plugins-bad-free-extras gstreamer1-plugin-openh264 vlc yt-dlp
```

## Shell environment

```bash
# Install required packages
sudo dnf install -y fish stow

# Install rust via rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Create fish profile on konsole
#
# Re-open konsole and switch profile to "fish"
rm -rf ~/.local/share/konsole
stow konsole

#############################################################
# Following steps required fish shell as Interactive shell ##
#############################################################
#
# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
bash ~/.fzf/install --no-bash --no-zsh

rm -rf ~/.config/fish
stow fish

# Install utility programs
cargo install bat eza ripgrep zoxide

# Install fisher plugin manager
# curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# Install fish-shell plugins
# fisher install jhillyerd/plugin-git
# fisher install oh-my-fish/plugin-bang-bang

# Install nerdfonts
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git ~/.nerd-fonts
bash ~/.nerd-fonts/install.sh

rm -rf ~/.bashrc ~/.bash_profile ~/.profile
stow bash
```

## Working

```bash
# Install Google chrome
sudo dnf install fedora-workstation-repositories -y
# sudo dnf config-manager setopt google-chrome.enabled=1
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install -y google-chrome-stable

# Install flathub apps
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo --user
flatpak install flathub rest.insomnia.Insomnia --user -y
flatpak install flathub com.anydesk.Anydesk --user -y
flatpak install flathub im.riot.Riot --user -y

# Install Telegram and fix font
flatpak install flathub org.telegram.desktop --user -y
mkdir -p ~/.var/app/org.telegram.desktop/config/fontconfig/conf.d/
cp /etc/fonts/conf.d/*.conf ~/.var/app/org.telegram.desktop/config/fontconfig/conf.d/

# Install utility pacakges such as debugger, troubleshooter, vpn etc..
sudo dnf install -y openfortivpn nmap nodejs

# Setup taskbar
rm -rf ~/.config/plasma-org.kde.plasma.desktop-appletsrc
rm -rf ~/.config/kwinrc
stow kde

# Add my scripts
rm -rf ~/.local/bin
stow script

# Install Docker
# https://docs.docker.com/engine/install/fedora/#install-from-a-package
https://docs.docker.com/engine/install/fedora/#set-up-the-repository

# Create work directory
mkdir -p ~/projects/{work,personal,community}
cd ~/projects/work

# Git clone single-portal
git clone git@git.opsta.io:opstella/single-portal/single-portal.git
git clone git@git.opsta.io:nutthawit/single-portal-info.git

# Git clone dcloud
git clone git@git.opsta.io:ptt/zouth/dcloud.git
git clone git@git.opsta.io:nutthawit/dcloud-info.git

# Packages require for build virtualenv for dcloud-info (vpn-ptt-requirements.txt)
sudo dnf install -y python3-pip python3-devel python3.12 libxml2-devel libxslt-devel

# Require for connect openshift via oc command
sudo dnf install -y sshpass
```
