{ config, lib, ... }:

let
  inherit (config.lib.formats.rasi) mkLiteral;
  nord0 = mkLiteral "#2E3440";
  nord1 = mkLiteral "#3B4252";
  nord6 = mkLiteral "#ECEFF4";
  selected-font = "HarmonyOS Sans SC bold 12";

in {
  programs.rofi = {
    enable = true;
    font = selected-font;
    modes = [ "drun" ];

    extraConfig = {
      show-icons = true;
      display-drun = "";
      drun-display-format = "{name}";
      sidebar-mode = false;
    };

    theme = {
      "*" = {
        background-color = nord0;
        text-color = nord6;
      };

      window = {
        border-radius = mkLiteral "5px";
        width = mkLiteral "50%";
        padding = mkLiteral "28px";
      };

      prompt = {
        background-color = nord1;
        enabled = true;
        padding = mkLiteral "0.5% 32px 0% 0%"; 
        font = selected-font;
      };

      entry = {
        placeholder = "Search";
        background-color = nord1;
        placeholder-color = nord6;
        expand = true;
        padding = mkLiteral "0.15% 0% 0% 0%";
      };

      inputbar = {
        children = map mkLiteral [ "prompt" "entry" ];
        background-color = nord1;
        expand = false;
        border-radius = mkLiteral "6px";
        margin = mkLiteral "0%";
        padding = mkLiteral "10px";
      };

      listview = {
        columns = 4;
        lines = 3;
        cycle = false;
        dynamic = true;
        layout = mkLiteral "vertical";
      };

      mainbox = {
        children = map mkLiteral [ "inputbar" "listview" ];
        spacing = mkLiteral "2%";
        padding = mkLiteral "2% 1% 2% 1%";
      };

      element = {
        orientation = mkLiteral "vertical";
        padding = mkLiteral "2% 0% 2% 0%";
      };

      element-icon = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
        size = mkLiteral "48px";
        horizontal-align = mkLiteral "0.5";
      };

      element-text = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
        expand = true;
        horizontal-align = mkLiteral "0.5";
        vertical-align = mkLiteral "0.5";
        margin = mkLiteral "0.5% 0.5% 0% 0.5%";
      };

      "element selected" = {
        background-color = nord1;
        border-radius = mkLiteral "6px";
      };
    };
  };
}
