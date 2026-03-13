{ lib, config, pkgs, ... }:

let
  cfg = config.common.cli-tools;

in 
{
  options = {
    common.cli-tools.enable = lib.mkEnableOption "Enable common cli tools";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      tree
      bat
      lsd
      yazi # Terminal file manager
      htop # Process manager
      btop # Advanced process manager
      killall
      # Other tools
      gh # GitHub CLI
      wget
      zip
      unzip
      ffmpeg
      bitwarden-cli
      upower # Battery utility
      wl-clipboard
      fanctl # Fan control
      gamemode # Gaming optimiser
      tlp # Advanced power manager
      # Programming
      python3
      uv
      nodejs_latest
      concurrently
      # Needed for Rider
      dotnet-sdk
      dotnet-ef
      msbuild
      # ----------------
      icu # Unicode and globalization support library
    ];
  };
}
