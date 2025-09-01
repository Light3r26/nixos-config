{ pkgs, ... }:

# Send notification if battery < 30% and is not charging
# Variable to track if notification is already sent so it doesn't spam every 60 sec after battery lower than 20%
# Script made by sanjivthapasvt on github in his Low-Battery-Notification-Script repo

let
  batteryNotification = pkgs.writeScriptBin "battery-notification" ''
    #!/usr/bin/env bash
    notified=0

    while true; do
      battery_path=$(find /sys/class/power_supply/ -name 'BAT*' | head -n1)
      battery_level=$(cat "$battery_path/capacity")
      charging_status=$(cat "$battery_path/status")

      if [[ "$battery_level" -le 35 && "$charging_status" != "Charging" ]]; then
        if [[ $notified -eq 0 ]]; then
          notify-send "⚠️ Battery Low" "Battery level is at ''${battery_level}%!" -u critical
          notified=1
        fi
      else
        notified=0
      fi

      sleep 60
    done
  '';

in {
  home.packages = [ batteryNotification ];

  systemd.user.services.battery-notification = {
    Unit = {
      Description = "Low Battery Notification Script";
      After = "graphical-session.target";
    };

    Service = {
      ExecStart = "${batteryNotification}/bin/battery-notification";
      Restart = "always";
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };

}
