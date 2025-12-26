{ pkgs }:

pkgs.writeShellScriptBin "flake-rebuild" ''
  echo ""
  ${pkgs.figlet}/bin/figlet -f slant "Flake Rebuild"
  echo ""

  cd /Nixos
  git diff

  # Git commit
  git add .
  echo -ne "\033[4;32mInserisci messaggio del commit:\033[0m " # ANSI Text
  read -r commit_message
  git commit -m "$commit_message"

  # System rebuild
  sudo nixos-rebuild "$1" --flake .#"$2"
''
