{
  programs.nvf = {
    enable = true;

    settings.vim = {
      viAlias = true;
      vimAlias = true;

      theme = {
        enable = true;
        name = "nord";
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

      lsp = {
        enable = true;
        lspkind.enable = true; #VS-Code-style icons
        trouble.enable = true;
        lspSignature.enable = true; # Function signatures hints
        otter-nvim.enable = true;
        mappings.goToDefinition = "<leader>gd";
      };

      languages = {
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;
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
          lsp.servers = ["roslyn_ls"];
        };
        typst = {
          enable = true;
          extensions.typst-preview-nvim.enable = true;
        };
      };

      # Plugins (<leader> is the spacebar)
      dashboard.alpha = {
        enable = true;
        theme = "dashboard";
      };

      statusline.lualine.enable = true;

      autocomplete.nvim-cmp = {
        enable = true;
        sources = {
          luasnip = null;
          nvim-cmp = null;
          buffer = "[Buffer]";
          path = "[Path]";
        };
      };

      snippets.luasnip.enable = true;

      treesitter = {
        enable = true;
        context.enable = true;
      };

      telescope.enable = true;

      filetree.nvimTree = {
        enable = true;
        #openOnSetup = true;
        mappings.focus = "<leader>h";
      };

      git = {
        enable = true;
        gitsigns.enable = true;
      };

      binds.whichKey.enable = true;

      notify.nvim-notify.enable = true;

      utility = {
        diffview-nvim.enable = true;
        surround.enable = true;
        smart-splits.enable = true;
        motion.leap.enable = true;
      };

      ui = {
        noice.enable = true; # Alternative command line
        colorizer.enable = true; # Color highlighter
      };

      visuals = {
        nvim-web-devicons.enable = true;
        highlight-undo.enable = true;
        indent-blankline.enable = true;
      };

      diagnostics = {
        enable = true;
        config.virtual_text = true;
      };
    };
  };
}
