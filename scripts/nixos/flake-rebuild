#!/usr/bin/env bash

echo ""
toilet -f smblock --filter metal 'NixOS  Flake  Rebuild'
echo ""

cd /Nixos
git diff

# Commit su Github
git add .
echo -ne "\033[4;32mInserisci messaggio del commit:\033[0m " # Testo con ANSI
read -r commit_message
git commit -m "$commit_message"

# Rebuild sistema
sudo nixos-rebuild "$1" --flake .#"$2"
