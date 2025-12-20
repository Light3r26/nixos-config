{
  virtualisation.virtualbox = {
    host = {
      enable = true;
      enableExtensionPack = true;
    };
  };

  users.extraGroups.vboxusers.members = [ "light3r" ];

  # Needed to have faster boot with NixOS virtualbox module active
  systemd.services.NetworkManager-wait-online.serviceConfig.TimeoutSec = "1s";
}
