{
  programs.hyprpanel = {
    enable = true;
    systemd.enable = true;
    settings = {
      layout = {
        bar.layouts = {
          "*" = {
            left = [ "dashboard" "cpu" "ram" "battery" "media"];
            middle = [ "workspaces" ];
            right = [ "wifi" "bluetooth" "volume" "systray" "notifications" ];
          };
        };
      };

      bar.launcher.autoDetectIcon = true;

      menus.clock = {
        time = {
          military = true;
          hideSeconds = true;
        };
        weather.unit = "metric";
      };

      menus.dashboard.directories.enabled = false;
      menus.dashboard.stats.enable_gpu = true;

      theme.bar.transparent = true;

      theme.font = {
        name = "CaskaydiaCove NF";
        size = "16px";
      };
    };
  };
}
