{
  services.tandoor-recipes = {
    enable = true;
    address = "0.0.0.0";
    port = 3301;
    extraConfig = {
      MEDIA_ROOT = "/var/lib/tandoor-recipes/media";
      ALLOWED_HOSTS = "localhost,home-server.local";
      ENABLE_SIGNUP = "1";
    };
  };
}
