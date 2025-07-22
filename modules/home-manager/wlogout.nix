{ config, pkgs, ... }:

{
  programs.wlogout = {
    enable = true;

    layout = [
      {
        "label" = "shutdown";
        "action" = "systemctl poweroff";
        "text" = "Shutdown";
        "keybind" = "s";
      }
      {
        "label" = "reboot";
        "action" = "systemctl reboot";
        "text" = "Reboot";
        "keybind" = "r";
      }
      {
        "label" = "suspend";
        "action" = "systemctl suspend";
        "text" = "Suspend";
        "keybind" = "u";
      }
      {
        "label" = "logout";
        "action" = "hyprctl dispatch exit";
        "text" = "Exit";
        "keybind" = "e";
      }
      {
        "label" = "hibernate";
        "action" = "systemctl hibernate";
        "text" = "Hibernate";
        "keybind" = "h";
      }

    ];

    style = ''
      @define-color foreground #D2DADD;
      @define-color background rgba(0,1,12,0.50);
      @define-color cursor #D2DADD;
      @define-color color0 #242A36;
      @define-color color1 #323844;
      @define-color color2 #163C56;
      @define-color color3 #555453;
      @define-color color4 #516671;
      @define-color color5 #746153;
      @define-color color6 #5F7177;
      @define-color color7 #B6C2C7;
      @define-color color8 #80888B;
      @define-color color9 #1F4F70;
      @define-color color10 #1E5173;
      @define-color color11 #72706F;
      @define-color color12 #6B8896;
      @define-color color13 #9B816F;
      @define-color color14 #7F969F;
      @define-color color15 #B6C2C7;

      * {
        font-family: "JetBrainsMono Nerd Font";
	      box-shadow: none;
      }

      window {
        background: none;
      }

      button {
	      color: @foreground;
        font-size:26px;
        margin: 120px 0px;
        background-repeat: no-repeat;
	      background-position: center;
	      background-size: 20%;
	      background-color: @color1;
        opacity: 0.8;
        border: none;
        border-radius: 0px;
        transition: 0.15s ease-in-out all;
      }

      button:focus {
        background-size: 25%;
        background-color: @color3;
      }

      button:hover {
        background-size: 35%;
        background-color: @color3;
        margin: 75px 0px;
        border-radius: 50px;
      }

      #shutdown {
        border-radius: 50px 0px 0px 50px;
	      background-image: image(url("icons/shutdown.png"));
      }
      #shutdown:hover {
        border-radius: 50px;
      }

      #reboot {
      	background-image: image(url("icons/reboot.png"));
      }
      
      #suspend {
      	background-image: image(url("icons/suspend.png"));
      }
       
      #logout {
      	background-image: image(url("icons/logout.png"));
      }
      
      #hibernate {
        border-radius: 0px 50px 50px 0px;
      	background-image: image(url("icons/hibernate.png"));
      }
      #hibernate:hover {
        border-radius: 50px;
      	background-image: image(url("icons/hibernate.png"));
      }
    '';
  };
}
