let
  msi-laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMjkU2SWJD8VdRSdtuSDY61MX673gbLu6rljuzWUhEHC";
  nixbook-pro = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHvcTV9j2DcLNQreiBZ7yOLLcbMmBlHfxu+/jdBqI7+t";
  home-server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJFbZsjTW06vV7aqwu+m6y/he1w/yLvF1kGbnHBNrrj/";
  systems = [ msi-laptop nixbook-pro home-server ];

in
{
  "zfs-key.age".publicKeys = systems;
  "nextcloud-key.age".publicKeys = systems;
  #"freshrss-key.age".publicKeys = systems;
  #"searx-key.age".publicKeys = systems;
}
