{
  programs.hyprpanel = {
    enable = true;
    systemd.enable = true;
    settings = {
      layout = { 
        bar.layouts = {
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

      bar.customModules.storage.paths = [ "/" ];

      bar = {
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
        bar = {
          transparent = true; # or background = "#323844",
          floating = false;
          enableShadow = false;
          location = "top";

          buttons = {
            style = "default";
            volume.border = "#b4beff";

            dashboard = {
              background = "#323844";
              icon = "#5176c4";
              border = "#5177c4";
            };

            workspaces = {
              background = "#323844";
              numbered_active_highlighted_text_color = "#dcdfe1";
              available = "#dcdfe1";
              occupied = "#dcdfe1";
              active = "#151a27";
              hover = "#151a27";
              pill.active_width = "12em";
              pill.height = "4em";
              pill.width = "4em";
            };

            media = {
              background = "#323844";
              text = "#dcdfe1";
              icon = "#b48ead";
            };

            volume = {
              background = "#323844";
              text = "#dcdfe1";
              icon = "#dcdfe1";
            };

            network = {
              background = "#323844";
              text = "#dcdfe1";
              icon = "#88c0d0";
            };

            bluetooth = {
              background = "#323844";
              text = "#dcdfe1";
              icon = "#00bfff";
            };

            systray = {
              background = "#323844";
              customIcon = "#dcdfe1";
            };

            clock = {
              background = "#323844";
              text = "#dcdfe1";
              icon = "#dcdfe1";
            };

            notifications = {
              background = "#323844";
              total = "#f04747";
              icon = "#dcdfe1";
            };

            battery = {
              text = "#dcdfe1";
              background = "#323844";
              icon = "#27cd40";
            };

            modules = {
              ram = {
                text = "#dcdfe1";
                icon = "#ebcb8b";
                background = "#323844";
              };

              cpu = {
                text = "#dcdfe1";
                icon = "#d08670";
                background = "#323844";
              };

              cpuTemp = {
                background = "#323844";
                text = "#dcdfe1";
                icon = "#bf616a";
              };

              power = {
                icon = "#f94040";
                background = "#323844";
              };
            };
          };
        };
        menus = {
          buttons.active = "#81a1c1";
          label = "#dcdef1";
          popover.text = "#dcdef1";
          tooltip.text = "#dcdef1";
          menu.dashboard.controls.volume.background = "#4c566a";
          background = "#2e3440";
          cards = "#3b4252";
          text = "#dcdef1";

          menu = {
            dashboard = {
              background.color = "#2e3440";
              card.color = "#3b4252";
              profile.name = "#dcdfe1";
              controls.wifi.background = "#88c0d0";
              controls.bluetooth.background = "#00bfff";
              controls.notifications.background = "#dcdef1";
              monitors.gpu.icon = "#a3be8c";
              monitors.gpu.bar = "#a3be8c";
              monitors.gpu.label = "#a3be8c";
              monitors.ram.icon = "#ebcb8b";
              monitors.cpu.icon = "#d08670";
              monitors.cpu.bar = "#d08670";
              monitors.cpu.label = "#d08670";
              monitors.ram.bar = "#ebcb8b";
              monitors.ram.label = "#ebcb8b";
              monitors.disk.icon = "#b48ead";
              monitors.disk.bar = "#b48ead";
              monitors.disk.label = "#b48ead";
              powermenu.shutdown = "#bf616a";
              powermenu.restart = "#d08670";
              powermenu.logout = "#a3be8c";
              powermenu.sleep = "#5e81ac";
            };
            
            network = {
              card.color = "#3b4252";
              background.color = "#2e3440";
              text = "#dcdfe1";
              label.color = "#88c0d0";
              listitems.active = "#88c0d0";
              switch.enabled = "#88c0d0";
              icons.active = "#88c0d0";
              scroller.color = "#88c0d0";
              iconbuttons.active = "#88c0d0";
              icons.passive = "#cdd6f4";
            };

            bluetooth = {
              card.color = "#3b4252";
              background.color = "#2e3440";
              label.color = "#00bfff";
              listitems.active = "#00bfff";
              icons.active = "#00bfff";
              iconbutton.active = "#00bfff";
              scroller.color = "#00bfff";
              switch.enabled = "#00bfff";
              iconbutton.passive = "#dcdfe1";
              text = "#dcdfe1";
            };

            battery = {
              text = "#dcdfe1";
              label.color = "#dcdfe1";
              listitems.active = "#27cd40";
              icons.active = "#f9e2af";
              slider.primary = "#ebcb8b";
              background.color = "#2e3440";
              card.color = "#3b4252";
            };

            volume = {
              text = "#dcdfe1";
              card.color = "#3b4252";
              label.color = "#dcdfe1";
              background.color = "#2e3440";
              listitems.active = "#81a1c1";
              audio_slider.primary = "#81a1c1";
              iconbutton.active = "#81a1c1";
              input_slider.primary = "#81a1c1";
            };

            systray.dropdownmenu = {
              background = "#2e3440";
              text = "#dcdfe1";
              divider = "#2e3440";
            };

            clock = {
              background.color = "#2e3440";
              card.color = "#3b4252";
              time.time = "#dcdfe1";
              calendar = { 
                yearmonth = "#dcdfe1";
                weekdays = "#81a1c1";
                paginator = "#81a1c1";
                currentday = "#81a1c1";
                days = "#dcdef1";
              };
            };

            notifications = {
              card = "#3b4252";
              switch.enabled = "#a3be8c";
              clear = "#bf616a";
              background = "#2e3440";
              scrollbar.color = "#3b4252";
              label = "#dcdfe1";
              pager.button = "#dcdfe1";
            };

            media = {
              card.color = "#3b4252";
              background.color = "#2e3440";
              slider.primary = "#dcdfe1";
              buttons.background = "#dcdfe1";
              album = "#dcdfe1";
              timestamp = "#dcdfe1";
              artist = "#dcdfe1";
              song = "#dcdfe1";
            };

            power = {
              buttons.shutdown.icon_background = "#f94040";
              buttons.shutdown.text = "#f94040";
            };
          };
        };
        osd = {
          bar_overflow_color = "#bf616a";
          bar_empty_color = "#2e3440";
          bar_container = "#2e3440";
          bar_color = "#dcdfe1";
          border.color = "#dcdfe1";
          label = "#dcdfe1";
          icon_container = "#dcdfe1";
        };
        notification = {
          background = "#3b4252";
          close_button.background = "#bf616a";
          labelicon = "#dcdfe1";
          label = "#dcdfe1";
          actions.background = "#dcdef1";
          text = "#dcdef1";
        };
      };
    };
  };
}
