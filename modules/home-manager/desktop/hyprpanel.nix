{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.hyprpanel ];
 #programs.hyprpanel = {
 #  enable = true;
 #  systemd.enable = true;
 #  settings = {
 #    layout = {
 #      bar.layouts = {
 #        "*" = {
 #          left = [ "dashboard" "cpu" "cputemp" "ram" "media"];
 #          middle = [ "workspaces" ];
 #          right = [ "wifi" "bluetooth" "battery" "volume" "notifications" ];
 #        };
 #      };
 #    };

 #    bar.launcher.autoDetectIcon = true;

 #    menus.clock = {
 #      time = {
 #        military = true;
 #        hideSeconds = true;
 #      };
 #      weather.unit = "metric";
 #    };

 #    menus.dashboard.directories.enabled = false;
 #    menus.dashboard.stats.enable_gpu = true;

 #    theme.bar.transparent = false;

 #    theme.font = {
 #      name = "CaskaydiaCove NF";
 #      size = "16px";
 #    };
 #  };
 #};
}
