{ pkgs, ... }:

let
  batteryNotification = pkgs.writeScriptBin "battery-notification" ''
    #!/usr/bin/env bashd

  '';

{

}
