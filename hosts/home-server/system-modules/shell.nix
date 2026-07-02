{ config, ... }:

{
  environment.sessionVariables = {
    EDITOR = "nvim";
    TERM = "xterm";
  };
  
  programs.bash.shellAliases = {
    list-nixos-generations = "nixos-rebuild list-generations"; 
    ip-show = "curl ifconfig.me";
    vim = "nvim";
    vi = "nvim";
  };  
}
