{ pkgs, lib, ... }:

{
  programs.nvf = {
    enable = true;
   
    settings = {
      vim = {
        theme = {
          name = "tokyonight";
          style = "night";
        };

        options = {
          autoindent = true;
          tabstop = 2;
          shiftwidth = 2;
          softtabstop = 2;
          expandtab = true;
          termguicolors = true;
          background = "dark";
        };

        clipboard.enable = true;

        lsp.enable = true;

        # Languages
        languages = {
          enableTreesitter = true;
          nix.enable = true;
          python.enable = true;
          clang.enable = true;
          markdown.enable = true;
        };

        # Plugins
        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
        treesitter.enable = true;

        # Forces the theme
        initCommands = ''
          colorscheme tokyonight
        '';
      };
    };
  };
}
