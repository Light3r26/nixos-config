{ config, ... }:

{
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us,it";
    variant = "intl";
  };

  # Configure console keymap
  console.keyMap = "us";
}
