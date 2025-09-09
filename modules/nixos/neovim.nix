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

        # Plugins (<leader> is the spacebar)
        statusline.lualine.enable = true;
        autocomplete.nvim-cmp.enable = true;
        treesitter.enable = true;
        telescope = {
          enable = true;
          mappings.findFiles = "<leader>f";
        };
        filetree.nvimTree = {
          enable = true;
          mappings.focus = "<leader>h";
        };

        lsp.enable = true;
        languages = {
          enableFormat = true;
          enableTreesitter = true;
          # Languages
          nix.enable = true;
          python.enable = true;
          clang.enable = true;
          markdown.enable = true;
          go.enable = true;
          html.enable = true;
          css.enable = true;
        };
      };
    };
  };
}
