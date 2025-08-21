{ config, lib, ... }:

let
  inherit (config.lib.formats.rasi) mkLiteral;
in {
  programs.rofi = {
    enable = true;
    font = "HarmonyOS Sans SC bold 12";
    modes = [ "drun" ];

    extraConfig = {
      show-icons = true;
      icon-theme = "Reversal-dark";
      display-drun = "";
      drun-display-format = "{name}";
      sidebar-mode = false;
    };

    theme = {
      "*" = {
        background-color = mkLiteral "#2E3440"; # nord0
        text-color       = mkLiteral "#ECEFF4"; # nord6
      };

      window = {
        border-radius = mkLiteral "5px";
        width         = mkLiteral "50%";
        padding       = mkLiteral "28px";
      };

      prompt = {
        background-color = mkLiteral "#3B4252"; # nord1
        enabled          = true;
        padding          = mkLiteral "0.5% 32px 0% 0%"; # niente negativi
        font             = "HarmonyOS Sans SC bold 12";
      };

      entry = {
        placeholder       = "Search";
        background-color  = mkLiteral "#3B4252";
        placeholder-color = mkLiteral "#ECEFF4";
        expand            = true;
        padding           = mkLiteral "0.15% 0% 0% 0%";
      };

      inputbar = {
        children         = map mkLiteral [ "prompt" "entry" ]; # identificatori non quotati
        background-color = mkLiteral "#3B4252";
        expand           = false;
        border-radius    = mkLiteral "6px";
        margin           = mkLiteral "0%";
        padding          = mkLiteral "10px";
      };

      listview = {
        columns = 4;  # interi OK
        lines   = 3;
        cycle   = false;
        dynamic = true;
        layout  = mkLiteral "vertical";
      };

      mainbox = {
        children = map mkLiteral [ "inputbar" "listview" ];
        spacing  = mkLiteral "2%";
        padding  = mkLiteral "2% 1% 2% 1%";
      };

      element = {
        orientation = mkLiteral "vertical";
        padding     = mkLiteral "2% 0% 2% 0%";
      };

      element-icon = {
        size             = mkLiteral "48px";
        horizontal-align = mkLiteral "0.5";  # era float → ora literal
      };

      element-text = {
        expand           = true;
        horizontal-align = mkLiteral "0.5";
        vertical-align   = mkLiteral "0.5";
        margin           = mkLiteral "0.5% 0.5% 0% 0.5%"; # rimosso -0.5%
      };

      "element selected" = {
        background-color = mkLiteral "#3B4252";
        border-radius    = mkLiteral "6px";
      };
    };
  };
}
