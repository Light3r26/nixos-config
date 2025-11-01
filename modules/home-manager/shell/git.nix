{ config, ... }:

{
  programs.git = {
    enable = true;
    #userName = "";
    #userEmail = "";
  };

  programs.diff-so-fancy = {
    enable = true;
    #enableShellintegration = true;
  };
}
