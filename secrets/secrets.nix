let
  msi-laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMjkU2SWJD8VdRSdtuSDY61MX673gbLu6rljuzWUhEHC";
  nixbook-pro = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHvcTV9j2DcLNQreiBZ7yOLLcbMmBlHfxu+/jdBqI7+t";
  home-server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJFbZsjTW06vV7aqwu+m6y/he1w/yLvF1kGbnHBNrrj/";
  mountain-server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPFAIgnnR5aB0+8hGWpa5qcJ9vWRvtD2FO966NpGLvZb";
  home = [ msi-laptop nixbook-pro home-server ];
  mountain = [ msi-laptop nixbook-pro mountain-server ];

in
{
  "zfs-key.age".publicKeys = home;
  "nextcloud-key.age".publicKeys = home;
  "borg-immich-key.age".publicKeys = home;
  "ionos-traefik-key.age".publicKeys = home;
  "ionos-ddns-url.age".publicKeys = home;
  "traefik-dashboard-password.age".publicKeys = home;
  "home-server-tailscale-key.age".publicKeys = home;
  "mountain-server-tailscale-key.age".publicKeys = mountain;
  #"freshrss-key.age".publicKeys = local-systems;
  #"searx-key.age".publicKeys = local-systems;
}
