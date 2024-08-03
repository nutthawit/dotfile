## Base

```bash
# Enable RPM Fusion
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

# Enable vscode repo
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-upgrade

# Install required packages
sudo dnf install -y code git-core btop brctl
sudo dnf group install -y --with-optional virtualization
sudo dnf group install -y container-management
```

## Multimedia

```bash
sudo dnf install -y gstreamer1-plugins-bad-free-extras gstreamer1-plugin-openh264 vlc yt-dlp
```

## Shell environment

```bash
# Install required packages
#
# cargo: for complie some utility like eza ripgrep zoxide
sudo dnf install -y cargo fish stow

#############################################################
# Following steps required fish shell as Interactive shell ##
#############################################################
#
# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
bash ~/.fzf/install --no-bash --no-zsh

# Install utility programs
cargo install bat eza ripgrep zoxide

# Integrate utility programs to fish
# cp home/.config/fish/functions/*.fish ~/.config/fish/functions/
# cp home/.config/fish/config.fish ~/.config/fish/config.fish
# cp home/.config/fish/fish_variables ~/.config/fish/fish_variables
# sudo cp usr/local/bin/ssh-toggle /usr/local/bin/ssh-toggle
# sudo chmod +x /usr/local/bin/ssh-toggle

# Install fisher plugin manager
# curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# Install fish-shell plugins
# fisher install jhillyerd/plugin-git
# fisher install oh-my-fish/plugin-bang-bang

# Install nerdfonts
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git ~/.nerd-fonts
bash ~/.nerd-fonts/install.sh
```

## Working

```bash
# Enable Google chrome repo
sudo dnf install fedora-workstation-repositories -y
sudo dnf config-manager setopt google-chrome.enabled=1

# Enable flathub repo
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo --user

flatpak install flathub rest.insomnia.Insomnia --user -y
flatpak install flathub com.anydesk.Anydesk --user -y
sudo dnf install -y google-chrome-stable openfortivpn nmap nodejs

# Install Telegram and fix font
flatpak install flathub org.telegram.desktop --user -y
mkdir -p ~/.var/app/org.telegram.desktop/config/fontconfig/conf.d/
cp /etc/fonts/conf.d/*.conf ~/.var/app/org.telegram.desktop/config/fontconfig/conf.d/
```
