#!/usr/bin/env bash

if [[ "$#" -ne "1" ]]; then
    echo "./setup.sh <HOSTNAME>"
    return 1
fi

nixos-generate-config --root /mnt
rm /mnt/etc/nixos/configuration.nix

if [[ -d ".git" ]]; then
  mkdir hosts/$1
  cp /mnt/etc/nixos/hardware.nix hosts/$1/${1}.nix
  nix-env -i git
  git add .
  git commit -m "Host $1"
  git push
fi

exit 1

nixos-install --flake .#$1 --root /mnt --impure
