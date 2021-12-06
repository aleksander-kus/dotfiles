#!/bin/bash

addrepo() { \
    echo "#########################################################"
    echo "## Adding the DTOS core repository to /etc/pacman.conf ##"
    echo "#########################################################"
    grep -qxF "[dtos-core-repo]" /etc/pacman.conf ||
        (echo "[dtos-core-repo]"; echo "SigLevel = Required DatabaseOptional"; \
        echo "Server = https://gitlab.com/dwt1/\$repo/-/raw/main/\$arch") | sudo tee -a /etc/pacman.conf
}

addrepo || error "Error adding DTOS repo to /etc/pacman.conf."

addkeyserver() { \
    echo "#######################################################"
    echo "## Adding keyservers to /etc/pacman.d/gnupg/gpg.conf ##"
    echo "#######################################################"
    grep -qxF "keyserver.ubuntu.com:80" /etc/pacman.d/gnupg/gpg.conf || echo "keyserver hkp://keyserver.ubuntu.com:80" | sudo tee -a /etc/pacman.d/gnupg/gpg.conf
    grep -qxF "keyserver.ubuntu.com:443" /etc/pacman.d/gnupg/gpg.conf || echo "keyserver hkps://keyserver.ubuntu.com:443" | sudo tee -a /etc/pacman.d/gnupg/gpg.conf
}

addkeyserver || error "Error adding keyservers to /etc/pacman.d/gnupg/gpg.conf"

receive_key() { \
    local _pgpkey="C71486C31555B12E"
    echo "#####################################"
    echo "## Adding PGP key $_pgpkey ##"
    echo "#####################################"
    sudo pacman-key --recv-key $_pgpkey
    sudo pacman-key --lsign-key $_pgpkey
}

receive_key || error "Error receiving PGP key $_pgpkey"
