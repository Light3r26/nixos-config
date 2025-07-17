{ pkgs, lib, ... }:

{
  programs.nvf = {
    enable = true;

    settings = {
      vim = {
        # Theme
        theme = {
	  enable = true;
          name = "gruvbox";
          style = "dark";
	};

        options = {
          autoindent = true;
          tabstop = 2;
        };

        clipboard.enable = true;

	lsp.enable = true;

        # Languages
        languages = {
	  enableTreesitter = true;
	  enableLSP = true;
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
