#!/usr/bin/env bash

if [[ -z "$1" ]]; then
  echo "Kerro paketin nimi ensimmäisenä muuttujana."
else
  paketti=$(grep -A1 -P "%NAME%" $1/desc |grep -vP "%NAME%")
  versio=$(grep -A1 -P "%VERSION%" $1/desc |grep -vP "%VERSION%")

  cd $1
  wget https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=$paketti -O pakettish
  source pakettish

  if [[ "$versio" == "$pkgver" ]]; then
    # Ei päivitettävää
    echo "Ei tehtävää."
  elif [[ "$versio" > "$pkgver" ]]; then
    # DB uudempi kun aur versio o.O
    echo "sul on jo uudempi o.O"
  else
    #päivitetään
    if [[ -n validgpgkeys ]]; then
      /usr/bin/cdbau/./AutoBuild.sh $paketti
    else
      /usr/bin/cdbau/./AutoBuild.sh $paketti --nopgpkeypresent
    fi
  fi
fi
