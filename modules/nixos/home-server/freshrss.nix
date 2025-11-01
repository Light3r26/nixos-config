{ config, ... }:

{
  services.freshrss = {
    enable = true;
    baseUrl = "/";
    #database.port = 3306;
    language = "it";
  };
}
