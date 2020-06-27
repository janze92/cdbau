#!/bin/sh
bolku=/usr/bin/cdbau #staattinen polku python scriptiä varten
if [[ -n "$1" ]]; then
  if [[ $1 != --help ]]; then
    sudo pacman -Suy --noconfirm
    cd /tmp
    if [[ $1 == cdbau ]]; then
      #Lataa Gitistä itsensä.. :D
      git clone git@github.com:janze92/cdbau.git
    else # jos ei taho itteään nii kattellaa AUR
      git clone https://aur.archlinux.org/$1.git
    fi
    cd $1
    ##########################################
    python $bolku/gpgRecive.py /tmp/$1/PKGBUILD
    if [[ skipAll == $2 ]]; then
      makepkg -s --noconfirm --skippgpcheck
    elif [[ -z "$2" ]]; then

      echo "$(pwd)"
      echo "makepkg -s"

      #makepkg -s
    fi
  fi
fi

if [[ -z $1 ]]; then
  echo "Give package name. -h for help"
fi
if [[ $1 == "-h" || $1 == "--help"   ]]; then
  #vähän apua täällä
  echo "--skippgpcheck skip gpg signature verification"
fi
