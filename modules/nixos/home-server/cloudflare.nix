{config, ...}: {
  services.cloudflared = {
    enable = true;
    tunnels."4ba317d9-4916-4b68-bdca-8721e25ada07" = {
      certificateFile = config.age.secrets."cloudflared-cert.age".path;
      credentialsFile = config.age.secrets."tunnel-credentials.age".path;
      default = "http_status:404";
      ingress = {
        "jacoposoria.qzz.io" = "http://localhost:80";
        "music.jacoposoria.qzz.io" = "http://localhost:80";
        "photos.jacoposoria.qzz.io" = "http://localhost:80";
        "rss.jacoposoria.qzz.io" = "http://localhost:80";
      };
    };
  };

  age.secrets = {
    "cloudflared-cert.age".file = "/Nixos/secrets/cloudflare-cert.age";
    "tunnel-credentials.age".file = "/Nixos/secrets/tunnel-credentials.age";
  };
}
