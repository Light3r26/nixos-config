let
  light3r = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC2MRoO0sHpm3T3vrnlJSk1HJJ333M7TD2P29aE4tkSH";
in {
  "user-secrets.age".publicKeys = [ light3r ];
}
