{ lib, config, pkgs, ... }:

let cfg = config.mpv;

in {
  options = {
    mpv.enable = lib.mkEnableOption "Enable MPV";
  };
    
  config = lib.mkIf cfg.enable {
    programs.mpv = {
      enable = true;

      scripts = with pkgs.mpvScripts; [
        modernz # Modern MPV OSC
      ];

      config = {
        profile = "gpu-hq";
        ytdl-format = "bestvideo+bestaudio";
        hwdec = "auto-safe";
        vo = "gpu";
        gpu-context = "wayland";
        sub-visibility = false;
      };
    };
  };
}
