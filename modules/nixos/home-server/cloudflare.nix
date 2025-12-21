{ pkgs, ...}:

{
  services.cloudflared = {
    enable = true;
    tunnels."77390380-d8f9-427f-88d8-2b8738fe39df" = {
      credentialsFile = "/home/nixos/.cloudflared/77390380-d8f9-427f-88d8-2b8738fe3
9df.json";
      default = "http_status:404";
      ingress = {
        "jacoposoria.qzz.io" = "http://localhost:80";
        "music.jacoposoria.qzz.io" = "http://localhost:80";
        "photos.jacoposoria.qzz.io" = "http://localhost:80";
        "rss.jacoposoria.qzz.io" = "http://localhost:80";
      };
    };
  };

  environment.systemPackages = [
    pkgs.cloudflared
  ];
}
