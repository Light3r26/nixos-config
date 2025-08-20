{ pkgs, lib, ... }:

{
  programs.nvf = {
    enable = true;
   
    settings = {
      vim = {
        theme = {
          enable = true;
          name = "everforest";
          style = "hard";
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

        filetree.nvimTree = {
          enable = true;
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
