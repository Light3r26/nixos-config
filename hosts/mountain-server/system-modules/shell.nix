{ config, ... }:

{
  environment.sessionVariables = {
    EDITOR = "nvim";
    TERM = "xterm";
  };
  
  programs.bash.shellAliases = {
    list-generations = "nixos-rebuild list-generations"; 
    ip-show = "curl ifconfig.me";
    vim = "nvim";
    vi = "nvim";
  };  
}
