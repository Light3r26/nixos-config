let
  domain = "jacoposoria.it";

in
{
  services.headscale = {
    enable = true;
    port = 3492;
    settings = {
      server_url = "https://headscale.${domain}";
      dns.base_domain = domain;
    };
  };
}
