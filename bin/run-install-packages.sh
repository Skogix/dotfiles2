#!/bin/sh
echo "### running bin/run_onchange-install-packages.sh"
sudo pacman -Syyu
while IFS= read -r pkg; do
  pkgs="$pkgs $pkg"
done < "skogix.pkgs"
