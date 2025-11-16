{
  users.users.remotebuild = {
    isSystemUser = true;
    group = "remotebuild";
    useDefaultShell = true;
    openssh.authorizedKeys.keyFiles = [ /root/.ssh/remotebuild.pub ]; 
  };
  
  users.groups.remotebuild = {};
  nix.settings.trusted-users = [ "remotebuild" ];
}
