# Maintainer: Janze <janze@raatte.com>
pkgname=cdbau
pkgver=0.1
pkgrel=1
pkgdesc="CustomDataBaseAutoUpdater shell scripts what \
should check and fetch AUR updates to own repository"
arch=('any')
depends=(
  'bash'
  'git'
  'wget'
  'python'
)

source=("$pkgname::git+https://github.com/janze92/cdbau")

md5sums=('SKIP')

package() {

	bindestdir="$pkgdir/usr/bin"
	dest="$bindestdir/cdbau"

  cd cdbau/softa

  install -Dm 755  cdbau.sh "$dest/cdbau.sh"
  install -Dm 755  AutoBuild.sh "$dest/AutoBuild.sh"
  install -Dm 755  dbExtract.sh "$dest/dbExtract.sh"
  install -Dm 755  haePKGBUILD.sh "$dest/haePKGBUILD.sh"
  install -Dm 755  gpgRecive.py  "$dest/gpgRecive.py"
  install -Dm 744  cdbau.conf "$pkgdir/etc/cdbau.conf"

}
