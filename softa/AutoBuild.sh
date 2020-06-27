#!/usr/bin/env bash
source /etc/cdbau.conf
if [[ -n "$1" ]]; then
  if [[ $1 != --help ]]; then
    sudo pacman -Suy --noconfirm
    cd $buildDir
    if [[ -d $1 ]]; then
      if [[ $1 == cdbau ]]; then
        #Lataa Gitistä itsensä.. :D
        git fetch https://github.com/janze92/cdbau.git
      else # jos ei taho itteään nii kattellaa AUR
        git fetch https://aur.archlinux.org/$1.git
      fi
    else
      if [[ $1 == cdbau ]]; then
        #Lataa Gitistä itsensä.. :D
        git clone https://github.com/janze92/cdbau.git
      else # jos ei taho itteään nii kattellaa AUR
        git clone https://aur.archlinux.org/$1.git
      fi
    fi

    if [[ -d $1 ]]; then
      cd $1
      if [[ "$2" == "--nopgpkeypresent" || "$3" == "--nopgpkeypresent" ]]; then
        python $bolku/gpgRecive.py /tmp/$1/PKGBUILD
      fi
      if [[ skipAll == $2 ]]; then
        makepkg -s --noconfirm --skippgpcheck
      elif [[ -z "$2" ]]; then
        makepkg -s --noconfirm
      fi
    else
      echo "vituks man, kansiota jossa pitäs olla jotai ei ole!"
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
