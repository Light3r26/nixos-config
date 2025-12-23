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
        formatOnSave = true;
        lspkind.enable = true; #VS-Code-style icons
        lspsaga.enable = true; 
        trouble.enable = true;
        lspSignature.enable = true;
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
          lsp.servers = [ "roslyn_ls" ];
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

      autocomplete.nvim-cmp.enable = true;

      snippets.luasnip.enable = true;

      treesitter = {
        enable = true;
        context.enable = true;
      };

      telescope = {
        enable = true;
        mappings = {
          findFiles = "<leader>f";
          liveGrep = "<leader>g"; 
        };
      };

      filetree.nvimTree = {
        enable = true;
        #openOnSetup = true;
        mappings.focus = "<leader>h";
      };

      git = {
        enable = true;
        gitsigns.enable = true;
      };

      autopairs.nvim-autopairs.enable = true;

      binds = {
        whichKey.enable = true;
        cheatsheet.enable = true;
      };

      nvim-notify.enable = true;
      
      utility = {
        diffview-nvim.enable = true;
        yanky-nvim.enable = true;
        surround.enable = true;
        smart-splits.enable = true;
        nvim-biscuits.enable = true; # Closing bracket context
        motion = {
          leap.enable = true;
          precognition.enable = true; # Helps buffer navigation
        };
      };


      ui = {
        noice.enable = true; # Alternative command line 
        colorizer.enable = true; # Color highlighter
        modes-nvim.enable = true; # Vim modes colors
      };

      diagnostics = {
        enable = true;
        config.virtual_text = true;
      };
    };
  };
}
