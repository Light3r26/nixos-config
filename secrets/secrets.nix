let
  msi-laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMjkU2SWJD8VdRSdtuSDY61MX673gbLu6rljuzWUhEHC";
  #nixbook-pro = 
  #remote = "";
  systems = [ msi-laptop ];

in
{
  "zfs-key.age".publicKeys = systems;
  #"freshrss-key.age".publicKeys = systems;
  #"searx-key.age".publicKeys = systems;
}
