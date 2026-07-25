{ pkgs }:

pkgs.writeShellScriptBin "controller-config" ''
  echo -ne "\033[4;32mController Configuration: pairing, bonding and trusting\033[0m " # ANSI Text
  bluetoothctl scan on &
  sleep 3
  bluetoothctl pair "$1"
  sleep 3
  bluetoothctl trust "$1"
  sleep 1
  bluetoothctl connect "$1"
''

