
# ----------------------------- REQUISITOS ----------------------------- #

LIST_OF_APPS=" git gimp vlc vim flatpak inkscape kdenlive curl libreoffice ranger steam abntex2 colorpicker google-chrome helm-git insomnia jre kazam kwin-bismuth latex-mk libvterm01 nvm rpi-imager spotify texlive-latexindent-meta tuxguitar upscayl-bin visual-studio-code-bin yay yoshimi-git "
DIRETORIO_DOWNLOADS="$HOME/Downloads/programas"
REAPER="https://www.reaper.fm/files/6.x/reaper672_linux_x86_64.tar.xz"

DIRETORIO_DOWNLOADS="$HOME/Downloads/programas"
mkdir "$DIRETORIO_DOWNLOADS"
wget -c "$REAPER" -P "$DIRETORIO_DOWNLOADS";


## Configuração do git 
git config --global user.email "gabriel.victorc13@gmail.com";
git config --global user.name "G4BR-13-L";

## Atualizando o repositório ##
sudo pacman -Sy ;
sudo pacman -S yay ;
yay -S $LIST_OF_APPS --noconfirm

## Instalando pacotes Flatpak ##
flatpak install flathub com.bitwarden.desktop com.discordapp.Discord com.github.cfcurtis.pdfstitcher com.jetbrains.IntelliJ-IDEA-Community com.microsoft.Teams com.todoist.Todoist org.deluge_torrent.deluge org.flozz.yoga-image-optimizer org.gnome.EasyTAG org.telegram.desktop

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
