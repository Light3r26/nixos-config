{
  services.searx = {
    enable = true;
    redisCreateLocally = true;
    settings.server = {
      bind_address = "127.0.0.1";
      port = 5313;
      secret_key
      # port = yourPort;
    };
  };
}
