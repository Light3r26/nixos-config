{
  programs.hyprpanel = {
    enable = true;
    systemd.enable = true;
    settings = {
      bar = {
        layouts = {
          "*" = {
            "left" = [
              "dashboard"
              "cpu"
              "cputemp"
              "ram"
              "media"
            ];
            "middle" = [
              "workspaces"
            ];
            "right" = [
              "network"
              "bluetooth"
              "battery"
              "volume"
              "systray"
              "clock"
              "notifications"
              "power"
            ];
          };
        };
      };

      bar = {
        customModules.storage.paths = [ "/" ];

        launcher = {
          autoDetectIcon = true;
        };

        clock = {
          format = "%H : %M";
          icon = "";
        };

        media = {
          truncation_size = 10;
          show_active_only = true;
        };

        workspaces = {
          show_numbered = true;
          numbered_active_indicator = "highlight";
          scroll_speed = 5;
          workspaces = 5;
        };

        bluetooth.label = false;
        network.label = false;

        customModules = {
          ram.labelType = "used/total";
          power.leftClick = "wlogout -b 5 -r 1";
          cpuTemp = {
            pollingInterval = 2000;
            unit = "metric";
            label = true;
          };
        };
      };

      menus = {
        clock = {
          weather.enabled = false;
          time = {
            hideSeconds = true;
            military = true;
          };
          weather = {
            unit = "metric";
          };
        };
        dashboard = {
          powermenu.avatar.image = "/home/light3r/Graphics/materiale/File/Watermark.png";
          shortcuts.enabled = false;
          powermenu.confirmation = false;
          controls.enabled = false;
          directories = {
            enabled = false;
          };
          stats = {
            enable_gpu = true;
          };
        };
      };
      theme = {
        font = {
          name = "CaskaydiaCove Nerd Font Propo";
          size = "18px";
        };
      };
      "theme.bar.transparent" = true;
      "theme.bar.floating" = false;
      "theme.bar.enableShadow" = false;
      "theme.bar.location" = "top";

      "theme.bar.buttons.style" = "default";
      "theme.bar.buttons.volume.border" = "#b4beff";

      "theme.bar.buttons.dashboard.background" = "#323844";
      "theme.bar.buttons.dashboard.icon" = "#5176c4";
      "theme.bar.buttons.dashboard.border" = "#5177c4";

      "theme.bar.buttons.workspaces.background" = "#323844";
      "theme.bar.buttons.workspaces.numbered_active_highlighted_text_color" = "#dcdfe1";
      "theme.bar.buttons.workspaces.available" = "#dcdfe1";
      "theme.bar.buttons.workspaces.occupied" = "#dcdfe1";
      "theme.bar.buttons.workspaces.active" = "#151a27";
      "theme.bar.buttons.workspaces.hover" = "#151a27";
      "theme.bar.buttons.workspaces.pill.active_width" = "12em";
      "theme.bar.buttons.workspaces.pill.height" = "4em";
      "theme.bar.buttons.workspaces.pill.width" = "4em";

      "theme.bar.buttons.media.background" = "#323844";
      "theme.bar.buttons.media.text" = "#dcdfe1";
      "theme.bar.buttons.media.icon" = "#b48ead";

      "theme.bar.buttons.volume.background" = "#323844";
      "theme.bar.buttons.volume.text" = "#dcdfe1";
      "theme.bar.buttons.volume.icon" = "#dcdfe1";

      "theme.bar.buttons.network.background" = "#323844";
      "theme.bar.buttons.network.text" = "#dcdfe1";
      "theme.bar.buttons.network.icon" = "#88c0d0";

      "theme.bar.buttons.bluetooth.background" = "#323844";
      "theme.bar.buttons.bluetooth.text" = "#dcdfe1";
      "theme.bar.buttons.bluetooth.icon" = "#00bfff";

      "theme.bar.buttons.systray.background" = "#323844";
      "theme.bar.buttons.systray.customIcon" = "#dcdfe1";

      "theme.bar.buttons.clock.background" = "#323844";
      "theme.bar.buttons.clock.text" = "#dcdfe1";
      "theme.bar.buttons.clock.icon" = "#dcdfe1";

      "theme.bar.buttons.notifications.background" = "#323844";
      "theme.bar.buttons.notifications.total" = "#f04747";
      "theme.bar.buttons.notifications.icon" = "#dcdfe1";

      "theme.bar.buttons.battery.text" = "#dcdfe1";
      "theme.bar.buttons.battery.background" = "#323844";
      "theme.bar.buttons.battery.icon" = "#27cd40";

      "theme.bar.buttons.modules.ram.text" = "#dcdfe1";
      "theme.bar.buttons.modules.ram.icon" = "#ebcb8b";
      "theme.bar.buttons.modules.ram.background" = "#323844";

      "theme.bar.buttons.modules.cpu.text" = "#dcdfe1";
      "theme.bar.buttons.modules.cpu.icon" = "#d08670";
      "theme.bar.buttons.modules.cpu.background" = "#323844";

      "theme.bar.buttons.modules.cpuTemp.background" = "#323844";
      "theme.bar.buttons.modules.cpuTemp.text" = "#dcdfe1";
      "theme.bar.buttons.modules.cpuTemp.icon" = "#bf616a";

      "theme.bar.buttons.modules.power.icon" = "#f94040";
      "theme.bar.buttons.modules.power.background" = "#323844";

      "theme.bar.menus.buttons.active" = "#81a1c1";
      "theme.bar.menus.label" = "#dcdef1";
      "theme.bar.menus.popover.text" = "#dcdef1";
      "theme.bar.menus.tooltip.background" = "#323844";
      "theme.bar.menus.tooltip.text" = "#dcdef1";
      "theme.bar.menus.menu.dashboard.controls.volume.background" = "#4c566a";
      "theme.bar.menus.background" = "#2e3440";
      "theme.bar.menus.cards" = "#3b4252";
      "theme.bar.menus.text" = "#dcdef1";

      "theme.bar.menus.menu.dashboard.background.color" = "#2e3440";
      "theme.bar.menus.menu.dashboard.card.color" = "#3b4252";
      "theme.bar.menus.menu.dashboard.profile.name" = "#dcdfe1";
      "theme.bar.menus.menu.dashboard.controls.wifi.background" = "#88c0d0";
      "theme.bar.menus.menu.dashboard.controls.bluetooth.background" = "#00bfff";
      "theme.bar.menus.menu.dashboard.controls.notifications.background" = "#dcdef1";
      "theme.bar.menus.menu.dashboard.monitors.gpu.icon" = "#a3be8c";
      "theme.bar.menus.menu.dashboard.monitors.gpu.bar" = "#a3be8c";
      "theme.bar.menus.menu.dashboard.monitors.gpu.label" = "#a3be8c";
      "theme.bar.menus.menu.dashboard.monitors.ram.icon" = "#ebcb8b";
      "theme.bar.menus.menu.dashboard.monitors.cpu.icon" = "#d08670";
      "theme.bar.menus.menu.dashboard.monitors.cpu.bar" = "#d08670";
      "theme.bar.menus.menu.dashboard.monitors.cpu.label" = "#d08670";
      "theme.bar.menus.menu.dashboard.monitors.ram.bar" = "#ebcb8b";
      "theme.bar.menus.menu.dashboard.monitors.ram.label" = "#ebcb8b";
      "theme.bar.menus.menu.dashboard.monitors.disk.icon" = "#b48ead";
      "theme.bar.menus.menu.dashboard.monitors.disk.bar" = "#b48ead";
      "theme.bar.menus.menu.dashboard.monitors.disk.label" = "#b48ead";
      "theme.bar.menus.menu.dashboard.powermenu.shutdown" = "#bf616a";
      "theme.bar.menus.menu.dashboard.powermenu.restart" = "#d08670";
      "theme.bar.menus.menu.dashboard.powermenu.logout" = "#a3be8c";
      "theme.bar.menus.menu.dashboard.powermenu.sleep" = "#5e81ac";

      "theme.bar.menus.menu.network.card.color" = "#3b4252";
      "theme.bar.menus.menu.network.background.color" = "#2e3440";
      "theme.bar.menus.menu.network.text" = "#dcdfe1";
      "theme.bar.menus.menu.network.label.color" = "#88c0d0";
      "theme.bar.menus.menu.network.listitems.active" = "#88c0d0";
      "theme.bar.menus.menu.network.switch.enabled" = "#88c0d0";
      "theme.bar.menus.menu.network.icons.active" = "#88c0d0";
      "theme.bar.menus.menu.network.scroller.color" = "#88c0d0";
      "theme.bar.menus.menu.network.iconbuttons.active" = "#88c0d0";
      "theme.bar.menus.menu.network.icons.passive" = "#cdd6f4";

      "theme.bar.menus.menu.bluetooth.card.color" = "#3b4252";
      "theme.bar.menus.menu.bluetooth.background.color" = "#2e3440";
      "theme.bar.menus.menu.bluetooth.label.color" = "#00bfff";
      "theme.bar.menus.menu.bluetooth.listitems.active" = "#00bfff";
      "theme.bar.menus.menu.bluetooth.icons.active" = "#00bfff";
      "theme.bar.menus.menu.bluetooth.iconbutton.active" = "#00bfff";
      "theme.bar.menus.menu.bluetooth.scroller.color" = "#00bfff";
      "theme.bar.menus.menu.bluetooth.switch.enabled" = "#00bfff";
      "theme.bar.menus.menu.bluetooth.iconbutton.passive" = "#dcdfe1";
      "theme.bar.menus.menu.bluetooth.text" = "#dcdfe1";

      "theme.bar.menus.menu.battery.text" = "#dcdfe1";
      "theme.bar.menus.menu.battery.label.color" = "#dcdfe1";
      "theme.bar.menus.menu.battery.listitems.active" = "#27cd40";
      "theme.bar.menus.menu.battery.icons.active" = "#f9e2af";
      "theme.bar.menus.menu.battery.slider.primary" = "#ebcb8b";
      "theme.bar.menus.menu.battery.background.color" = "#2e3440";
      "theme.bar.menus.menu.battery.card.color" = "#3b4252";

      "theme.bar.menus.menu.volume.text" = "#dcdfe1";
      "theme.bar.menus.menu.volume.card.color" = "#3b4252";
      "theme.bar.menus.menu.volume.label.color" = "#dcdfe1";
      "theme.bar.menus.menu.volume.background.color" = "#2e3440";
      "theme.bar.menus.menu.volume.listitems.active" = "#81a1c1";
      "theme.bar.menus.menu.volume.audio_slider.primary" = "#81a1c1";
      "theme.bar.menus.menu.volume.iconbutton.active" = "#81a1c1";
      "theme.bar.menus.menu.volume.input_slider.primary" = "#81a1c1";

      "theme.bar.menus.menu.systray.dropdownmenu.background" = "#2e3440";
      "theme.bar.menus.menu.systray.dropdownmenu.text" = "#dcdfe1";
      "theme.bar.menus.menu.systray.dropdownmenu.divider" = "#2e3440";

      "theme.bar.menus.menu.clock.background.color" = "#2e3440";
      "theme.bar.menus.menu.clock.card.color" = "#3b4252";
      "theme.bar.menus.menu.clock.time.time" = "#dcdfe1";
      "theme.bar.menus.menu.clock.calendar.yearmonth" = "#dcdfe1";
      "theme.bar.menus.menu.clock.calendar.weekdays" = "#81a1c1";
      "theme.bar.menus.menu.clock.calendar.paginator" = "#81a1c1";
      "theme.bar.menus.menu.clock.calendar.currentday" = "#81a1c1";
      "theme.bar.menus.menu.clock.calendar.days" = "#dcdef1";

      "theme.bar.menus.menu.notifications.card" = "#3b4252";
      "theme.bar.menus.menu.notifications.switch.enabled" = "#a3be8c";
      "theme.bar.menus.menu.notifications.clear" = "#bf616a";
      "theme.bar.menus.menu.notifications.background" = "#2e3440";
      "theme.bar.menus.menu.notifications.scrollbar.color" = "#3b4252";
      "theme.bar.menus.menu.notifications.label" = "#dcdfe1";
      "theme.bar.menus.menu.notifications.pager.button" = "#dcdfe1";

      "theme.bar.menus.menu.media.card.color" = "#3b4252";
      "theme.bar.menus.menu.media.background.color" = "#2e3440";
      "theme.bar.menus.menu.media.slider.primary" = "#dcdfe1";
      "theme.bar.menus.menu.media.buttons.background" = "#dcdfe1";
      "theme.bar.menus.menu.media.album" = "#dcdfe1";
      "theme.bar.menus.menu.media.timestamp" = "#dcdfe1";
      "theme.bar.menus.menu.media.artist" = "#dcdfe1";
      "theme.bar.menus.menu.media.song" = "#dcdfe1";

      "theme.bar.menus.menu.power.buttons.shutdown.icon_background" = "#f94040";
      "theme.bar.menus.menu.power.buttons.shutdown.text" = "#f94040";

      "theme.osd.bar_overflow_color" = "#bf616a";
      "theme.osd.bar_empty_color" = "#2e3440";
      "theme.osd.bar_container" = "#2e3440";
      "theme.osd.bar_color" = "#dcdfe1";
      "theme.osd.border.color" = "#dcdfe1";
      "theme.osd.label" = "#dcdfe1";
      "theme.osd.icon_container" = "#dcdfe1";

      "theme.notification.background" = "#3b4252";
      "theme.notification.close_button.background" = "#bf616a";
      "theme.notification.labelicon" = "#dcdfe1";
      "theme.notification.label" = "#dcdfe1";
      "theme.notification.actions.background" = "#dcdef1";
      "theme.notification.text" = "#dcdef1";
    };
  };
}
