{ config, ... } :

{
  programs.rofi = {
    enable = true;
    # Configuration
    modes = [ "drun" ];
    font = "HarmonyOS Sans SC bold 12";
    extraConfig = {
      show-icons = true;
	    icon-theme = "Reversal-dark";
	    display-drun = "";
	    drun-display-format = "{name}";
	    sidebar-mode = false;
    };

    theme = {
      "*" = {
        #bg = "#232530"; substituted with the actual colors in the settings
        #fg = "#e8e8d3";
        #button = "#31344a";
	      accent = "#687363";

	      background-color = "#232530";
	      text-color = "#e8e8d3";
      };

      window = {
	      border-radius = "5px";
	      width =	"50%";
	      padding = "28px";
      };

      prompt = {
	      background-color = "#31344a";
	      enabled =	true;
	      padding =	"0.5% 32px 0% -0.5%";
	      font = "HarmonyOS Sans SC bold 12";
      };

      entry = {
    	  placeholder =	"Search";
	      background-color = "#31344a";
    	  placeholder-color = "#e8e8d3";
    	  expand = true;
    	  padding = "0.15% 0% 0% 0%";
      };

      inputbar = {
	      children = [ "prompt" "entry" ];
    	  background-color = "#31344a";
    	  expand = false;
    	  border-radius = "6px";
    	  margin = "0%";
    	  padding = "10px";
      };

      listview = {
    	  columns = "4";
    	  lines =	"3";
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
        background-color = "inherit";
	      text-color = "inherit";
      };

      element-text = {
    	  expand = true;
    	  horizontal-align = "0.5";
    	  vertical-align = "0.5";
    	  margin = "0.5% 0.5% -0.5% 0.5%";
        background-color = "inherit";
	      text-color = "inherit";
      };

      "element selected" = {
    	  background-color = "#31344a";
    	  border-radius = "6px";
      };
    };
  };


}
