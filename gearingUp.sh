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
)


## Removendo travas eventuais do apt ##
sudo rm /var/lib/dpkg/lock-frontend;
sudo rm /var/cache/apt/archives/lock;

## Atualizando o repositório ##
sudo apt update -y

## Download e instalaçao de programas externos ##
mkdir "$DIRETORIO_DOWNLOADS"
wget -c "$URL_VSCODE"              -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_MICROSOFT_TEAMS"     -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_GOOGLE_CHROME"     -P "$DIRETORIO_DOWNLOADS"




## Instalando pacotes .deb baixados na sessão anterior ##
sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb


# Instalar programas no apt
for nome_do_programa in ${PROGRAMAS_PARA_INSTALAR[@]}; do
  if ! dpkg -l | grep -q $nome_do_programa; then # Só instala se já não estiver instalado
    apt install "$nome_do_programa" -y
  else
    echo "[INSTALADO] - $nome_do_programa"
  fi
done

## Instalando pacotes Flatpak ##
flatpak install flathub com.spotify.Client
flatpak install flathub com.bitwarden.desktop
flatpak install flathub org.telegram.desktop
flatpak install flathub com.discordapp.Discord
flatpak install flathub com.jgraph.drawio.desktop

## Desenvolvimento
### NODEJS
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash;

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

sudo nvm install node;

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
sudo apt install openjdk-default;


# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #
## Finalização, atualização e limpeza##
sudo apt update && sudo apt dist-upgrade -y
flatpak update
sudo apt autoclean
sudo apt autoremove -y
# ---------------------------------------------------------------------- #
