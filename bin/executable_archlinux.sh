#!/usr/bin/env sh

set -o errexit -o nounset
# trash-cli
ins="pacman -S --noconfirm --needed"
pkgs_aur="lazygit discord-ptb gitflow-avh"
pkgs="base-devel neovim"
build() {
  PKG_URL="https://aur.archlinux.org/cgit/aur.git/snapshot/$1.tar.gz"
  PKG_NAME="${PKG_URL##*/}" # e.g yay.tar.gz
  PKG="${PKG_NAME%%.*}" # e.g yay
  BUILD_DIR="$HOME/build/$PKG"
  [ -d "$BUILD_DIR" ] || mkdir -p "$BUILD_DIR"
  [ -d "$BUILD_DIR" ] && rm -rf "$BUILD_DIR"/*
  ( cd "$BUILD_DIR" \
    && curl -o "$PKG_NAME" -L "$PKG_URL" \
    && tar xvf "$PKG_NAME" \
    && cd "$PKG" \
    && makepkg -si --noconfirm
  )
}

install_skogix_deps() {
  pkgs="$pkgs xclip base-devel git wget openssh unzip neovim"
}
install_skogix() {
  while IFS= read -r pkg; do
    pkgs="$pkgs $pkg"
  done < "skogix.pkgs"
}

# köra yay istället?
install_extra_deps() {
  # echo $pkgs_aur
  for extraPkg in $pkgs_aur; do
    # echo $extraPkg
    echo y | LANG=C yay --answerdiff None --answerclean None --mflags "--noconfirm" $extraPkg
    # yay -S --sudoloop --noconfirm $extraPkg
  done
}

usage() {
  printf "\nUsage:\n"
  echo " --deps         Install dependencies"
  echo " --skogix       Install skogix"
  echo " --extra        Install extra"
}

## CLI options
DEPS=false
EXTRA=false
SKOGIX=false

if [ "$#" -eq 0 ] ; then usage ; exit 1 ; fi

while [ "$#" -gt 0 ] ; do
  case "$1" in
    --deps) DEPS=true ;;
    --extra) EXTRA=true ;;
    --skogix) SKOGIX=true ;;
    *) usage; exit 1 ;;
  esac
  shift
done

main() {
  "$DEPS" && install_skogix_deps
  "$SKOGIX" && install_skogix
  "$EXTRA" && install_extra_deps

  sudo pacman -Syy
  sudo $ins $pkgs

  # "$EXTRA" && install_extra_deps

  exit 0
}

main "$@"
