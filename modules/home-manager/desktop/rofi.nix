{ config, ... }:

{
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
        background-color = "#2E3440"; # nord0
        text-color = "#ECEFF4";       # nord6
      };

      window = {
        border-radius = "5px";
        width = "50%";
        padding = "28px";
      };

      prompt = {
        background-color = "#3B4252"; # nord1
        enabled = true;
        padding = "0.5% 32px 0% 0%";  # rimosso -0.5%
        font = "HarmonyOS Sans SC bold 12";
      };

      entry = {
        placeholder = "Search";
        background-color = "#3B4252"; # nord1
        placeholder-color = "#ECEFF4"; # nord6
        expand = true;
        padding = "0.15% 0% 0% 0%";
      };

      inputbar = {
        children = [ "prompt" "entry" ];
        background-color = "#3B4252"; # nord1
        expand = false;
        border-radius = "6px";
        margin = "0%";
        padding = "10px";
      };

      listview = {
        columns = 4;
        lines = 3;
        cycle = false;
        dynamic = true;
        layout = "vertical";
      };

      mainbox = {
        children = [ "inputbar" "listview" ];
        spacing = "2%";
        padding = "2% 1% 2% 1%";
      };

      element = {
        orientation = "vertical";
        padding = "2% 0% 2% 0%";
      };

      element-icon = {
        size = "48px";
        horizontal-align = "0.5";
      };

      element-text = {
        expand = true;
        horizontal-align = "0.5";
        vertical-align = "0.5";
        margin = "0.5% 0.5% 0% 0.5%"; # tolto -0.5%
      };

      "element selected" = {
        background-color = "#3B4252"; # nord1
        border-radius = "6px";
      };
    };
  };
}
