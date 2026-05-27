{ pkgs }:

pkgs.writeShellScriptBin "flake-rebuild" ''
  echo ""
  ${pkgs.figlet}/bin/figlet -f slant "Flake Rebuild"
  echo ""

  cd /Nixos
  git diff

  # Git commit
  if [ $3 -eq "--no-commit" ]; then
    echo -ne "\033[4;32mAssicurati di eseguire il commit alla fine del rebuild:\033[0m "
  else
    git add .
    echo -ne "\033[4;32mInserisci messaggio del commit:\033[0m " # ANSI Text
    read -r commit_message
    git commit -m "$commit_message"
  fi

  # System rebuild
  sudo nixos-rebuild "$1" --flake .#"$2"
''
