#!/usr/bin/env bash

# ----------------------------- VARIÁVEIS ----------------------------- #
URL_VSCODE="https://az764295.vo.msecnd.net/stable/fd6f3bce6709b121a895d042d343d71f317d74e7/code_1.54.2-1615424848_amd64.deb"
URL_NOTABLE="https://github-releases.githubusercontent.com/162815665/843d8880-3c8a-11ea-8a38-40f5284cbd2a?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20210403%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20210403T194523Z&X-Amz-Expires=300&X-Amz-Signature=82f63b44d8d04251c82a6148ac13673aa3f750eb2965bcc244c9ab3759c31897&X-Amz-SignedHeaders=host&actor_id=65966676&key_id=0&repo_id=162815665&response-content-disposition=attachment%3B%20filename%3Dnotable_1.8.4_amd64.deb&response-content-type=application%2Foctet-stream"
URL_4K_VIDEO_DOWNLOADER="https://dl.4kdownload.com/app/4kvideodownloader_4.9.2-1_amd64.deb"
URL_MICROSOFT_TEAMS="https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.4.00.4855_amd64.deb"
DIRETORIO_DOWNLOADS="$HOME/Downloads/programas"

# ----------------------------- REQUISITOS ----------------------------- #

PROGRAMAS_PARA_INSTALAR=(
  snapd
  git
  deluge
  gimp
  vlc
  vim
  flatpak
)

## Removendo travas eventuais do apt ##
sudo rm /var/lib/dpkg/lock-frontend;
sudo rm /var/cache/apt/archives/lock;

## Atualizando o repositório ##
sudo apt update -y

## Download e instalaçao de programas externos ##
mkdir "$DIRETORIO_DOWNLOADS"
wget -c "$URL_4K_VIDEO_DOWNLOADER" -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_VSCODE"              -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_MICROSOFT_TEAMS"     -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_NOTABLE"             -P "$DIRETORIO_DOWNLOADS"


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
flatpak install flathub com.github.alainm23.planner


# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #
## Finalização, atualização e limpeza##
sudo apt update && sudo apt dist-upgrade -y
flatpak update
sudo apt autoclean
sudo apt autoremove -y
sudo reboot
# ---------------------------------------------------------------------- #