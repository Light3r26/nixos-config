{ config, ... }:

{
  services.freshrss = {
    enable = true;
    baseUrl = "/";
    virtualHost = "rss.jacoposoria.qzz.io";
    language = "it";
    #defaultUser = "light3r";
    passwordFile = config.age.secrets."freshrss_key.age".path;
  };

  age.secrets."freshrss_key.age" = {
    file = "/Nixos/secrets/freshrss_key.age";
    owner = "freshrss";
    group = "freshrss";
    mode = "0640";
  };
}
