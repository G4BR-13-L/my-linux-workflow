#!/usr/bin/env bash

# ----------------------------- VARIÁVEIS ----------------------------- #
URL_VSCODE="https://az764295.vo.msecnd.net/stable/fd6f3bce6709b121a895d042d343d71f317d74e7/code_1.54.2-1615424848_amd64.deb"
URL_MICROSOFT_TEAMS="https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.4.00.4855_amd64.deb"
ULR_GOOGLE_CHROME="wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
DIRETORIO_DOWNLOADS="$HOME/Downloads/programas"

# ----------------------------- REQUISITOS ----------------------------- #

PROGRAMAS_PARA_INSTALAR=(
  git
  gimp
  vlc
  vim
  flatpak
  inkscape
  kdenlive
  curl
  libreoffice
  ranger
  qt5-style-kvantum 
  qt5-style-kvantum-themes
  steam
)

4kvideodownloader 4.21.7.5040-1
abntex2 1.9.7-4
android-sdk 26.1.1-2
android-sdk-platform-tools 33.0.3-1
android-studio 2021.3.1.17-1
colorpicker 1.0.f5d441a-2
docker-desktop 4.12.0-85629
flutter 3.3.10-1
google-chrome 108.0.5359.124-1
helm-git 0.9.0.r1897.abdedd52-2
insomnia 2022.7.0-2
jre 19.0.1-1
kazam 1.4.5-9
kwin-bismuth 3.1.4-1
latex-mk 2.1-4
libvterm01 0.1.4-2
lightly-git r2172.121a61e5-2
metis 5.1.0.p10-2
newaita-icons-git r929.c2b596b09-1
newaita-reborn-icons-git r88.5b19f46a-1
nvm 0.39.2-1
pacwall-git 2.3.r8.gbc51686-1
parsec-bin 150_28-5
perl-log-dispatch 2.70-1
plasma5-wallpapers-dynamic 4.4.0-1
pomatez 1.1.0-1
postgresql14 14.6-1
postgresql14-libs 14.6-1
python311 3.11.1-1
rpi-imager 1.7.3-2
sdkmanager 0.6.0-2
shell-color-scripts 1.1.r96.da2e3c5-1
spotify 1:1.1.84.716-2
spotify-tui 0.25.0-2
teams 1.5.00.23861-1
texlive-latexindent-meta 1-1
tuxguitar 1.5.6-3
tuxguitar-common 1.5.6-3
upscayl-bin 1.5.5-2
urw-arial 20060321-1
visual-studio-code-bin 1.74.2-1
wlr-randr 0.2.0-2
yay 11.3.1-1
yoshimi-git r3530.0ff060d1-1



## Atualizando o repositório ##
sudo apt update -y;

## Download e instalaçao de programas externos ##
mkdir "$DIRETORIO_DOWNLOADS"
wget -c "$URL_VSCODE"              -P "$DIRETORIO_DOWNLOADS";
wget -c "$URL_MICROSOFT_TEAMS"     -P "$DIRETORIO_DOWNLOADS";
wget -c "$URL_GOOGLE_CHROME"     -P "$DIRETORIO_DOWNLOADS";




## Instalando pacotes .deb baixados na sessão anterior ##
sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb;


# Instalar programas no apt


## Instalando pacotes Flatpak ##
flatpak install flathub com.bitwarden.desktop                    
flatpak install flathub com.discordapp.Discord                      
flatpak install flathub com.github.cfcurtis.pdfstitcher              
flatpak install flathub …m.jetbrains.IntelliJ-IDEA-Community      
flatpak install flathub com.microsoft.Teams                   
flatpak install flathub com.todoist.Todoist                          
flatpak install flathub org.deluge_torrent.deluge                    
flatpak install flathub org.flozz.yoga-image-optimizer               
flatpak install flathub org.freedesktop.Platform             
flatpak install flathub org.freedesktop.Platform             
flatpak install flathub org.freedesktop.Platform.GL.default  
flatpak install flathub org.freedesktop.Platform.GL.default  
flatpak install flathub org.freedesktop.Platform.GL.default 
flatpak install flathub org.freedesktop.Platform.ffmpeg-full              
flatpak install flathub org.freedesktop.Platform.openh264    
flatpak install flathub org.freedesktop.Platform.openh264    
flatpak install flathub org.freedesktop.Sdk                  
flatpak install flathub org.gnome.EasyTAG                            
flatpak install flathub org.gnome.Platform                                
flatpak install flathub org.gnome.Platform                                
flatpak install flathub org.gtk.Gtk3theme.Breeze                   
flatpak install flathub org.telegram.desktop                         
flatpak install flathub org.telegram.desktop.webview                
flatpak install flathub us.zoom.Zoom                                         

## Instalando snaps
sudo apt install snapd;
sudo snap install authy;

## Desenvolvimento
### NODEJS
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash;

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

sudo nvm install --lts;

### PYTHON
sudo apt-get install software-properties-common;
sudo add-apt-repository ppa:deadsnakes/ppa;
sudo apt-get update;
sudo apt-get install python3.8;
sudo apt install python3-pip;
pip install pandas;

###LATEX
sudo apt-get install texlive-full;

### JAVA OPENJDK
sudo add-apt-repository ppa:openjdk-r/ppa;
sudo apt-get update;
sudo apt install default-jdk;


# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #
## Finalização, atualização e limpeza##
sudo apt update && sudo apt dist-upgrade -y;
sudo pkcon update;
flatpak update;
sudo apt autoclean;
sudo apt autoremove -y;
# ---------------------------------------------------------------------- #
