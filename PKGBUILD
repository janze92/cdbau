# Maintainer: Janze <janze@raatte.com>
pkgname=cdbau
pkgver=0.1
pkgrel=1
pkgdesc="CustomDataBaseAutoUpdater shell scripts what \
should check and fetch AUR updates to own repository"
arch=any
depends=(
  'git'
  'wget'
  'still-alpha'
)

source=("$pkgname::git+https://github.com/janze92/cdbau")

package() {
	bindestdir="$pkgdir/usr/bin"
	dest="$bindestdir/cdbau"

  install -Dm 755  cdbau.sh "$dest/cdbau.sh"
  install -Dm 755  AutoBuild.sh "$dest/AutoBuild.sh"
  install -Dm 755  dbExtract.sh "$dest/dbExtract.sh"
  install -Dm 755  haePKGBUILD.sh "$dest/haePKGBUILD.sh"
  install -Dm 755  gpgRecive.py  "$dest/gpgRecive.py"

}
