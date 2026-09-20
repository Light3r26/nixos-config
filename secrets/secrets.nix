let
  msi-laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMjkU2SWJD8VdRSdtuSDY61MX673gbLu6rljuzWUhEHC";
  nixbook-pro = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHvcTV9j2DcLNQreiBZ7yOLLcbMmBlHfxu+/jdBqI7+t";
  home-server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJFbZsjTW06vV7aqwu+m6y/he1w/yLvF1kGbnHBNrrj/";
  mountain-server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPFAIgnnR5aB0+8hGWpa5qcJ9vWRvtD2FO966NpGLvZb";
  home = [ msi-laptop nixbook-pro home-server ];
  mountain = [ msi-laptop nixbook-pro mountain-server ];

in
{
  # Home and Mountain Server
  "zfs-key.age".publicKeys = home;
  "nextcloud-key.age".publicKeys = home;
  "borg-immich-key.age".publicKeys = home;
  "frigate-env.age".publicKeys = home;
  "searx-key.age".publicKeys = home;
  "kitchenowl-jwt-key.age".publicKeys = home;
  #"freshrss-key.age".publicKeys = local-systems;
  "home-server-tailscale-key.age".publicKeys = home;
  "mountain-server-tailscale-key.age".publicKeys = mountain;
  "hostinger-ddns-key.age".publicKeys = home;
  #"hostinger-traefik-key.age".publicKeys = home; maybe?
  #"mqtt-frigate-password.age".publicKeys = home;
  #"mqtt-ha-password.age".publicKeys = home;
}
