#!/usr/bin/env bash

if [[ -z "$1" ]]; then
  echo "Kerro paketin nimi ensimmäisenä muuttujana."
else
  #https://aur.archlinux.org/packages/google-chrome
  paketti=$(grep -A1 -P "%NAME%" $1 |grep -vP "%NAME%")
  versio=$(grep -A1 -P "%VERSION%" $1 |grep -vP "%VERSION%")

  cd $1
  wget https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=$paketti -O pakettish
  source pakettish

  if [[ "$versio" == "$pkgver" ]]; then
    # Ei päivitettävää
  elif [[ "$versio" > "$pkgver" ]]; then
    # DB uudempi kun aur versio o.O
  else
    #päivitetään
    #kutsua sitä valmista scriptiä tai lisätä se tähän..
  fi

  echo  "Databasessa"
  echo  $paketti
  echo  $versio
  echo  "AUR:rissa"
  echo  $pkgname
  echo  $pkgver

fi
