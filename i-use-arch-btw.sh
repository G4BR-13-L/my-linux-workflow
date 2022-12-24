
# ----------------------------- REQUISITOS ----------------------------- #

LIST_OF_APPS=" git gimp vlc vim flatpak inkscape kdenlive curl libreoffice ranger steam abntex2 colorpicker google-chrome helm-git insomnia jre kazam kwin-bismuth latex-mk libvterm01 nvm rpi-imager spotify texlive-latexindent-meta tuxguitar tuxguitar-common upscayl-bin urw-arial visual-studio-code-bin yay yoshimi-git"



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
yay -S nvm --noconfirm
sudo nvm install --lts;

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
