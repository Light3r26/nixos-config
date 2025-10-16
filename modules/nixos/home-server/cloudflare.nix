{ config, pkgs, ...}:

{
  services.cloudflared = {
    enable = true;
    tunnels."77390380-d8f9-427f-88d8-2b8738fe39df" = {
      credentialsFile = "/home/nixos/.cloudflared/77390380-d8f9-427f-88d8-2b8738fe39df.json";
      default = "http_status:404";
      ingress = {
        "jacoposoria.qzz.io" = "http://localhost:80";
      };
    };
  };

  environment.systemPackages = [
    pkgs.cloudflared
  ];
}
