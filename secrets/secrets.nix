let
  light3r = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILRwZUMyc1pxcntOJXC+qShO6nSbvBEYwRQJCnk+S993";
in {
  "light3r-user-secrets.age".publicKeys = [ light3r ];
}
