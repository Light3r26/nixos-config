let
  domain = "jacoposoria.it";

in
{
  services.headscale = {
    enable = true;
    port = 3492;
    settings = {
      server_url = "https://headscale.${domain}";
      logtail.enabled = true;

      dns = {
        base_domain = domain;
        nameservers = {
	  global = [
            "1.1.1.1"
	    "1.0.0.1"
	    "2606:4700:4700::1111"
	    "2606:4700:4700::1001"
	  ];
	};
      };
    };
  };
}
