let
  local = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEXrWi2ElewP54zP0nmLcVoml/65avJ8hHqGcZ1UJtp/";
  remote = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILRwZUMyc1pxcntOJXC+qShO6nSbvBEYwRQJCnk+S993";
  systems = [ local remote ];

in
{
  "zfs_key.age".publicKeys = systems;
  "freshrss_key.age".publicKeys = systems;
}
