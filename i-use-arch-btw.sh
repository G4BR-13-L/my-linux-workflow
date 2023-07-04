
# ----------------------------- REQUISITOS ----------------------------- #

LIST_OF_APPS=" git gimp vlc vim flatpak inkscape kdenlive curl libreoffice ranger steam abntex2 colorpicker google-chrome helm-git kazam latex-mk libvterm01 nvmrpi-imager spotify texlive-latexindent-meta tuxguitar urw-arial visual-studio-code-bin yay yoshimi-git"

## Atualizando o repositório ##
sudo pacman -Sy ;
sudo pacman -S yay ;
yay -S $LIST_OF_APPS --noconfirm

## Instalando pacotes Flatpak ##
flatpak install flathub com.bitwarden.desktop com.discordapp.Discord  com.microsoft.Teams org.deluge_torrent.deluge org.flozz.yoga-image-optimizer org.gnome.EasyTAG org.telegram.desktop

## Instalando snaps
yay -S snapd --noconfirm
sudo snap install authy;

## Desenvolvimento
### NODEJS
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

sudo nvm install v18;

## Rust
yay -S cargo rust --noconfirm

# ### PYTHON
yay -S python3
pip install pip
pip install --upgrade pip


# ###LATEX
# sudo apt-get install texlive-full;

### JAVA OPENJDK
yay -S jdk --noconfirm


# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #
## Finalização, atualização e limpeza##
yay -Syu
sudo reboot
# ---------------------------------------------------------------------- #
