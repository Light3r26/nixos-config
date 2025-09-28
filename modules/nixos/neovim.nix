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
        dashboard.alpha = {
          enable = true;
          theme = "dashboard";

        };
        statusline.lualine.enable = true;
        autocomplete.nvim-cmp.enable = true;
        treesitter.enable = true;
        telescope = {
          enable = true;
          mappings = {
            findFiles = "<leader>f";
            liveGrep = "<leader>g"; 
          };
        };
        filetree.nvimTree = {
          enable = true;
          openOnSetup = true;
          mappings.focus = "<leader>h";
        };

        lsp = {
          enable = true;
          mappings.goToDefinition = "<leader>gd";
        };
        languages = {
          enableFormat = true;
          enableTreesitter = true;
          # Languages
          nix.enable = true;
          python.enable = true;
          clang.enable = true;
          markdown.enable = true;
          go.enable = true;
          #html.enable = true;
          #css.enable = true;
          bash.enable = true;
          csharp = {
            enable = true;
            lsp.enable = true;
            lsp.server = "omnisharp";
          };
        };

        diagnostics = {
          enable = true;
          config.virtual_text = true;
        };
      };
    };
  };
}
