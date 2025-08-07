{ pkgs, lib, ... }:

{
  programs.nvf = {
    enable = true;
   
    settings = {
      vim = {
        theme = {
          name = "gruvbox";
          style = "dark";
          #name = "tokyonight";
          #style = "night";
        };

        options = {
          autoindent = true;
          tabstop = 2;
          shiftwidth = 2;
          softtabstop = 2;
          expandtab = true;
        };

        clipboard = {
          enable = true;
          registers = "unnamedplus";
        };

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
      };
    };
  };
}
