let
  home-server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFUTg4rYEw6wB76rZ61mjVzseaiFVQdbictkdaI/VK3+";

in
{
  "hostname-id.age".publicKeys = [ home-server ];
  #"zfs-key.age".publicKeys = [ home-server ];
}
