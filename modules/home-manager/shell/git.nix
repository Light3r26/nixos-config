{ config, ... }:

{
  programs.git = {
    enable = true;
    diff-so-fancy.enable = true;
    #userName = "";
    #userEmail = "";
  };
}
