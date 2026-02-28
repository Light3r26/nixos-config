{ pkgs, ... }:

{
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
}
