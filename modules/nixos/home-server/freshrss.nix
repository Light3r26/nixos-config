{ config, ... }:

{
  services.freshrss = {
    enable = true;
    baseUrl = "https://rss.jacoposoria.qzz.io";
    #database.port = 3306;
    language = "it";
    passwordFile = config.age.secrets."freshrss_key.age".path;
  };

  age.secrets."freshrss_key.age".file = "/Nixos/secrets/freshrss_key.age";
}
