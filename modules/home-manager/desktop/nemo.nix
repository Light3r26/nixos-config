{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (nemo-with-extensions.override {
      extensions = with pkgs; [ 
        nemo-fileroller # For archives
        nemo-preview
        nemo-emblems
      ];
    })
  ];

  #services.gvfs.enable = true;  # enables trash:/// support

  dconf.settings = {
    "org/cinnamon/desktop/applications/terminal" = {
      exec = "kitty";
    };
    "org/nemo/desktop" = {
      trash-icon-visible = true;
    };
  };

  home.file.".local/share/nemo/actions/open-as-root.nemo_action".text = ''
    [Nemo Action]
    Name=Open as Root
    Comment=Open folder with administrator privileges
    Exec=pkexec nemo %F
    Icon-Name=system-file-manager
    Selection=None
    Extensions=dir;
    Quote=double
  '';
}
