#!/bin/bash

# ----------------------------- REQUISITOS ----------------------------- #

sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

# ----------------------------- INSTALAÇÃO ----------------------------- #

# Atualizar o repositório
sudo pacman -Sy

# Lista de aplicativos a serem instalados
LIST_OF_APPS="git gimp vlc vim flatpak inkscape kdenlive curl libreoffice ranger steam abntex2 colorpicker google-chrome helm-git kazam latex-mk libvterm01 nvmrpi-imager spotify texlive-latexindent-meta tuxguitar urw-arial visual-studio-code-bin yoshimi-git pipiwire-alsa pipewire-jack pipewire-pulse yabridge yabridgectl starship stremio neofetch lapce spectacle filelight dbeaver steam noto-fonts-emoji obsidian reaper"

# Instalar os aplicativos da lista
echo "Instalando aplicativos..."
yay -S $LIST_OF_APPS --noconfirm

# Instalar pacotes Flatpak
flatpak_packages=("com.bitwarden.desktop" "com.discordapp.Discord" "com.microsoft.Teams" "org.deluge_torrent.deluge" "org.flozz.yoga-image-optimizer" "org.gnome.EasyTAG" "org.telegram.desktop" "com.jetbrains.IntelliJ-IDEA-Ultimate")

for package in "${flatpak_packages[@]}"; do
    flatpak install flathub "$package" -y
done

# Instalar Snapd e Authy
if ! command -v snap &> /dev/null; then
    echo "Instalando Snapd..."
    yay -S snapd --noconfirm
    sudo snap install authy
fi

# Instalar Node.js com NVM
if ! command -v node &> /dev/null; then
    echo "Instalando Node.js com NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    sudo nvm install v18
fi

# Instalar Rust e Cargo
if ! command -v cargo &> /dev/null; then
    echo "Instalando Rust e Cargo..."
    yay -S cargo rust --noconfirm
fi

# Instalar Python3 e atualizar pip
if ! command -v python3 &> /dev/null; then
    echo "Instalando Python 3..."
    yay -S python3
fi
pip install --upgrade pip

# Instalar OpenJDK
if ! command -v java &> /dev/null; then
    echo "Instalando OpenJDK..."
    yay -S jdk --noconfirm
fi

# Instalar Docker
if ! command -v java &> /dev/null; then
    echo "Instalando Docker..."
    yay -S docker --noconfirm
    sudo systemctl enable docker
    sudo systemctl start docker
fi

# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #

# Atualizar pacotes
echo "Atualizando pacotes..."
yay -Syu

# Reiniciar o sistema
echo "Reiniciando o sistema..."
# sudo reboot
